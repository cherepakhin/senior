WireMock – швейцарский нож в арсенале тестировщика.
Часть 1 https://habr.com/ru/companies/rostelecom/articles/679276/
Часть 2 https://habr.com/ru/company/rostelecom/blog/679330/

Другая статья
https://habr.com/ru/companies/beeline_tech/articles/878368/

Для unit тестов хватило Mockito.

Разрабатываю сервис и он взаимодействует с удаленным сервисом.
Удаленный сервис может быть перегружен, лимитирован или вообще периодически в отключке или авторизация.
Так вот для эмуляции стороннего сервиса и нужен wiremock.

~/tools$ java -jar wiremock-jre8-standalone-2.33.2.jar
SLF4J: Failed to load class "org.slf4j.impl.StaticLoggerBinder".
SLF4J: Defaulting to no-operation (NOP) logger implementation
SLF4J: See http://www.slf4j.org/codes.html#StaticLoggerBinder for further details.
 /$$      /$$ /$$                     /$$      /$$                     /$$
| $$  /$ | $$|__/                    | $$$    /$$$                    | $$
| $$ /$$$| $$ /$$  /$$$$$$   /$$$$$$ | $$$$  /$$$$  /$$$$$$   /$$$$$$$| $$   /$$
| $$/$$ $$ $$| $$ /$$__  $$ /$$__  $$| $$ $$/$$ $$ /$$__  $$ /$$_____/| $$  /$$/
| $$$$_  $$$$| $$| $$  \__/| $$$$$$$$| $$  $$$| $$| $$  \ $$| $$      | $$$$$$/
| $$$/ \  $$$| $$| $$      | $$_____/| $$\  $ | $$| $$  | $$| $$      | $$_  $$
| $$/   \  $$| $$| $$      |  $$$$$$$| $$ \/  | $$|  $$$$$$/|  $$$$$$$| $$ \  $$
|__/     \__/|__/|__/       \_______/|__/     |__/ \______/  \_______/|__/  \__/

port:                         8080
enable-browser-proxying:      false
disable-banner:               false
no-request-journal:           false
verbose:                      false

Описание:
https://wiremock.org/docs/standalone/

Mock удаленного сервиса. Без такой утилиты я бы написал простенькое Spring Boot приложение с настраиваемым поведением. Но это намного более удобный инструмент.

Статья на Хабре.
https://habr.com/ru/companies/beeline_tech/articles/878368/
------------------------------------------------------------------------
Запуск:

start$ cat start.sh
java -jar ../wiremock-standalone-3.12.1.jar

Настройка:

через curl:

$ curl -X POST \
	--data '{ "request": { "url": "/get/this", "method": "GET" }, "response": { "status": 200, "body": "Here it is!\n" }}' \
	http://localhost:8080/__admin/mappings

Проверка:

$ curl http://localhost:8080/get/this

------------------------------------------------------------------------
Через httpie:

$ cat test1.json
{
  "request": {
	"url": "/get/this", "method": "GET"
	},
  "response": {
	"status": 200,
	"body": "Here it is!\n"
   }
}

$ http POST http://localhost:8080/__admin/mappings < test1.json

HTTP/1.1 201 Created
Content-Type: application/json
Transfer-Encoding: chunked
Vary: Origin

{
    "id": "8aa9519b-1de3-47a9-abc0-30085ec5e526",
    "request": {
        "method": "GET",
        "url": "/get/this"
    },
    "response": {
        "body": "Here it is!\n",
        "status": 200
    },
    "uuid": "8aa9519b-1de3-47a9-abc0-30085ec5e526"
}


Проверка:
$ http :8080/get/this
HTTP/1.1 200 OK
Content-Encoding: gzip
Matched-Stub-Id: 8aa9519b-1de3-47a9-abc0-30085ec5e526
Transfer-Encoding: chunked

Here it is!

------------------------------
В интеграционных тестах:
https://wiremock.org/docs/quickstart/java-junit/

import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

...

@Rule
public WireMockRule wireMockRule = new WireMockRule(8089); // No-args constructor defaults to port 8080

@Test
public void exampleTest() {
    // Setup the WireMock mapping stub for the test
    stubFor(post("/my/resource")
        .withHeader("Content-Type", containing("xml"))
        .willReturn(ok()
            .withHeader("Content-Type", "text/xml")
            .withBody("<response>SUCCESS</response>")));

    // Setup HTTP POST request (with HTTP Client embedded in Java 11+)
    final HttpClient client = HttpClient.newBuilder().build();
    final HttpRequest request = HttpRequest.newBuilder()
        .uri(wiremockServer.url("/my/resource"))
        .header("Content-Type", "text/xml")
        .POST().build();

    // Send the request and receive the response
    final HttpResponse<String> response =
            client.send(request, HttpResponse.BodyHandlers.ofString());

    // Verify the response (with AssertJ)
    assertThat(response.statusCode()).as("Wrong response status code").isEqualTo(200);
    assertThat(response.body()).as("Wrong response body").contains("<response>SUCCESS</response>");
}

------------------------------
С аннотацией

@WireMockTest(httpsEnabled = true, httpsPort = 8443)
public class HttpsFixedPortDeclarativeWireMockTest {
    ...
}

------------------------------
Эмуляция ХОСТА(!)
Типа, мой сервис обращается к внешнему сервису и в зависимости от его ответом поведение моего сервиса меняется
Java тест.

@WireMockTest(proxyMode = true)
public class JUnitJupiterExtensionJvmProxyDeclarativeTest {

  CloseableHttpClient client;

  @BeforeEach
  void init() {
    client = HttpClientBuilder.create()
      .useSystemProperties() // This must be enabled for auto proxy config
      .build();
  }

  @Test
  void configures_jvm_proxy_and_enables_browser_proxying() throws Exception {
    stubFor(get("/things")
      .withHost(equalTo("one.my.domain"))		// хост = one.my.domain
      .willReturn(ok("1")));

    stubFor(get("/things")
      .withHost(equalTo("two.my.domain"))		// хост = two.my.domain
      .willReturn(ok("2")));

    assertThat(getContent("http://one.my.domain/things"), is("1"));
    assertThat(getContent("http://two.my.domain/things"), is("2"));
  }

  private String getContent(String url) throws Exception {
    try (CloseableHttpResponse response = client.execute(new HttpGet(url))) { // CloseableHttpClient клиент типа httpie
      return EntityUtils.toString(response.getEntity());
    }
  }
}

------------------------------------------------
Настройка Before, After

public class MyMockApi extends WireMockExtension {

    public MyMockApi(WireMockExtension.Builder builder) {
      super(builder);
    }

    @Override
    protected void onBeforeAll(WireMockRuntimeInfo wireMockRuntimeInfo) {
      // Do things before any tests have run
    }

    @Override
    protected void onBeforeEach(WireMockRuntimeInfo wireMockRuntimeInfo) {
      // Do things before each test
    }

    @Override
    protected void onAfterEach(WireMockRuntimeInfo wireMockRuntimeInfo) {
      // Do things after each test
    }

    @Override
    protected void onAfterAll(WireMockRuntimeInfo wireMockRuntimeInfo) {
      // Do things after all tests have run
    }

	...tests...
}


