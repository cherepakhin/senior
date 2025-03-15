"Единственная постоянная вещь в жизни — это перемены" (Гераклит).

Стили, примененные через селектор по ID, имеют более высокий приоритет, чем стили,
примененные через КЛАССЫ и теги, что облегчает переопределение стилей.

<td wicket:id="publishDate" class="myPublishDate">aaa</td>

Конфликт стилей

https://developer.mozilla.org/ru/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts

Селектор элементов ( например h1 ) менее специфичен — он выберет все элементы этого типа на странице — поэтому получит меньше баллов.
Селектор класса более специфичен — он выберет только те элементы на странице, которые имеют конкретное значение атрибута class — поэтому получит больше баллов, селектор класса применится после селектора элемента и поэтому перекроет его стили.

===============================
Пример ОЧЕРЕДНОСТИ:
h1 {
  color: red;
}
h1 {
  color: blue;
}

<h1>This is my heading.</h1> - текст будет СИНИМ, т.к. объявлен позже
===============================
===============================
Пример класса и тега:

````css
.main-heading {
  color: red;
}

h1 {
  color: blue;
}
````

<h1 class="main-heading">This is my heading.</h1>
текст будет КРАСНЫМ.

т.к. селектор КЛАССА ".main-heading  {...}" имеет более ВЫСОКИЙ приоритет
по сравнению с селектор ТЕГА "h1 {...}" , несмотря на то что селектор ТЕГА h1 объявлен позже
селектора КЛАССА ".main-heading"

<h1 class="main-heading">This is my heading.</h1> - сначала применится h1 {} и переопределится class-ом (.main-heading {}).
-------------------------

Селектор КЛАССА (.main-heading) более высокий приоритет, чем селектор ТЕГА — он выберет только те элементы на странице, которые имеют конкретное значение атрибута class — поэтому получит больше баллов.
Селектор КЛАССА (.main-heading) применится после селектора ТЕГА (h1) и поэтому перекроет его стили.
===============================

===============================
при одинаковых селекторах КЛАССА, будет применен последний. Пример:

````css
h1 {
  color: blue;
}

h1 {
  color: red;
}
````

<h1 class="main-heading">This is my heading.</h1>
текст будет КРАСНЫМ.
===============================
Можно потренироваться в интерактивном редакторе (раздел "Interactive editor"):
https://developer.mozilla.org/ru/docs/Learn_web_development/Core/Styling_basics/Handling_conflicts
===============================
Итого такой приоритет:

В <td id="publishDate" class="myPublishDate">aaa</td>

ID(id="publishDate") выше чем CLASS(class="myPublishDate")
CLASS(class) выше чем ТЕГ (td):

ID (#my в css, id в html ) -> CLASS (. в css, style в html) -> ТЕГ (h1 в css, h1 в html)

body {
  color: green;
}

.my-class-1 a {
  color: red;
}

.my-class-2 a {
  color: initial;
}

.my-class-3 a {
  color: unset;
}

#my {
  color: yellow;
}

<ul>
  <li>Default <a href="#">link</a> color</li>
  <li id="my" class="my-class-1">Inherit the <a href="#">link</a> color</li>
  <li class="my-class-2">Reset the <a href="#">link</a> color</li>
  <li class="my-class-3">Unset the <a href="#">link</a> color</li>
</ul>

См. new_site/css/hierarchy_css.png