/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* Инициализация двусторонней очереди */
// В JavaScript нет встроенной двусторонней очереди, поэтому Array можно использовать как двустороннюю очередь
const deque = [];

/* Добавление элемента в очередь */
deque.push(2);
deque.push(5);
deque.push(4);
// Обратите внимание: поскольку используется массив, временная сложность метода unshift() равна O(n)
deque.unshift(3);
deque.unshift(1);
console.log('Двусторонняя очередь deque = ', deque);

/* Доступ к элементу */
const peekFirst = deque[0];
console.log('Первый элемент peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('Последний элемент peekLast = ' + peekLast);

/* Извлечение элемента из очереди */
// Обратите внимание: поскольку используется массив, временная сложность метода shift() равна O(n)
const popFront = deque.shift();
console.log(
    'Извлеченный из головы элемент popFront = ' + popFront + ', deque после извлечения из головы = ' + deque
);
const popBack = deque.pop();
console.log(
    'Извлеченный из хвоста элемент popBack = ' + popBack + ', deque после извлечения из хвоста = ' + deque
);

/* Получение длины двусторонней очереди */
const size = deque.length;
console.log('Длина двусторонней очереди size = ' + size);

/* Проверка, пуста ли двусторонняя очередь */
const isEmpty = size === 0;
console.log('Пуста ли двусторонняя очередь = ' + isEmpty);
