/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Инициализировать очередь */
// В TypeScript нет встроенной очереди, поэтому Array можно использовать как очередь
const queue: number[] = [];

/* Поместить элемент в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('очередь queue =', queue);

/* Получить элемент в начале очереди */
const peek = queue[0];
console.log('элемент в голове очереди peek =', peek);

/* Извлечь элемент из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() равна O(n)
const pop = queue.shift();
console.log('Элемент, извлеченный из очереди, pop =', pop, ', queue после извлечения =', queue);

/* Получить длину очереди */
const size = queue.length;
console.log('Длина очереди size =', size);

/* Проверить, пуста ли очередь */
const isEmpty = queue.length === 0;
console.log('очередьпуст ли =', isEmpty);

export {};
