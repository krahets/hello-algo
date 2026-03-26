/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* Инициализировать двустороннюю очередь */
// В TypeScript нет встроенной двусторонней очереди, поэтому приходится использовать Array как двустороннюю очередь
const deque: number[] = [];

/* Поместить элемент в очередь */
deque.push(2);
deque.push(5);
deque.push(4);
// Обратите внимание: поскольку это массив, временная сложность метода unshift() равна O(n)
deque.unshift(3);
deque.unshift(1);
console.log('двусторонняя очередь deque =', deque);

/* Получить доступ к элементу */
const peekFirst: number = deque[0];
console.log('элемент в голове очереди peekFirst =' + peekFirst);
const peekLast: number = deque[deque.length - 1];
console.log('элемент в хвосте очереди peekLast =' + peekLast);

/* Извлечь элемент из очереди */
// Обратите внимание: поскольку это массив, временная сложность метода shift() равна O(n)
const popFront: number = deque.shift() as number;
console.log(
    'Элемент, извлеченный из головы очереди, popFront = ' + popFront + ', deque после извлечения из головы = ' + deque
);
const popBack: number = deque.pop() as number;
console.log(
    'Элемент, извлеченный из хвоста очереди, popBack = ' + popBack + ', deque после извлечения из хвоста = ' + deque
);

/* Получить длину двусторонней очереди */
const size: number = deque.length;
console.log('Длина двусторонней очереди size =' + size);

/* Проверить, пуста ли двусторонняя очередь */
const isEmpty: boolean = size === 0;
console.log('двусторонняя Очередь пуста:' + isEmpty);

export {};
