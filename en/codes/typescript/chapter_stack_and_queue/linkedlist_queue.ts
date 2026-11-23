/**
 * File: linkedlist_queue.ts
 * Created Time: 2022-12-19
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

import { ListNode } from '../modules/ListNode';

/* Queue implemented with a linked list */
class LinkedListQueue {
    private front: ListNode | null; // Head node front
    private rear: ListNode | null; // Tail node rear
    private queSize: number = 0;

    constructor() {
        this.front = null;
        this.rear = null;
    }

    /* Get the queue size */
    get size(): number {
        return this.queSize;
    }

    /* Check whether the queue is empty */
    isEmpty(): boolean {
        return this.size === 0;
    }

    /* Enqueue */
    push(num: number): void {
        // Add num after the tail node
        const node = new ListNode(num);
        // If the queue is empty, make both the head and tail point to this node
        if (!this.front) {
            this.front = node;
            this.rear = node;
            // If the queue is not empty, add this node after the tail node
        } else {
            this.rear!.next = node;
            this.rear = node;
        }
        this.queSize++;
    }

    /* Dequeue */
    pop(): number {
        const num = this.peek();
        if (!this.front) throw new Error('Queue is empty');
        // Remove the head node
        this.front = this.front.next;
        this.queSize--;
        return num;
    }

    /* Access the front element */
    peek(): number {
        if (this.size === 0) throw new Error('Queue is empty');
        return this.front!.val;
    }

    /* Convert the linked list to an Array and return it */
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

/* Driver code */
/* Initialize the queue */
const queue = new LinkedListQueue();

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Queue queue = ' + queue.toArray());

/* Access the front element */
const peek = queue.peek();
console.log('Front element peek = ' + peek);

/* Dequeue an element */
const pop = queue.pop();
console.log('Dequeued element pop = ' + pop + '; after dequeuing, queue = ' + queue.toArray());

/* Get the queue size */
const size = queue.size;
console.log('Queue size = ' + size);

/* Check whether the queue is empty */
const isEmpty = queue.isEmpty();
console.log('Is the queue empty = ' + isEmpty);

export {};
