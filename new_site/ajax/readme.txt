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