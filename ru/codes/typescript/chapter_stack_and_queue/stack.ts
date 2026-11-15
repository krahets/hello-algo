/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
// [region]{init_stack}
/* Инициализация стека */
// В TypeScript нет встроенного класса стека, поэтому Array можно использовать как стек
const stack: number[] = [];
// [endregion]{init_stack}

// [region]{push}
/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
// [endregion]{push}
console.log('Стек stack =', stack);

// [region]{peek}
/* Доступ к верхнему элементу стека */
const peek = stack[stack.length - 1];
// [endregion]{peek}
console.log('Верхний элемент стека peek =', peek);

// [region]{pop}
/* Извлечение элемента из стека */
const pop = stack.pop();
// [endregion]{pop}
console.log('Извлечен элемент pop =', pop);
console.log('Стек после извлечения =', stack);

// [region]{size}
/* Получение длины стека */
const size = stack.length;
// [endregion]{size}
console.log('Длина стека size =', size);

// [region]{is_empty}
/* Проверка на пустоту */
const isEmpty = stack.length === 0;
// [endregion]{is_empty}
console.log('Пуст ли стек =', isEmpty);

export {};
