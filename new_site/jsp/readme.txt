============================
Определение тега helloWorld:
============================
/usr/share/tomcat9/webapps/examples/WEB-INF/classes/jsp2/examples/simpletag/HelloWorldSimpleTag.java

package jsp2.examples.simpletag;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * SimpleTag handler that prints "Hello, world!"
 * HelloWorldSimpleTag!!! см.ниже в jsp2-example-taglib.tld
 */
public class HelloWorldSimpleTag extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException, IOException {
        getJspContext().getOut().write( "Hello, world!" );
    }
}
------------------
Скомпилировано:
/usr/share/tomcat9/webapps/examples/WEB-INF/classes/jsp2/examples/simpletag# ls HelloWorldSimpleTag*
HelloWorldSimpleTag.class  HelloWorldSimpleTag.java
------------------
Подключение к Tomcat "HelloWorldSimpleTag.class" под именем "helloWorld"
/usr/share/tomcat9/webapps/examples/WEB-INF/jsp/jsp2-example-taglib.tld
cat jsp2-example-taglib.tld
....
    <tag>
        <description>Outputs Hello, World</description>
        <name>helloWorld</name>
        <tag-class>jsp2.examples.simpletag.HelloWorldSimpleTag</tag-class> !!!!!
        <body-content>empty</body-content>
    </tag>
....
============================
Использование tag helloWorld:
импорт mytag из jsp2-example-taglib.tld
и использование как <mytag:helloWorld/>
============================
<%@ taglib prefix="mytag" uri="/WEB-INF/jsp/jsp2-example-taglib.tld" %>
<html>
  <head>
    <title>JSP 2.0 Examples - Hello World SimpleTag Handler</title>
  </head>
  <body>
    <h1>JSP 2.0 Examples - Hello World SimpleTag Handler</h1>
    <hr>
    <p>This tag handler simply echos "Hello, World!"  It's an example of
    a very basic SimpleTag handler with no body.</p>
    <br>
    <b><u>Result:</u></b>
    <mytag:helloWorld/>
  </body>
</html>

============================
Результат "<mytag:helloWorld/>" изменен на "Result: Hello, world!"
============================
This tag handler simply echos "Hello, World!" It's an example of a very basic SimpleTag handler with no body.

Result: Hello, world!