TODO: Полнотекстовый поиск в PostgreSQL
https://habr.com/ru/companies/rostelecom/articles/853124/
Полнотекстовый поиск в PostgreSQL: ключевые особенности
PostgreSQL предлагает мощный и гибкий механизм полнотекстового поиска
Тип данных tsvector - это тип данных для хранения индексированного текста.
Он автоматически нормализует текст, удаляя стоп-слова и преобразуя слова в их основные формы.
Тип данных tsquery используется для хранения и выполнения поисковых запросов.
Этот тип поддерживает логические операторы, такие как AND, OR, NOT
можно использовать такие операторы, как & (И), | (ИЛИ), и ! (НЕ)
Примеры:
Подготовка таблицы============================================
CREATE TABLE documents (id SERIAL PRIMARY KEY, title TEXT, body TEXT,
    tsvector_col TSVECTOR);

select * from documents d
delete from documents
INSERT INTO documents (title, body, tsvector_col) VALUES
('Artificial Intelligence', 'Artificial intelligence (AI) is a field of computer science that aims to create intelligent machines.',
    to_tsvector('english', 'Artificial intelligence (AI) is a field of computer science that aims to create intelligent machines.')),
('Machine Learning', 'Machine learning is a subset of AI that allows systems to learn from data.',
    to_tsvector('english', 'Machine learning is a subset of AI that allows systems to learn from data.')),
('Deep Learning', 'Deep learning is a subset of machine learning that uses neural networks to model complex patterns.',
    to_tsvector('english', 'Deep learning is a subset of machine learning that uses neural networks to model complex patterns.')),
('Data Science', 'Data science involves the use of statistical methods to extract insights from data.',
    to_tsvector('english', 'Data science involves the use of statistical methods to extract insights from data.'));
=============================================================
Оператор @@ используется для сопоставления запроса с индексированным текстом (tsvector)
Примеры:
=============================================================
SELECT * FROM documents WHERE tsvector_col @@ to_tsquery('machine');
поиск по колонке tsvector_col без учета регистра (в строке с ID=6 - "Machine...")
id|title                  |body                                                                                                 |tsvector_col                                                                                                     |
--+-----------------------+-----------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
 5|Artificial Intelligence|Artificial intelligence (AI) is a field of computer science that aims to create intelligent machines.|'ai':3 'aim':11 'artifici':1 'comput':8 'creat':13 'field':6 'intellig':2,14 'machin':15 'scienc':9              |
 6|Machine Learning       |Machine learning is a subset of AI that allows systems to learn from data.                           |'ai':7 'allow':9 'data':14 'learn':2,12 'machin':1 'subset':5 'system':10                                        |
 7|Deep Learning          |Deep learning is a subset of machine learning that uses neural networks to model complex patterns.   |'complex':15 'deep':1 'learn':2,8 'machin':7 'model':14 'network':12 'neural':11 'pattern':16 'subset':5 'use':10|

=============================================================
Символ: *
Найти все слова, где "body" начинается на "sci", такие как "science".
ищется в "body" (тип колонки TEXT), "body" переводится в tsvector, и уже там выполняется запрос
(напоминание: CREATE TABLE documents (id SERIAL PRIMARY KEY, title TEXT, body TEXT, tsvector_col TSVECTOR);)
SELECT * FROM documents WHERE to_tsvector(body) @@ to_tsquery('sci:*');
Запрос: 'sci:*'
body (тип TEXT) переводится в tsvector) и по нему (@@) выполняется запрос sci:*
>>
 id |          title          |                                                 body                                                  |                                            tsvector_col
----+-------------------------+-------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------
  4 | Artificial Intelligence | Artificial intelligence (AI) is a field of computer (!!!)science(!!!) that aims to create intelligent machines. | 'ai':3 'aim':11 'artifici':1 'comput':8 'creat':13 'field':6 'intellig':2,14 'machin':15 'scienc':9
  7 | Data Science            | Data (!!!)science(!!!) involves the use of statistical methods to extract insights from data.                   | 'data':1,13 'extract':10 'insight':11 'involv':3 'method':8 'scienc':2 'statist':7 'use':5
=============================================================
Поиск по колонке tsvector_col. Эта колонка уже TSVECTOR и преобразование to_tsvector(col_text) уже не нужно.
SELECT * FROM documents WHERE tsvector_col @@ to_tsquery('machine & learning');
Запрос: 'machine & learning'
в строке есть И "machine" И "learning" БЕЗ УЧЕТА РЕГИСТРА
id|title           |body                                                                                              |tsvector_col                                                                                                     |
--+----------------+--------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------+
 6|Machine Learning|Machine learning is a subset of AI that allows systems to learn from data.                        |'ai':7 'allow':9 'data':14 'learn':2,12 'machin':1 'subset':5 'system':10                                        |
 7|Deep Learning   |Deep learning is a subset of machine learning that uses neural networks to model complex patterns.|'complex':15 'deep':1 'learn':2,8 'machin':7 'model':14 'network':12 'neural':11 'pattern':16 'subset':5 'use':10|
=============================================================
Запросы выполняются без учета регистра. Эти запросы дают одинаковый результат:
SELECT * FROM documents WHERE tsvector_col @@ to_tsquery('machine');
SELECT * FROM documents WHERE tsvector_col @@ to_tsquery('Machine');
=============================================================
SELECT tsvector_col, body  FROM documents WHERE tsvector_col @@ to_tsquery('Artificial');
Содержимое колонки "tsvector_col".
Напоминание: insert ...tsvector_col .... to_tsvector('english', 'Data science involves the use of statistical methods to extract insights from data.'));
tsvector_col                                                                                       |body                                                                                                 |
---------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------+
'ai':3 'aim':11 'artifici':1 'comput':8 'creat':13 'field':6 'intellig':2,14 'machin':15 'scienc':9|Artificial intelligence (AI) is a field of computer science that aims to create intelligent machines.|
в строке есть слово 'Artificial'
=============================================================
SELECT tsvector_col, body  FROM documents WHERE tsvector_col @@ to_tsquery('arti'); // 0 row
Нужно точное совпадение "to_tsquery('Artificial')" или to_tsquery('artificial')
SELECT tsvector_col, body  FROM documents WHERE tsvector_col @@ to_tsquery('artificial'); // 1 row
=============================================================
ищется после перевода в нижний регистр
SELECT tsvector_col, body  FROM documents WHERE tsvector_col @@ to_tsquery('artificial'); // 1 row
tsvector_col                                                                                       |body                                                                                                 |
---------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------+
'ai':3 'aim':11 'artifici':1 'comput':8 'creat':13 'field':6 'intellig':2,14 'machin':15 'scienc':9|Artificial intelligence (AI) is a field of computer science that aims to create intelligent machines.|
в запросе 'artificial', но 'Artificial' попадает в поиск
НО!!!
SELECT tsvector_col, body  FROM documents WHERE tsvector_col @@ to_tsquery('ARTIFICAL'); // 0 row
=============================================================
SELECT id, tsvector_col, body  FROM documents WHERE tsvector_col @@ to_tsquery('learning');
// 2 rows - Machine learning... , Deep learning...
id|tsvector_col
    |body                                                                                              |
--+-----------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------+
 6|'ai':7 'allow':9 'data':14 'learn':2,12 'machin':1 'subset':5 'system':10
    |Machine learning is a subset of AI that allows systems to learn from data.                        |
 7|'complex':15 'deep':1 'learn':2,8 'machin':7 'model':14 'network':12 'neural':11 'pattern':16 'subset':5 'use':10
    |Deep learning is a subset of machine learning that uses neural networks to model complex patterns.|

=============================================================
SELECT id, tsvector_col, body  FROM documents WHERE tsvector_col @@ to_tsquery('machine & learning');
// 2 rows - Machine learning... , Deep learning...
id|tsvector_col
    |body                                                                                              |
--+-----------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------+
 6|'ai':7 'allow':9 'data':14 'learn':2,12 'machin':1 'subset':5 'system':10
    |Machine learning is a subset of AI that allows systems to learn from data.                        |
 7|'complex':15 'deep':1 'learn':2,8 'machin':7 'model':14 'network':12 'neural':11 'pattern':16 'subset':5 'use':10
    |Deep learning is a subset of machine learning that uses neural networks to model complex patterns.|
// rows - 2
// Machine learning... , ...machine learning...
=============================================================
Как работает с русским языком и словоформами???