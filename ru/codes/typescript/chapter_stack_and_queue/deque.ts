/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Пример использования */
/* Инициализировать дек */
// В TypeScript нет встроенного дека, поэтому его приходится реализовывать с помощью Array
const deque: number[] = [];

/* Добавить элементы в дек */
deque.push(2);
deque.push(5);
deque.push(4);
// Поскольку используется массив, временная сложность метода unshift() составляет O(n)
deque.unshift(3);
deque.unshift(1);
console.log('Дек deque = ', deque);

/* Посмотреть первый и последний элементы */
const peekFirst: number = deque[0];
console.log('Первый элемент дека peekFirst = ' + peekFirst);
const peekLast: number = deque[deque.length - 1];
console.log('Последний элемент дека peekLast = ' + peekLast);

/* Извлечь элементы из дека */
// Поскольку используется массив, временная сложность метода shift() составляет O(n)
const popFront: number = deque.shift() as number;
console.log(
    'Извлечённый первый элемент popFront = ' + popFront + ', после извлечения из начала deque = ' + deque
);
const popBack: number = deque.pop() as number;
console.log(
    'Извлечённый последний элемент popBack = ' + popBack + ', после извлечения из конца deque = ' + deque
);

/* Получить длину дека */
const size: number = deque.length;
console.log('Длина дека size = ' + size);

/* Проверить, пуст ли дек */
const isEmpty: boolean = size === 0;
console.log('Дек пуст = ' + isEmpty);

export {};
