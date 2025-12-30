/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Doubly linked list node */
class ListNode {
    prev; // Predecessor node reference (pointer)
    next; // Successor node reference (pointer)
    val; // Node value

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Double-ended queue based on doubly linked list implementation */
class LinkedListDeque {
    #front; // Head node front
    #rear; // Tail node rear
    #queSize; // Length of the double-ended queue

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* Rear of the queue enqueue operation */
    pushLast(val) {
        const node = new ListNode(val);
        // If the linked list is empty, make both front and rear point to node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Add node to the tail of the linked list
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // Update tail node
        }
        this.#queSize++;
    }

    /* Front of the queue enqueue operation */
    pushFirst(val) {
        const node = new ListNode(val);
        // If the linked list is empty, make both front and rear point to node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Add node to the head of the linked list
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // Update head node
        }
        this.#queSize++;
    }

    /* Temporarily store tail node value */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // Store tail node value
        // Update tail node
        let temp = this.#rear.prev;
        if (temp !== null) {
            temp.next = null;
            this.#rear.prev = null;
        }
        this.#rear = temp; // Update tail node
        this.#queSize--;
        return value;
    }

    /* Temporarily store head node value */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // Store tail node value
        // Delete head node
        let temp = this.#front.next;
        if (temp !== null) {
            temp.prev = null;
            this.#front.next = null;
        }
        this.#front = temp; // Update head node
        this.#queSize--;
        return value;
    }

    /* Driver Code */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* Return list for printing */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* Get the length of the double-ended queue */
    size() {
        return this.#queSize;
    }

    /* Check if the double-ended queue is empty */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Print deque */
    print() {
        const arr = [];
        let temp = this.#front;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log('[' + arr.join(', ') + ']');
    }
}

/* Driver Code */
/* Get the length of the double-ended queue */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('Deque linkedListDeque = ');
linkedListDeque.print();

/* Update element */
const peekFirst = linkedListDeque.peekFirst();
console.log('Front element peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('Rear element peekLast = ' + peekLast);

/* Elements enqueue */
linkedListDeque.pushLast(4);
console.log('After element 4 enqueues at rear, linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('After element 1 enqueues at front, linkedListDeque = ');
linkedListDeque.print();

/* Element dequeue */
const popLast = linkedListDeque.popLast();
console.log('Rear dequeue element = ' + popLast + ', after rear dequeue linkedListDeque = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('Front dequeue element = ' + popFirst + ', after front dequeue linkedListDeque = ');
linkedListDeque.print();

/* Get the length of the double-ended queue */
const size = linkedListDeque.size();
console.log('Double-ended queue length size = ' + size);

/* Check if the double-ended queue is empty */
const isEmpty = linkedListDeque.isEmpty();
console.log('Double-ended queue is empty = ' + isEmpty);
