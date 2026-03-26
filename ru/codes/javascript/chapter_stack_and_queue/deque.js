/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* Инициализировать двустороннюю очередь */
// В JavaScript нет встроенной двусторонней очереди, поэтому приходится использовать Array как двустороннюю очередь
const deque = [];

/* Поместить элемент в очередь */
deque.push(2);
deque.push(5);
deque.push(4);
// Обратите внимание: поскольку это массив, временная сложность метода unshift() равна O(n)
deque.unshift(3);
deque.unshift(1);
console.log('двусторонняя очередь deque =', deque);

/* Получить доступ к элементу */
const peekFirst = deque[0];
console.log('элемент в голове очереди peekFirst =' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('элемент в хвосте очереди peekLast =' + peekLast);

/* Извлечь элемент из очереди */
// Обратите внимание: поскольку это массив, временная сложность метода shift() равна O(n)
const popFront = deque.shift();
console.log(
    'Элемент, извлеченный из головы очереди, popFront = ' + popFront + ', deque после извлечения из головы = ' + deque
);
const popBack = deque.pop();
console.log(
    'Элемент, извлеченный из хвоста очереди, popBack = ' + popBack + ', deque после извлечения из хвоста = ' + deque
);

/* Получить длину двусторонней очереди */
const size = deque.length;
console.log('Длина двусторонней очереди size =' + size);

/* Проверить, пуста ли двусторонняя очередь */
const isEmpty = size === 0;
console.log('двусторонняя очередьпуст ли =' + isEmpty);
