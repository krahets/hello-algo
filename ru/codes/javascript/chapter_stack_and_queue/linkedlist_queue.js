/**
 * File: linkedlist_queue.js
 * Created Time: 2022-12-20
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Очередь на основе связного списка */
class LinkedListQueue {
    #front; // Первый узел #front
    #rear; // Последний узел #rear
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

    /* Добавить элемент в очередь */
    push(num) {
        // Добавить узел со значением num после последнего узла
        const node = new ListNode(num);
        // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
        if (!this.#front) {
            this.#front = node;
            this.#rear = node;
            // Если очередь непуста, добавить новый узел после последнего
        } else {
            this.#rear.next = node;
            this.#rear = node;
        }
        this.#queSize++;
    }

    /* Извлечь элемент из очереди */
    pop() {
        const num = this.peek();
        // Удалить первый узел
        this.#front = this.#front.next;
        this.#queSize--;
        return num;
    }

    /* Посмотреть первый элемент очереди */
    peek() {
        if (this.size === 0) throw new Error('Очередь пуста');
        return this.#front.val;
    }

    /* Преобразовать связный список в массив и вернуть его */
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
