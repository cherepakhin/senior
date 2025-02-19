Mockito и как его готовить https://habr.com/ru/articles/444982/
Особо нужно упомянуть ситуацию, когда я пытаюсь создать mock для final класса или
mock-экземпляр enum либо переопределить поведение final метода.
mock final methods - достаточно создать в проекте
(при стандартном устройстве проектного дерева каталогов)
файл test/resources/mockito-extensions/org.mockito.plugins.MockMaker и вписать в него строчку:
    mock-maker-inline
После этого можно имитировать обычным способом final классы и enum'ы,
а также переопределять final методы.
----------------
Отличия do...() от ... thenReturn()
Связывание через Mockito.do... никак не контролирует на стадии компиляции
!!!не проверяется какой переопределяемый метод я вызову
и совместим ли он по типу с заданным возвращаемым значением переопределенного метода.!!!
можно вернуть все что угодно, необязательно соответствовать ТИПУ РЕЗУЛЬТАТА исходного метода
Mockito.when предпочтительнее — там с этим ошибки быть не может.
Еще нужны в случаях Mockito.doThrow, Mockito.doAnswer.
Ещё одна ситуация, где не обойтись без методов Mockito.do... для void методов Mockito.doNothing()
 или для Mockito.doThrow().

 ----------------
 Мне нужно задать реакцию на любой вызов метода независимо от аргументов,
 я должен воспользоваться методом Mockito.any:
 Mockito.when(dataService.getDataItemById(any()))
        .thenReturn("dataItem");

Если же мне требуется, чтобы mock реагировал только на определённое значение аргумента,
можно использовать непосредственно это значение или методы Mockito.eq (когда речь об эквивалентности)

Mockito.when(dataService.getDataItemById("idValue"))
       .thenReturn("dataItem");
// or
Mockito.when(dataService.getDataItemById(Mockito.eq("idValue")))
       .thenReturn("dataItem");
----------------
Можно определить границы для аргументов:
Mockito.when(dataService.getDataById(
             Mockito.argThat(arg -> arg == null || arg.length() > 5)))
       .thenReturn("dataItem");
или типа Mockito.eq(), Mockito.same() ...
----------------
----------------
Бросить исключение:
Mockito.when(dataService.getDataById("invalidId"))
       .thenThrow(new IllegalArgumentException());
----------------
Можно создать объект исключения и бросить непосредственно его,
а можно предоставить Mockito только класс исключения, чтобы оно было создано автоматически:
Mockito.when(dataService.getDataById("invalidId"))
       .thenThrow(IllegalArgumentException.class);
----------------
Ещё одна ситуация, где не обойтись без методов Mockito.do... для VOID методов Mockito.doNothing()
 или для Mockito.doThrow().
----------------
Можно задать ответ, в зависимости от входных параметоров.
Mockito.when(dataService.getDataByIds(Mockito.any()))
       .thenAnswer(invocation -> invocation
                .<List<String>>getArgument(0).stream()
                .map(id -> {
                    switch (id) {
                        case "a":
                            return "dataItemA";
                        case "b":
                            return "dataItemB";
                        default:
                            return null;
                    }
                })
                .collect(Collectors.toList()));
В dataService.getDataByIds() в тесте передаются значения из теста.
И, в зависимости от этих значений, возвращаются разные значения.
----------------
Примеры в:
https://github.com/cherepakhin/companies
https://github.com/cherepakhin/shop_kotlin

