Придётся сделать более сложную структуру, но не бойтесь.

Помните, что в JSON без кавычек могут идти целые числа (например, год или порядковый номер) и числа с плавающей точкой (плотность).

Ваш файл elements.json должен выглядеть примерно так:

{
"H":{
"number": 1,
"name": "Водород",
"density": 0.000084,
"year": 1766,
"discoverer": "Кавендиш"
},
...
}
А когда будете выводить элементы на экран, помните, что каждый из них уже не строка а отдельный ассоциативный массив.

Чтобы вывести, например, плотность водорода, надо написать так

elements["H"]["density"]
Удобно, не правда ли?

Обязательно посмотрите ответ к этой задаче. Там мы собрали все элементы таблицы со более подробным перечнем информации о них.