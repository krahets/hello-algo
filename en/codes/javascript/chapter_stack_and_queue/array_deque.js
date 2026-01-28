/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Double-ended queue based on circular array implementation */
class ArrayDeque {
    #nums; // Array for storing double-ended queue elements
    #front; // Front pointer, points to the front of the queue element
    #queSize; // Double-ended queue length

    /* Constructor */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* Get the capacity of the double-ended queue */
    capacity() {
        return this.#nums.length;
    }

    /* Get the length of the double-ended queue */
    size() {
        return this.#queSize;
    }

    /* Check if the double-ended queue is empty */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Calculate circular array index */
    index(i) {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        return (i + this.capacity()) % this.capacity();
    }

    /* Front of the queue enqueue */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Double-ended queue is full');
            return;
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        this.#front = this.index(this.#front - 1);
        // Add num to front of queue
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* Rear of the queue enqueue */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Double-ended queue is full');
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        const rear = this.index(this.#front + this.#queSize);
        // Front pointer moves one position backward
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Rear of the queue dequeue */
    popFirst() {
        const num = this.peekFirst();
        // Move front pointer backward by one position
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* Access rear of the queue element */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* Return list for printing */
    peekFirst() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.#nums[this.#front];
    }

    /* Driver Code */
    peekLast() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Initialize double-ended queue
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* Return array for printing */
    toArray() {
        // Elements enqueue
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* Get the length of the double-ended queue */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('Deque deque = [' + deque.toArray() + ']');

/* Update element */
const peekFirst = deque.peekFirst();
console.log('Front element peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('Rear element peekLast = ' + peekLast);

/* Elements enqueue */
deque.pushLast(4);
console.log('After element 4 enqueues at rear, deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('After element 1 enqueues at front, deque = [' + deque.toArray() + ']');

/* Element dequeue */
const popLast = deque.popLast();
console.log(
    'Rear dequeue element = ' +
        popLast +
        ', after rear dequeue deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    'Front dequeue element = ' +
        popFirst +
        ', after front dequeue deque = [' +
        deque.toArray() +
        ']'
);

/* Get the length of the double-ended queue */
const size = deque.size();
console.log('Double-ended queue length size = ' + size);

/* Check if the double-ended queue is empty */
const isEmpty = deque.isEmpty();
console.log('Double-ended queue is empty = ' + isEmpty);
