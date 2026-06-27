### JBang - выполнение Java кода из командной строки

Ссылки:
- [https://github.com/jbangdev/jbang](https://github.com/jbangdev/jbang)
- [https://www.baeldung.com/jbang-guide](https://www.baeldung.com/jbang-guide)
- [https://github.com/dmakariev/examples.git](https://github.com/dmakariev/examples.git)

Hello world:

````shell
jbang init --template=cli hello.java
````

````text
[jbang] File initialized. You can now run it with 'jbang hello.java' or edit it using 'jbang edit --open=[editor] hello.java' where [editor] is your editor or IDE, e.g. 'eclipse'. If your IDE supports JBang, you can edit the directory instead: 'jbang edit . hello.java'. See https://jbang.dev/ide
````

или

````shell
jbang init hello.java
````
=====================
````shell
ls
````

````text
hello.java
````
=====================

````shell
cat hello.java
````
````text
///usr/bin/env jbang "$0" "$@" ; exit $?
//DEPS info.picocli:picocli:4.6.3

import picocli.CommandLine;
import picocli.CommandLine.Command;
import picocli.CommandLine.Parameters;

import java.util.concurrent.Callable;

@Command(name = "hello", mixinStandardHelpOptions = true, version = "hello 0.1",
description = "hello made with jbang")
class hello implements Callable<Integer> {

    @Parameters(index = "0", description = "The greeting to print", defaultValue = "World!")
    private String greeting;

    public static void main(String... args) {
        int exitCode = new CommandLine(new hello()).execute(args);
        System.exit(exitCode);
    }

    @Override
    public Integer call() throws Exception { // your business logic goes here...
        System.out.println(System.getProperty("java.version"));
        System.out.println("Hello " + greeting);
        return 0;
    }
}
````

=====================
````shell
jbang hello.java Max!
````

````text
[jbang] Building jar for hello.java...
21
Hello Max!
````

Из [https://github.com/dmakariev/examples.git](https://github.com/dmakariev/examples.git)