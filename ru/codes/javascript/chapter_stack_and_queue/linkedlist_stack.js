/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Стек на основе связного списка */
class LinkedListStack {
    #stackPeek; // Первый узел списка служит вершиной стека
    #stkSize = 0; // Размер стека

    constructor() {
        this.#stackPeek = null;
    }

    /* Получить размер стека */
    get size() {
        return this.#stkSize;
    }

    /* Проверить, пуст ли стек */
    isEmpty() {
        return this.size === 0;
    }

    /* Поместить элемент в стек */
    push(num) {
        const node = new ListNode(num);
        node.next = this.#stackPeek;
        this.#stackPeek = node;
        this.#stkSize++;
    }

    /* Снять элемент со стека */
    pop() {
        const num = this.peek();
        this.#stackPeek = this.#stackPeek.next;
        this.#stkSize--;
        return num;
    }

    /* Посмотреть элемент на вершине стека */
    peek() {
        if (!this.#stackPeek) throw new Error('Стек пуст');
        return this.#stackPeek.val;
    }

    /* Преобразовать связный список в массив и вернуть его */
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

/* Пример использования */
/* Инициализировать стек */
const stack = new LinkedListStack();

/* Поместить элементы в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('Стек stack = ' + stack.toArray());

/* Посмотреть элемент на вершине стека */
const peek = stack.peek();
console.log('Элемент на вершине стека peek = ' + peek);

/* Снять элемент со стека */
const pop = stack.pop();
console.log('Снятый элемент pop = ' + pop + ', после снятия stack = ' + stack.toArray());

/* Получить размер стека */
const size = stack.size;
console.log('Размер стека size = ' + size);

/* Проверить, пуст ли стек */
const isEmpty = stack.isEmpty();
console.log('Стек пуст = ' + isEmpty);
