/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Doubly linked list node */
class ListNode {
    prev; // Reference (pointer) to the previous node
    next; // Reference (pointer) to the next node
    val; // Node value

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Deque implemented with a doubly linked list */
class LinkedListDeque {
    #front; // Head node front
    #rear; // Tail node rear
    #queSize; // Deque size

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* Enqueue at the rear */
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
            this.#rear = node; // Update the tail node
        }
        this.#queSize++;
    }

    /* Enqueue at the front */
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
            this.#front = node; // Update the head node
        }
        this.#queSize++;
    }

    /* Dequeue from the rear */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // Store the tail node value
        // When the queue size is 1, the head and tail point to the same node
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // Remove the tail node
        else {
            let temp = this.#rear.prev;
            temp.next = null;
            this.#rear.prev = null;
            this.#rear = temp; // Update the tail node
        }
        this.#queSize--;
        return value;
    }

    /* Dequeue from the front */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // Store the head node value
        // When the queue size is 1, the head and tail point to the same node
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // Remove the head node
        else {
            let temp = this.#front.next;
            temp.prev = null;
            this.#front.next = null;
            this.#front = temp; // Update the head node
        }
        this.#queSize--;
        return value;
    }

    /* Access the rear element */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* Access the front element */
    peekFirst() {
        return this.#queSize === 0 ? null : this.#front.val;
    }

    /* Get the deque size */
    size() {
        return this.#queSize;
    }

    /* Check whether the deque is empty */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Print the deque */
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

/* Driver code */
/* Initialize the deque */
const linkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('Deque linkedListDeque = ');
linkedListDeque.print();

/* Access an element */
const peekFirst = linkedListDeque.peekFirst();
console.log('Front element peekFirst = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('Rear element peekLast = ' + peekLast);

/* Enqueue elements */
linkedListDeque.pushLast(4);
console.log('After enqueuing 4 at the rear, linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('After enqueuing 1 at the front, linkedListDeque = ');
linkedListDeque.print();

/* Dequeue an element */
const popLast = linkedListDeque.popLast();
console.log('Element dequeued from the rear = ' + popLast + '; after removing from the rear, linkedListDeque = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('Element dequeued from the front = ' + popFirst + '; after removing from the front, linkedListDeque = ');
linkedListDeque.print();

/* Get the deque size */
const size = linkedListDeque.size();
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty = linkedListDeque.isEmpty();
console.log('Is the deque empty = ' + isEmpty);
