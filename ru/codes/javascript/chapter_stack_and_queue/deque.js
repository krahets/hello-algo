/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Пример использования */
/* Инициализировать дек */
// В JavaScript нет встроенного дека, поэтому его приходится реализовывать с помощью Array
const deque = [];

/* Добавить элементы в дек */
deque.push(2);
deque.push(5);
deque.push(4);
// Поскольку используется массив, временная сложность метода unshift() составляет O(n)
deque.unshift(3);
deque.unshift(1);
console.log('Дек deque = ', deque);

/* Посмотреть первый и последний элементы */
const peekFirst = deque[0];
console.log('Первый элемент дека peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('Последний элемент дека peekLast = ' + peekLast);

/* Извлечь элементы из дека */
// Поскольку используется массив, временная сложность метода shift() составляет O(n)
const popFront = deque.shift();
console.log(
    'Извлечённый первый элемент popFront = ' + popFront + ', после извлечения из начала deque = ' + deque
);
const popBack = deque.pop();
console.log(
    'Извлечённый последний элемент popBack = ' + popBack + ', после извлечения из конца deque = ' + deque
);

/* Получить длину дека */
const size = deque.length;
console.log('Длина дека size = ' + size);

/* Проверить, пуст ли дек */
const isEmpty = size === 0;
console.log('Дек пуст = ' + isEmpty);
