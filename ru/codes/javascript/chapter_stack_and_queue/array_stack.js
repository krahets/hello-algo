/**
 * File: array_stack.js
 * Created Time: 2022-12-09
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Стек на основе массива */
class ArrayStack {
    #stack;
    constructor() {
        this.#stack = [];
    }

    /* Получение длины стека */
    get size() {
        return this.#stack.length;
    }

    /* Проверка, пуст ли стек */
    isEmpty() {
        return this.#stack.length === 0;
    }

    /* Поместить в стек */
    push(num) {
        this.#stack.push(num);
    }

    /* Извлечь из стека */
    pop() {
        if (this.isEmpty()) throw new Error('стек пуст');
        return this.#stack.pop();
    }

    /* Доступ к верхнему элементу стека */
    top() {
        if (this.isEmpty()) throw new Error('стек пуст');
        return this.#stack[this.#stack.length - 1];
    }

    /* Вернуть Array */
    toArray() {
        return this.#stack;
    }
}

/* Driver Code */
/* Инициализация стека */
const stack = new ArrayStack();

/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Стек stack = ');
console.log(stack.toArray());

/* Доступ к верхнему элементу стека */
const top = stack.top();
console.log('Верхний элемент top = ' + top);

/* Извлечение элемента из стека */
const pop = stack.pop();
console.log('Извлеченный элемент pop = ' + pop + ', stack после извлечения = ');
console.log(stack.toArray());

/* Получение длины стека */
const size = stack.size;
console.log('Длина стека size = ' + size);

/* Проверка на пустоту */
const isEmpty = stack.isEmpty();
console.log('Пуст ли стек = ' + isEmpty);
