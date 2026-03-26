/**
 * File: stack.js
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Инициализировать стек */
// В JavaScript нет встроенного класса стека, поэтому Array можно использовать как стек
const stack = [];

/* Поместить элемент в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('стек stack =', stack);

/* Получить верхний элемент стека */
const peek = stack[stack.length - 1];
console.log('вершина стекаэлемент peek =', peek);

/* Извлечь элемент из стека */
const pop = stack.pop();
console.log('извлечение из стекаэлемент pop =', pop);
console.log('извлечение из стекапосле stack =', stack);

/* Получить длину стека */
const size = stack.length;
console.log('Длина стека size =', size);

/* Проверить, пуста ли структура */
const isEmpty = stack.length === 0;
console.log('стекпуст ли =', isEmpty);
