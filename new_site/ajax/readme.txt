AJAX позволяет обновлять веб страницы асинхронно, негласно обмениваясь данными с веб сервером.
Это означает, что можно ОБНОВЛЯТЬ ЧАСТИ веб страницы без ПЕРЕЗАГРУЗКИ ВСЕЙ страницы.

https://www.schoolsw3.com/js/js_ajax_intro.php

https://www.schoolsw3.com/js/tryit.php?filename=tryjs_ajax_first

<!DOCTYPE html>
<html>
<body>

<div id="demo">
<h2>The XMLHttpRequest Object</h2>
<button type="button" onclick="loadDoc()">Change Content</button>
</div>

<script>
function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", "ajax_info.txt", true);
  xhttp.send();
}
</script>

</body>
</html>

https://habr.com/ru/articles/14246/

Разберем аббревиатуру AJAX:
«Асинхронный» означает, что когда клиент запрашивает данные с сервера, браузер не зависает,
пока не получит ответ. Пользователь наоборот может перемещаться по страницам.
Как только сервер вернул ответ, в фоновом режиме ответ начинает обрабатываться соответствующими функциями.

«JavaScript» это язык программирования, который используется для создания объекта запроса AJAX,
парсинга этого ответа и обновления DOM страницы.

Для отправки запроса на сервер клиент использует XMLHttpRequest или XHR API.
API (программный интерфейс) это набор методов, которые задают правила общения между двумя
заинтересованными сторонами. Тем не менее, приходящие из AJAX запроса данные могут быть в любом формате,
а не только в XML.