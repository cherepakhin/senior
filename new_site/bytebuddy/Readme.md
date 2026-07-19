[https://bytebuddy.net/#/](https://bytebuddy.net/#/)
[Как изменить код работающего Java-приложения? Пишем свой HotSwap](https://tproger.ru/articles/kak-izmenit-kod-rabotayushhego-java-prilozheniya--piwem-svoj-hotswap)


Byte Buddy — библиотека генерации кода и манипуляций для __создания и модификации классов Java 
во время выполнения приложения__ Java без помощи компилятора.

Некоторые особенности Byte Buddy:
- Позволяет создавать произвольные классы, а не ограничиваться только реализацией интерфейсов 
для создания прокси-объектов во время выполнения.
- Предлагает удобный API для изменения классов вручную, с помощью агента Java или во время сборки.
- Не требует понимания байт-кода Java или формата файла класса. 
- даже если метод final. (если только он не static final).


Hello world:

````java
// генерация класса
Class<?> dynamicType = new ByteBuddy()
  .subclass(Object.class) // наследник от
  .method(ElementMatchers.named("toString")) // определение названия метода
  .intercept(FixedValue.value("Hello World!")) // определение результат выполнения метода
  .make()
  .load(getClass().getClassLoader())
  .getLoaded();

// создание экземпляра класса .newInstance() и вызов метода
assertThat(dynamicType.newInstance().toString(), is("Hello World!"));
````

[https://github.com/aotyurin/jvm-demo/](https://github.com/aotyurin/jvm-demo/)