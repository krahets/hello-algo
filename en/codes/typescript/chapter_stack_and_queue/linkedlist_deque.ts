/**
 * File: linkedlist_deque.ts
 * Created Time: 2023-02-04
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Doubly linked list node */
class ListNode {
    prev: ListNode | null; // Reference to the previous node
    next: ListNode | null; // Reference to the next node
    val: number; // Node value

    constructor(val: number) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

/* Deque backed by a doubly linked list */
class LinkedListDeque {
    private front: ListNode; // Head node (front)
    private rear: ListNode; // Tail node (rear)
    private queSize: number; // Deque size

    constructor() {
        this.front = null;
        this.rear = null;
        this.queSize = 0;
    }

    /* Add at the rear */
    pushLast(val: number): void {
        const node: ListNode = new ListNode(val);
        // If the list is empty, point both front and rear at node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Link node at the tail of the list
            this.rear.next = node;
            node.prev = this.rear;
            this.rear = node; // Update the tail
        }
        this.queSize++;
    }

    /* Add at the front */
    pushFirst(val: number): void {
        const node: ListNode = new ListNode(val);
        // If the list is empty, point both front and rear at node
        if (this.queSize === 0) {
            this.front = node;
            this.rear = node;
        } else {
            // Link node at the head of the list
            this.front.prev = node;
            node.next = this.front;
            this.front = node; // Update the head
        }
        this.queSize++;
    }

    /* Remove from the rear */
    popLast(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.rear!.val; // Save the tail node's value
        // When the deque contains one element, the head and tail point to the same node
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // Remove the tail node
        else {
            let temp: ListNode = this.rear!.prev;
            temp!.next = null;
            this.rear!.prev = null;
            this.rear = temp; // Update the tail
        }
        this.queSize--;
        return value;
    }

    /* Remove from the front */
    popFirst(): number {
        if (this.queSize === 0) {
            return null;
        }
        const value: number = this.front.val; // Save the head node's value
        // When the deque contains one element, the head and tail point to the same node
        if (this.queSize === 1) {
            this.front = null;
            this.rear = null;
        }
        // Remove the head node
        else {
            let temp: ListNode = this.front!.next;
            temp!.prev = null;
            this.front!.next = null;
            this.front = temp; // Update the head
        }
        this.queSize--;
        return value;
    }

    /* Peek at the rear element */
    peekLast(): number {
        return this.queSize === 0 ? null : this.rear.val;
    }

    /* Peek at the front element */
    peekFirst(): number {
        return this.queSize === 0 ? null : this.front.val;
    }

    /* Get the deque size */
    size(): number {
        return this.queSize;
    }

    /* Check whether the deque is empty */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Print the deque */
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

/* Driver code */
/* Initialize the deque */
const linkedListDeque: LinkedListDeque = new LinkedListDeque();
linkedListDeque.pushLast(3);
linkedListDeque.pushLast(2);
linkedListDeque.pushLast(5);
console.log('linkedListDeque = ');
linkedListDeque.print();

/* Peek at the front and rear elements */
const peekFirst: number = linkedListDeque.peekFirst();
console.log('Front element (peekFirst) = ' + peekFirst);
const peekLast: number = linkedListDeque.peekLast();
console.log('Rear element (peekLast) = ' + peekLast);

/* Add elements to the deque */
linkedListDeque.pushLast(4);
console.log('After adding 4 at the rear, linkedListDeque = ');
linkedListDeque.print();
linkedListDeque.pushFirst(1);
console.log('After adding 1 at the front, linkedListDeque = ');
linkedListDeque.print();

/* Remove elements from both ends */
const popLast: number = linkedListDeque.popLast();
console.log('Removed from the rear = ' + popLast + ', linkedListDeque after removal = ');
linkedListDeque.print();
const popFirst: number = linkedListDeque.popFirst();
console.log('Removed from the front = ' + popFirst + ', linkedListDeque after removal = ');
linkedListDeque.print();

/* Get the deque size */
const size: number = linkedListDeque.size();
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty: boolean = linkedListDeque.isEmpty();
console.log('Deque is empty = ' + isEmpty);
