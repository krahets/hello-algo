/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Queue backed by a circular array */
class ArrayQueue {
    #nums; // Array that stores the queue elements
    #front = 0; // Index of the front element
    #queSize = 0; // Queue size

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* Get the queue capacity */
    get capacity() {
        return this.#nums.length;
    }

    /* Get the queue size */
    get size() {
        return this.#queSize;
    }

    /* Check whether the queue is empty */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Enqueue an element */
    push(num) {
        if (this.size === this.capacity) {
            console.log('Queue is full');
            return;
        }
        // Compute the index one slot past the rear element
        // Use the remainder to wrap rear back to the start of the array
        const rear = (this.#front + this.size) % this.capacity;
        // Add num at the rear
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Remove and return the front element */
    pop() {
        const num = this.peek();
        // Advance the front index by one, wrapping to the start if it passes the end
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* Peek at the front element */
    peek() {
        if (this.isEmpty()) throw new Error('Queue is empty');
        return this.#nums[this.#front];
    }

    /* Return the elements as an array */
    toArray() {
        // Copy only the elements currently in the queue
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver code */
/* Initialize the queue */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('queue =', queue.toArray());

/* Peek at the front element */
const peek = queue.peek();
console.log('Front element (peek) = ' + peek);

/* Dequeue an element */
const pop = queue.pop();
console.log('Dequeued element (pop) = ' + pop + ', queue after removal =', queue.toArray());

/* Get the queue size */
const size = queue.size;
console.log('Queue size = ' + size);

/* Check whether the queue is empty */
const isEmpty = queue.isEmpty();
console.log('Queue is empty = ' + isEmpty);

/* Test the circular array */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('After round ' + i + ' of enqueueing and dequeueing, queue =', queue.toArray());
}
