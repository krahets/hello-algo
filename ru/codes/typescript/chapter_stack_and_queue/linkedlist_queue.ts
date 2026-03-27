/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* Очередь на основе связного списка */
class LinkedListQueue {
    private front: ListNode | null; // Головной узел front
    private rear: ListNode | null; // Хвостовой узел rear
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* Получение длины очереди */
    get size(): number {
        return this.queSize;
    }

    /* Проверка, пуста ли очередь */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* Поместить в очередь */
    push(num: number): void {
        // Добавить num после хвостового узла
        const node = new ListNode(num);
        // Если очередь пуста, сделать так, чтобы и head, и tail указывали на этот узел
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // Если очередь не пуста, добавить этот узел после хвостового узла
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* Извлечь из очереди */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('очередь пуста');
        // Удалить головной узел
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* Доступ к элементу в начале очереди */
    peek(): number {
        if (this.size === 0) throw new Error('очередь пуста');
        return this.front!.val;
    }

    /* Преобразовать связный список в Array и вернуть */
    toArray(): number[] {
        let node = this.front;
        const res = new Array<number>(this.size);
        for (let i = 0; i < res.length; i++) {
            res[i] = node!.val;
            node = node!.next;
        }
        return res;
    }
}

/* Driver Code */
/* Инициализация очереди */
const queue = new LinkedListQueue();

/* Добавление элемента в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Очередь queue = ' + queue.toArray());

/* Доступ к элементу в начале очереди */
const peek = queue.peek();
console.log('Элемент в начале очереди peek = ' + peek);

/* Извлечение элемента из очереди */
const pop = queue.pop();
console.log('Извлечен элемент pop = ' + pop + ', очередь после извлечения queue = ' + queue.toArray());

/* Получение длины очереди */
const size = queue.size;
console.log('Длина очереди size = ' + size);

/* Проверка, пуста ли очередь */
const isEmpty = queue.isEmpty();
console.log('Пуста ли очередь = ' + isEmpty);

export {};
