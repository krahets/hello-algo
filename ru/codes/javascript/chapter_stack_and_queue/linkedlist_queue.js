/**
 * File: linkedlist_queue.js
 * Created Time: 2022-12-20
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Очередь на основе связного списка */
class LinkedListQueue {
    #front; // головной узел #front
    #rear; // хвостовой узел #rear
    #queSize = 0;

    constructor() {
        this.#front = null;
        this.#rear = null;
    }

    /* Получить длину очереди */
    get size() {
        return this.#queSize;
    }

    /* Проверить, пуста ли очередь */
    isEmpty() {
        return this.size === 0;
    }

    /* Поместить в очередь */
    push(num) {
        // Добавить num после хвостового узла
        const node = new ListNode(num);
        // Если очередь пуста, сделать так, чтобы головной и хвостовой узлы указывали на этот узел
        if (!this.#front) {
            this.#front = node;
            this.#rear = node;
            // Если очередь не пуста, добавить этот узел после хвостового узла
        } else {
            this.#rear.next = node;
            this.#rear = node;
        }
        this.#queSize++;
    }

    /* Извлечь из очереди */
    pop() {
        const num = this.peek();
        // Удалить головной узел
        this.#front = this.#front.next;
        this.#queSize--;
        return num;
    }

    /* Получить элемент в начале очереди */
    peek() {
        if (this.size === 0) throw new Error('очередьпуст');
        return this.#front.val;
    }

    /* Преобразовать связный список в Array и вернуть его */
    toArray() {
        let node = this.#front;
        const res = new Array(this.size);
        for (let i = 0; i < res.length; i++) {
            res[i] = node.val;
            node = node.next;
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
console.log('Очередь пуста:' + isEmpty);
