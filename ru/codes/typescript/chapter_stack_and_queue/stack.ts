/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Инициализация стека */
// В TypeScript нет встроенного класса стека, поэтому Array можно использовать как стек
const stack: number[] = [];

/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Стек stack =', stack);

/* Доступ к верхнему элементу стека */
const peek = stack[stack.length - 1];
console.log('Верхний элемент стека peek =', peek);

/* Извлечение элемента из стека */
const pop = stack.pop();
console.log('Извлечен элемент pop =', pop);
console.log('Стек после извлечения =', stack);

/* Получение длины стека */
const size = stack.length;
console.log('Длина стека size =', size);

/* Проверка на пустоту */
const isEmpty = stack.length === 0;
console.log('Пуст ли стек =', isEmpty);

export {};
