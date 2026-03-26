/**
 * File: linkedlist_stack.js
 * Created Time: 2022-12-22
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Стек на основе связного списка */
class LinkedListStack {
    #stackPeek; // Считать головной узел вершиной стека
    #stkSize = 0; // Длина стека

    constructor() {
        this.#stackPeek = null;
    }

    /* Получить длину стека */
    get size() {
        return this.#stkSize;
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    peek() {
        if (!this.#stackPeek) throw new Error('стекпуст');
        return this.#stackPeek.val;
    }

    /* Преобразовать связный список в Array и вернуть его */
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
/* Инициализировать стек */
const stack = new LinkedListStack();

/* Поместить элемент в стек */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('стек stack =' + stack.toArray());

/* Получить верхний элемент стека */
const peek = stack.peek();
console.log('вершина стекаэлемент peek =' + peek);

/* Извлечь элемент из стека */
const pop = stack.pop();
console.log('извлечение из стекаэлемент pop =' + pop + ', извлечение из стекапосле stack =' + stack.toArray());

/* Получить длину стека */
const size = stack.size;
console.log('Длина стека size =' + size);

/* Проверить, пуста ли структура */
const isEmpty = stack.isEmpty();
console.log('стекпуст ли =' + isEmpty);
