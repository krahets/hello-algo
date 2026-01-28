/**
 * File: linkedlist_queue.js
 * Created Time: 2022-12-20
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

const { ListNode } = require('../modules/ListNode');

/* Queue based on linked list implementation */
class LinkedListQueue {
    #front; // Front node #front
    #rear; // Rear node #rear
    #queSize = 0;

    constructor() {
        this.#front = null;
        this.#rear = null;
    }

    /* Get the length of the queue */
    get size() {
        return this.#queSize;
    }

    /* Check if the queue is empty */
    isEmpty() {
        return this.size === 0;
    }

    /* Enqueue */
    push(num) {
        // Add num after the tail node
        const node = new ListNode(num);
        // If the queue is empty, make both front and rear point to the node
        if (!this.#front) {
            this.#front = node;
            this.#rear = node;
            // If the queue is not empty, add the node after the tail node
        } else {
            this.#rear.next = node;
            this.#rear = node;
        }
        this.#queSize++;
    }

    /* Dequeue */
    pop() {
        const num = this.peek();
        // Delete head node
        this.#front = this.#front.next;
        this.#queSize--;
        return num;
    }

    /* Return list for printing */
    peek() {
        if (this.size === 0) throw new Error('Queue is empty');
        return this.#front.val;
    }

    /* Convert linked list to Array and return */
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
/* Access front of the queue element */
const queue = new LinkedListQueue();

/* Elements enqueue */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Queue queue = ' + queue.toArray());

/* Return list for printing */
const peek = queue.peek();
console.log('Front element peek = ' + peek);

/* Element dequeue */
const pop = queue.pop();
console.log('Dequeue element pop = ' + pop + ', after dequeue, queue = ' + queue.toArray());

/* Get the length of the queue */
const size = queue.size;
console.log('Queue length size = ' + size);

/* Check if the queue is empty */
const isEmpty = queue.isEmpty();
console.log('Queue is empty = ' + isEmpty);
