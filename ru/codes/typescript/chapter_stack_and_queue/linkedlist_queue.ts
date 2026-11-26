/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* Очередь на основе связного списка */
class LinkedListQueue {
    private front: ListNode | null; // Первый узел front
    private rear: ListNode | null; // Последний узел rear
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* Получить длину очереди */
    get size(): number {
        return this.queSize;
    }

    /* Проверить, пуста ли очередь */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* Добавить элемент в очередь */
    push(num: number): void {
        // Добавить узел со значением num после последнего узла
        const node = new ListNode(num);
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // Если очередь непуста, добавить новый узел после последнего
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* Извлечь элемент из очереди */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('Очередь пуста');
        // Удалить первый узел
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    peek(): number {
        if (this.size === 0) throw new Error('Очередь пуста');
        return this.front!.val;
    }

    /* Преобразовать связный список в массив и вернуть его */
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

/* Пример использования */
/* Инициализировать очередь */
const queue = new LinkedListQueue();

/* Добавить элементы в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Очередь queue = ' + queue.toArray());

/* Посмотреть первый элемент очереди */
const peek = queue.peek();
console.log('Первый элемент очереди peek = ' + peek);

/* Извлечь элемент из очереди */
const pop = queue.pop();
console.log('Извлечённый элемент pop = ' + pop + ', после извлечения queue = ' + queue.toArray());

/* Получить длину очереди */
const size = queue.size;
console.log('Длина очереди size = ' + size);

/* Проверить, пуста ли очередь */
const isEmpty = queue.isEmpty();
console.log('Очередь пуста = ' + isEmpty);

export {};
