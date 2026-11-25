/**
 * File: linkedlist_deque.js
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Doubly linked list node */
class ListNode {
    prev; // Reference to the previous node
    next; // Reference to the next node
    val; // Node value

    constructor(val) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Deque backed by a doubly linked list */
class LinkedListDeque {
    #front; // Head node (front)
    #rear; // Tail node (rear)
    #queSize; // Deque size

    constructor() {
        this.#front = null;
        this.#rear = null;
        this.#queSize = 0;
    }

    /* Add at the rear */
    pushLast(val) {
        const node = new ListNode(val);
        // If the list is empty, point both #front and #rear at node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Link node at the tail of the list
            this.#rear.next = node;
            node.prev = this.#rear;
            this.#rear = node; // Update the tail
        }
        this.#queSize++;
    }

    /* Add at the front */
    pushFirst(val) {
        const node = new ListNode(val);
        // If the list is empty, point both #front and #rear at node
        if (this.#queSize === 0) {
            this.#front = node;
            this.#rear = node;
        } else {
            // Link node at the head of the list
            this.#front.prev = node;
            node.next = this.#front;
            this.#front = node; // Update the head
        }
        this.#queSize++;
    }

    /* Remove from the rear */
    popLast() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#rear.val; // Save the tail node's value
        // When the deque contains one element, the head and tail point to the same node
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // Remove the tail node
        else {
            let temp = this.#rear.prev;
            temp.next = null;
            this.#rear.prev = null;
            this.#rear = temp; // Update the tail
        }
        this.#queSize--;
        return value;
    }

    /* Remove from the front */
    popFirst() {
        if (this.#queSize === 0) {
            return null;
        }
        const value = this.#front.val; // Save the head node's value
        // When the deque contains one element, the head and tail point to the same node
        if (this.#queSize === 1) {
            this.#front = null;
            this.#rear = null;
        }
        // Remove the head node
        else {
            let temp = this.#front.next;
            temp.prev = null;
            this.#front.next = null;
            this.#front = temp; // Update the head
        }
        this.#queSize--;
        return value;
    }

    /* Peek at the rear element */
    peekLast() {
        return this.#queSize === 0 ? null : this.#rear.val;
    }

    /* Peek at the front element */
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
console.log('linkedListDeque = ');
linkedListDeque.print();

/* Peek at the front and rear elements */
const peekFirst = linkedListDeque.peekFirst();
console.log('Front element (peekFirst) = ' + peekFirst);
const peekLast = linkedListDeque.peekLast();
console.log('Rear element (peekLast) = ' + peekLast);

/* Add elements to the deque */
linkedListDeque.pushLast(4);
console.log('After adding 4 at the rear, linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('After adding 1 at the front, linkedListDeque = ');
linkedListDeque.print();

/* Remove elements from both ends */
const popLast = linkedListDeque.popLast();
console.log('Removed from the rear = ' + popLast + ', linkedListDeque after removal = ');
linkedListDeque.print();
const popFirst = linkedListDeque.popFirst();
console.log('Removed from the front = ' + popFirst + ', linkedListDeque after removal = ');
linkedListDeque.print();

/* Get the deque size */
const size = linkedListDeque.size();
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty = linkedListDeque.isEmpty();
console.log('Deque is empty = ' + isEmpty);
