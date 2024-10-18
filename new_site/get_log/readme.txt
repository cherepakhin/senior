--------------- Перенести в отдельную статью, по ходу вспомнилось
О получении лога.
1. Через стандартные инструменты получения протоколов работы GrayLog и т.п. И тут разработчик сам должен позаботиться о качестве логов. Вывод в лог переменных при возникновении ошибки (пример:
log.error("Not found product code={} name={}", code, name); )
2. Через хак получения лога через служебный REST, в случае когда НЕТ оперативного доступа к сервисам логирования на prod:

@RestController
@Slf4j
public class LogController {

    @Value("${user.dir}")
    String basedir;

    @GetMapping(value = {"/log"})
    public String getLog(
        @RequestParam(name = "path", defaultValue = "log/app.log/spring.log") String path)
        throws IOException {
        File current = new File(basedir + File.separator + path);
        log.info(current.getAbsolutePath());
        return new String(Files.readAllBytes(current.toPath()));
    }
}

Понятно, что это закладка, но это решение должно быть согласовано с заказчиком и применены соответсвующие меры безопасности. Еще пример https://www.baeldung.com/spring-boot-changing-log-level-at-runtime.
Есть способ полученя лога через Spring Boot Admin https://www.baeldung.com/spring-boot-changing-log-level-at-runtime#3-using-spring-boot-admin.