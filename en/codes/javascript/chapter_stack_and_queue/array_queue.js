/**
 * File: array_queue.js
 * Created Time: 2022-12-13
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Queue based on circular array implementation */
class ArrayQueue {
    #nums; // Array for storing queue elements
    #front = 0; // Front pointer, points to the front of the queue element
    #queSize = 0; // Queue length

    constructor(capacity) {
        this.#nums = new Array(capacity);
    }

    /* Get the capacity of the queue */
    get capacity() {
        return this.#nums.length;
    }

    /* Get the length of the queue */
    get size() {
        return this.#queSize;
    }

    /* Check if the queue is empty */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Enqueue */
    push(num) {
        if (this.size === this.capacity) {
            console.log('Queue is full');
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        // Add num to the rear of the queue
        const rear = (this.#front + this.size) % this.capacity;
        // Front pointer moves one position backward
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Dequeue */
    pop() {
        const num = this.peek();
        // Move front pointer backward by one position, if it passes the tail, return to array head
        this.#front = (this.#front + 1) % this.capacity;
        this.#queSize--;
        return num;
    }

    /* Return list for printing */
    peek() {
        if (this.isEmpty()) throw new Error('Queue is empty');
        return this.#nums[this.#front];
    }

    /* Return Array */
    toArray() {
        // Elements enqueue
        const arr = new Array(this.size);
        for (let i = 0, j = this.#front; i < this.size; i++, j++) {
            arr[i] = this.#nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver Code */
/* Access front of the queue element */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* Elements enqueue */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Queue queue =', queue.toArray());

/* Return list for printing */
const peek = queue.peek();
console.log('Front element peek = ' + peek);

/* Element dequeue */
const pop = queue.pop();
console.log('Dequeue element pop = ' + pop + ', after dequeue queue =', queue.toArray());

/* Get the length of the queue */
const size = queue.size;
console.log('Queue length size = ' + size);

/* Check if the queue is empty */
const isEmpty = queue.isEmpty();
console.log('Queue is empty = ' + isEmpty);

/* Test circular array */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('Round ' + i + ' rounds of enqueue + dequeue, queue =', queue.toArray());
}
