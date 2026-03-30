/**
 * File: linkedlist_stack.ts
 * Created Time: 2022-12-21
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* Стек на основе связного списка */
class LinkedListStack {
    private stackPeek: ListNode | null; // Использовать головной узел как вершину стека
    private stkSize: number = 0; // Длина стека

    constructor() {
        this.stackPeek = null;
    }

    /* Получение длины стека */
    get size(): number {
        return this.stkSize;
    }

    /* Проверка, пуст ли стек */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* Поместить в стек */
    push(num: number): void {
        const node = new ListNode(num);
        node.next = this.stackPeek;
        this.stackPeek = node;
        this.stkSize++;
    }

    /* Извлечь из стека */
    pop(): number {
        const num = this.peek();
        if (!this.stackPeek) throw new Error('стек пуст');
        this.stackPeek = this.stackPeek.next;
        this.stkSize--;
        return num;
    }

    /* Доступ к верхнему элементу стека */
    peek(): number {
        if (!this.stackPeek) throw new Error('стек пуст');
        return this.stackPeek.val;
    }

    /* Преобразовать связный список в Array и вернуть */
    toArray(): number[] {
        let node = this.stackPeek;
        const res = new Array<number>(this.size);
        for (let i = res.length - 1; i >= 0; i--) {
            res[i] = node!.val;
            node = node!.next;
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
console.log('Верхний элемент стека peek = ' + peek);

/* Извлечение элемента из стека */
const pop = stack.pop();
console.log('Извлечен элемент pop = ' + pop + ', стек после извлечения stack = ' + stack.toArray());

/* Получение длины стека */
const size = stack.size;
console.log('Длина стека size = ' + size);

/* Проверка на пустоту */
const isEmpty = stack.isEmpty();
console.log('Пуст ли стек = ' + isEmpty);

export {};
