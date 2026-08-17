/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Doubly linked list node */
class ListNode {
    prev: ListNode; // Predecessor node reference (pointer)
    next: ListNode; // Successor node reference (pointer)
    val: number; // Node value

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Double-ended queue based on doubly linked list implementation */
class LinkedListDeque {
    private front: ListNode; // Head node front
    private rear: ListNode; // Tail node rear
    private queSize: number; // Length of the double-ended queue

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* Rear of the queue enqueue operation */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // If the linked list is empty, make both front and rear point to node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Add node to the tail of the linked list
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // Update tail node
        }
        this.queSize++;
    }

    /* Front of the queue enqueue operation */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // If the linked list is empty, make both front and rear point to node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Add node to the head of the linked list
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // Update head node
        }
        this.queSize++;
    }

    /* Temporarily store tail node value */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear.val; // Store tail node value
        // Update tail node
        let temp: ListNode = this.rear.prev;
        if (temp !== null) {
            temp.next = null;
            this.rear.prev = null;
        }
        this.rear = temp; // Update tail node
        this.queSize--;
        return value;
    }

    /* Temporarily store head node value */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // Store tail node value
        // Delete head node
        let temp: ListNode = this.front.next;
        if (temp !== null) {
            temp.prev = null;
            this.front.next = null;
        }
        this.front = temp; // Update head node
        this.queSize--;
        return value;
    }

    /* Driver Code */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* Return list for printing */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* Get the length of the double-ended queue */
    size(): number {
        return this.queSize;
    }

    /* Check if the double-ended queue is empty */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Print deque */
    print(): void {
        const arr: number[] = [];
        let temp: ListNode = this.front;
        while (temp !== null) {
            arr.push(temp.val);
            temp = temp.next;
        }
        console.log('[' + arr.join(', ') + ']');
    }
}

/* Driver Code */
/* Get the length of the double-ended queue */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('Deque linkedListDeque = ');
linkedListDeque.print();

/* Update element */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('Front element peekFirst = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('Rear element peekLast = ' + peekLast);

/* Elements enqueue */
linkedListDeque.pushLast(4);
console.log('After element 4 enqueues at rear, linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('After element 1 enqueues at front, linkedListDeque = ');
linkedListDeque.print();

/* Element dequeue */
const popLast: number = linkedListDeque.popLast();
console.log('Rear dequeue element = ' + popLast + ', after rear dequeue linkedListDeque = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('Front dequeue element = ' + popFirst + ', after front dequeue linkedListDeque = ');
linkedListDeque.print();

/* Get the length of the double-ended queue */
const size: number = linkedListDeque.size();
console.log('Double-ended queue length size = ' + size);

/* Check if the double-ended queue is empty */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('Double-ended queue is empty = ' + isEmpty);
