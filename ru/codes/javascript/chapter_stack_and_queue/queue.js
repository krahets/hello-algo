/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Инициализировать очередь */
// В JavaScript нет встроенной очереди, поэтому Array можно использовать как очередь
const queue = [];

/* Поместить элемент в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Очередь queue =', queue);

/* Получить элемент в начале очереди */
const peek = queue[0];
console.log('голова очередиэлемент peek =', peek);

/* Извлечь элемент из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() равна O(n)
const pop = queue.shift();
console.log('Извлеченный из очереди элемент pop =', pop, ', queue после извлечения = ', queue);

/* Получить длину очереди */
const size = queue.length;
console.log('Длина очереди size =', size);

/* Проверить, пуста ли очередь */
const isEmpty = queue.length === 0;
console.log('Очередь пуста: ', isEmpty);
