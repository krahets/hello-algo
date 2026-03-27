/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Инициализация очереди */
// В TypeScript нет встроенной очереди, поэтому Array можно использовать как очередь
const queue: number[] = [];

/* Добавление элемента в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Очередь queue =', queue);

/* Доступ к элементу в начале очереди */
const peek = queue[0];
console.log('Элемент в начале очереди peek =', peek);

/* Извлечение элемента из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() равна O(n)
const pop = queue.shift();
console.log('Извлечен элемент pop =', pop, ', очередь после извлечения queue = ', queue);

/* Получение длины очереди */
const size = queue.length;
console.log('Длина очереди size =', size);

/* Проверка, пуста ли очередь */
const isEmpty = queue.length === 0;
console.log('Пуста ли очередь = ', isEmpty);

export {};
