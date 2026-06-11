https://metanit.com/web/html5/1.2.php

<div>Текст <br /> элемента div</div> - <br /> внутри строки

<div style="color:red;">Кнопка</div> - style="color:red;"
<input type="button" value="Нажать"> - так же как и в html ???

<input type="button" value="Нажать" disabled> - "disabled"!!!

Глобальные атрибуты
В HTML5 есть набор глобальных атрибутов, которые применимы к любому элементу HTML5:

class: задает класс CSS, который будет применяться к элементу
contenteditable: определяет, можно ли редактировать содержимое элемента
contextmenu: определяет контекстное меню для элемента, которое отображается при нажатии на элемент правой кнопкой мыши
dir: устанавливает направление текста в элементе
hidden: скрывает элемент
style: задает стиль элемента
tabindex: определяет порядок, в котором по элементам можно переключаться с помощью клавиши TAB
title: устанавливает дополнительное описание для элемента

<input type="button" value="Нажать" data-color="red" >  можно определить любой атрибут, предваряя его префиксом data-

<input type="button" value='Кнопка "Привет мир"'>  Одинарные или двойные кавычки

<!DOCTYPE html> указывает, что данный документ является документом html и что используется html5, а не html4

Типичный заголовок:
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Документ HTML5</title>
    </head>
    <body>
        <div>Содержание документа HTML5</div>
    </body>
</html>
-------------------------------------
https://metanit.com/web/html5/1.4.php

Можно не заключать значения атрибутов в кавычки
Некоторые атрибуты могут не иметь значений (checked и disabled)
Специальные символы не экранируются
Документ должен иметь элемент DOCTYPE. Имеет 2 типа: "html", "XHTML"

------------------------------------- DOCTYPE
Тип html:

<!DOCTYPE html>
<html>
    <head>
        <meta charset=utf-8>
        <title>Заголовок</title>
    </head>
    <body>
        <p>Содержание документа HTML5<br>
        <input type=button value=Нажать >
    </body>
</html>

Тип XHTML (добавлено dtd):

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta charset="utf-8">
        <title>Заголовок</title>
    </head>
    <body>
        <p>Содержание документа HTML5<br />
        <input type="button" value="Нажать" /></p>
    </body>
</html>

При использовании синтаксиса XHTML нам также надо указать пространство имен для данного документа: <html xmlns="http://www.w3.org/1999/xhtml">

-------------------------------------
Разметку можно проверить с помощью валидатора по адресу https://validator.w3.org
-------------------------------------
Элемент "base"

<!DOCTYPE html>
<html>
    <head>
        <base href="content/">              // base=content/
        <meta charset="utf-8">
        <title>Элемент base</title>
    </head>
    <body>
        <a href="newpage.html">Перейти</a>  // фактически адресом будет content/newpage.html
    </body>
</html>
-------------------------------------
span - служит для стилизации заключенного в него текстового содержимого,
не переносит содержимое на следующую строку

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Документ HTML5</title>
    </head>
    <body>
        <div>Заголовок документа HTML5</div>
        <div>
            <p><span style="color:red;">Первый</span> параграф</p>
            <p><span>Второй</span> параграф</p>
        </div>
    </body>
</html>

-------------------------------------
Форматирование текста
<b>: выделяет текст жирным
<del>: зачеркивает текст
<i>: выделяет текст курсивом
<em>: выделяет текст курсивом, в отличие от тега <i> носит логическое значение, придает выделяемому тексту оттенок важности
<s>: зачеркивает текст
<small>: делает текст чуть меньше размером, чем окружающий
<strong>: выделяет текст жирным. В отличие от тега <b> предназначен для логического выделения, чтобы показать важность текста. А <b> не носит характера логического выделения, выполняет функции только форматирования
<sub>: помещает текст под строкой
<sup>: помещает текст над строкой
<u>: подчеркивает текст
<ins>: определяет вставленный (или добавленный) текст
<mark>: выделяет текст цветом, придавая ему оттенок важности

Пример в https://metanit.com/web/html5/2.3.php

-------------------------------------
Списки
https://metanit.com/web/html5/2.5.php
<ol> (по умолчанию нумерованный список) и <ul> (по умолчанию ненумерованный список)

Для ненумерованного списка атрибут list-style-type может принимать следующие значения:
disc: черный диск
circle: пустой кружочек
square: черный квадратик

<h2>list-style-type = disc</h2>
<ul style="list-style-type:disc;">
    <li>iPhone 6S</li>
    <li>Galaxy S7</li>
    <li>Nexus 5X</li>
    <li>Lumia 950</li>
</ul>
<h2>list-style-type = circle</h2>
<ul style="list-style-type:circle;">
    <li>iPhone 6S Plus</li>
    <li>Galaxy S7 Edge</li>
    <li>Nexus 6P</li>
    <li>Lumia 950 XL</li>
</ul>
<h2>list-style-type = square</h2>
<ul style="list-style-type:square;">
    <li>LG G 5</li>
    <li>Huawei P8</li>
    <li>Asus ZenFone 2</li>
</ul>

list-style-image. Он задает изображение, которое будет отображаться рядом с элементом списка:
<ul style="list-style-image:url(phone_touch.png);">
    <li>iPhone 6S</li>
    <li>Galaxy S7</li>
    <li>Nexus 5X</li>
    <li>Lumia 950</li>
</ul>
-------------------------------------
Горизонтальный список
Надо установить стиль display:inline:
https://metanit.com/web/html5/2.5.php

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Горизонтальный список в HTML5</title>
        <style>
            ul#menu li {
                display:inline;
            }
        </style>
    </head>
    <body>
        <ul id="menu">
            <li>Главная</li>
            <li>Блог</li>
            <li>Форум</li>
            <li>О сайте</li>
        </ul>
    </body>
</html>
-------------------------------------
Аккордион

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Элемент details в HTML5</title>
    </head>
    <body>
        <details> // Аккордион
            <summary>Флагманы 2015</summary> // Заголовок
            <ul>                             // раскрывающийся список
                <li>iPhone 6S Plus</li>
                <li>Nexus 6P</li>
                <li>Galaxy S6 Edge</li>
                <li>Lumia 950 XL</li>
            </ul>
        </details>
    </body>
</html>
Стилизация элемента details: https://metanit.com/web/html5/6.21.php
-------------------------------------





