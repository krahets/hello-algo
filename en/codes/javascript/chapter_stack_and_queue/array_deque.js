/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Deque implemented with a circular array */
class ArrayDeque {
    #nums; // Array for storing deque elements
    #front; // Front pointer, pointing to the first element
    #queSize; // Deque size

    /* Constructor */
    constructor(capacity) {
        this.#nums = new Array(capacity);
        this.#front = 0;
        this.#queSize = 0;
    }

    /* Get the deque capacity */
    capacity() {
        return this.#nums.length;
    }

    /* Get the deque size */
    size() {
        return this.#queSize;
    }

    /* Check whether the deque is empty */
    isEmpty() {
        return this.#queSize === 0;
    }

    /* Calculate an index in the circular array */
    index(i) {
        // Use modulo to connect the end of the array to its beginning
        // When i passes the end of the array, wrap around to the beginning
        // When i passes the beginning of the array, wrap around to the end
        return (i + this.capacity()) % this.capacity();
    }

    /* Enqueue at the front */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Deque is full');
            return;
        }
        // Move the front pointer one position to the left
        // Use modulo to wrap front to the end when it passes the beginning of the array
        this.#front = this.index(this.#front - 1);
        // Add num to the front
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* Enqueue at the rear */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Deque is full');
            return;
        }
        // Calculate the rear pointer, which points one position past the last element
        const rear = this.index(this.#front + this.#queSize);
        // Add num to the rear
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Dequeue from the front */
    popFirst() {
        const num = this.peekFirst();
        // Advance the front pointer by one position
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* Dequeue from the rear */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* Access the front element */
    peekFirst() {
        if (this.isEmpty()) throw new Error('Deque is empty');
        return this.#nums[this.#front];
    }

    /* Access the rear element */
    peekLast() {
        if (this.isEmpty()) throw new Error('Deque is empty');
        // Calculate the index of the last element
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* Return an array for printing */
    toArray() {
        // Convert only the list elements within the occupied range
        const res = [];
        for (let i = 0, j = this.#front; i < this.#queSize; i++, j++) {
            res[i] = this.#nums[this.index(j)];
        }
        return res;
    }
}

/* Driver code */
/* Initialize the deque */
const capacity = 5;
const deque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('Deque deque = [' + deque.toArray() + ']');

/* Access an element */
const peekFirst = deque.peekFirst();
console.log('Front element peekFirst = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('Rear element peekLast = ' + peekLast);

/* Enqueue elements */
deque.pushLast(4);
console.log('After enqueuing 4 at the rear, deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('After enqueuing 1 at the front, deque = [' + deque.toArray() + ']');

/* Dequeue an element */
const popLast = deque.popLast();
console.log(
    'Element dequeued from the rear = ' +
        popLast +
        '; after removing from the rear, deque = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    'Element dequeued from the front = ' +
        popFirst +
        '; after removing from the front, deque = [' +
        deque.toArray() +
        ']'
);

/* Get the deque size */
const size = deque.size();
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty = deque.isEmpty();
console.log('Is the deque empty = ' + isEmpty);
