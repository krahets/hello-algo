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

    /* Получить длину очереди */
    get size(): number {
        return this.queSize;
    }

    /* Проверить, пуста ли очередь */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* Поместить в очередь */
    push(num: number): void {
        // Добавить num после хвостового узла
        const node = new ListNode(num);
        // Если очередь пуста, сделать так, чтобы головной и хвостовой узлы указывали на этот узел
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
        if (!this.front) throw new Error('очередьпуст');
        // Удалить головной узел
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    peek(): number {
        if (this.size === 0) throw new Error('очередьпуст');
        return this.front!.val;
    }

    /* Преобразовать связный список в Array и вернуть его */
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
/* Инициализировать очередь */
const queue = new LinkedListQueue();

/* Поместить элемент в очередь */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('очередь queue =' + queue.toArray());

/* Получить элемент в начале очереди */
const peek = queue.peek();
console.log('элемент в голове очереди peek =' + peek);

/* Извлечь элемент из очереди */
const pop = queue.pop();
console.log('Элемент, извлеченный из очереди, pop =' + pop + ', queue после извлечения =' + queue.toArray());

/* Получить длину очереди */
const size = queue.size;
console.log('Длина очереди size =' + size);

/* Проверить, пуста ли очередь */
const isEmpty = queue.isEmpty();
console.log('очередьпуст ли =' + isEmpty);

export {};
