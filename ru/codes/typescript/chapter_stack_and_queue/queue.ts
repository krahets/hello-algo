/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Пример использования */
/* Инициализировать очередь */
// В TypeScript нет встроенной очереди, поэтому в качестве очереди можно использовать Array
const queue: number[] = [];

/* Добавить элементы в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Очередь queue =', queue);

/* Посмотреть первый элемент очереди */
const peek = queue[0];
console.log('Первый элемент очереди peek =', peek);

/* Извлечь элемент из очереди */
// В основе лежит массив, поэтому временная сложность метода shift() составляет O(n)
const pop = queue.shift();
console.log('Извлечённый элемент pop =', pop, '— после извлечения queue = ', queue);

/* Получить длину очереди */
const size = queue.length;
console.log('Длина очереди size =', size);

/* Проверить, пуста ли очередь */
const isEmpty = queue.length === 0;
console.log('Очередь пуста = ', isEmpty);

export {};
