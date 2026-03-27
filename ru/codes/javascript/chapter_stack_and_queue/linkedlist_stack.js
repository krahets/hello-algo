/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Стек на основе связного списка */
class LinkedListStack {
    #stackPeek; // Использовать головной узел как вершину стека
    #stkSize = 0; // Длина стека

    constructor() {
        this.#stackPeek = null;
    }

    /* Получение длины стека */
    get size() {
        return this.#stkSize;
    }

    /* Проверка, пуст ли стек */
    isEmpty() {
        return this.size === 0;
    }

    /* Поместить в стек */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* Извлечь из стека */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* Доступ к верхнему элементу стека */
    peek() {
        if (!this.#stackPeek) throw new Error('стек пуст');
        return this.#stackPeek.val;
    }

    /* Преобразовать связный список в Array и вернуть */
    toArray() {
        let node = this.#stackPeek;
        const res = new Array(this.size);
        for (let i = res.length - 1; i >= 0; i--) {
            res[i] = node.val;
            node = node.next;
        }
        return res;
    }
}

/* Driver Code */
/* Инициализация стека */
const stack = new LinkedListStack();

/* Помещение элемента в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Стек stack = ' + stack.toArray());

/* Доступ к верхнему элементу стека */
const peek = stack.peek();
console.log('Верхний элемент peek = ' + peek);

/* Извлечение элемента из стека */
const pop = stack.pop();
console.log('Извлеченный элемент pop = ' + pop + ', stack после извлечения = ' + stack.toArray());

/* Получение длины стека */
const size = stack.size;
console.log('Длина стека size = ' + size);

/* Проверка на пустоту */
const isEmpty = stack.isEmpty();
console.log('Пуст ли стек = ' + isEmpty);
