/**
 * File: stack.js
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Пример использования */
/* Инициализировать стек */
// В JavaScript нет встроенного класса стека, поэтому в качестве стека можно использовать Array
const stack = [];

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Стек stack =', stack);

/* Посмотреть элемент на вершине стека */
const peek = stack[stack.length - 1];
console.log('Элемент на вершине стека peek =', peek);

/* Снять элемент со стека */
const pop = stack.pop();
console.log('Снятый элемент pop =', pop);
console.log('После снятия элемента stack =', stack);

/* Получить размер стека */
const size = stack.length;
console.log('Размер стека size =', size);

/* Проверить, пуст ли стек */
const isEmpty = stack.length === 0;
console.log('Стек пуст =', isEmpty);
