/**
 * File: array_deque.js
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Deque backed by a circular array */
class ArrayDeque {
    #nums; // Array that stores the deque elements
    #front; // Index of the front element
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

    /* Compute the circular array index */
    index(i) {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        return (i + this.capacity()) % this.capacity();
    }

    /* Add an element at the front */
    pushFirst(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Deque is full');
            return;
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        this.#front = this.index(this.#front - 1);
        // Add num at the front
        this.#nums[this.#front] = num;
        this.#queSize++;
    }

    /* Add an element at the rear */
    pushLast(num) {
        if (this.#queSize === this.capacity()) {
            console.log('Deque is full');
            return;
        }
        // Compute the index one slot past the rear element
        const rear = this.index(this.#front + this.#queSize);
        // Add num at the rear
        this.#nums[rear] = num;
        this.#queSize++;
    }

    /* Remove and return the front element */
    popFirst() {
        const num = this.peekFirst();
        // Advance the front index by one
        this.#front = this.index(this.#front + 1);
        this.#queSize--;
        return num;
    }

    /* Remove and return the rear element */
    popLast() {
        const num = this.peekLast();
        this.#queSize--;
        return num;
    }

    /* Peek at the front element */
    peekFirst() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.#nums[this.#front];
    }

    /* Peek at the rear element */
    peekLast() {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Compute the index of the rear element
        const last = this.index(this.#front + this.#queSize - 1);
        return this.#nums[last];
    }

    /* Return an array for printing */
    toArray() {
        // Copy only the elements currently in the deque
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
console.log('deque = [' + deque.toArray() + ']');

/* Peek at the front and rear elements */
const peekFirst = deque.peekFirst();
console.log('Front element (peekFirst) = ' + peekFirst);
const peekLast = deque.peekLast();
console.log('Rear element (peekLast) = ' + peekLast);

/* Add elements to the deque */
deque.pushLast(4);
console.log('After adding 4 at the rear, deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('After adding 1 at the front, deque = [' + deque.toArray() + ']');

/* Remove elements from both ends */
const popLast = deque.popLast();
console.log(
    'Removed from the rear = ' +
        popLast +
        ', deque after removal = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    'Removed from the front = ' +
        popFirst +
        ', deque after removal = [' +
        deque.toArray() +
        ']'
);

/* Get the deque size */
const size = deque.size();
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty = deque.isEmpty();
console.log('Deque is empty = ' + isEmpty);
