/**
 * File: array_deque.ts
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Deque backed by a circular array */
class ArrayDeque {
    private nums: number[]; // Array that stores the deque elements
    private front: number; // Index of the front element
    private queSize: number; // Deque size

    /* Constructor */
    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = 0;
        this.queSize = 0;
    }

    /* Get the deque capacity */
    capacity(): number {
        return this.nums.length;
    }

    /* Get the deque size */
    size(): number {
        return this.queSize;
    }

    /* Check whether the deque is empty */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Compute the circular array index */
    index(i: number): number {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        return (i + this.capacity()) % this.capacity();
    }

    /* Add an element at the front */
    pushFirst(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('Deque is full');
            return;
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        this.front = this.index(this.front - 1);
        // Add num at the front
        this.nums[this.front] = num;
        this.queSize++;
    }

    /* Add an element at the rear */
    pushLast(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('Deque is full');
            return;
        }
        // Compute the index one slot past the rear element
        const rear: number = this.index(this.front + this.queSize);
        // Add num at the rear
        this.nums[rear] = num;
        this.queSize++;
    }

    /* Remove and return the front element */
    popFirst(): number {
        const num: number = this.peekFirst();
        // Advance the front index by one
        this.front = this.index(this.front + 1);
        this.queSize--;
        return num;
    }

    /* Remove and return the rear element */
    popLast(): number {
        const num: number = this.peekLast();
        this.queSize--;
        return num;
    }

    /* Peek at the front element */
    peekFirst(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.nums[this.front];
    }

    /* Peek at the rear element */
    peekLast(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Compute the index of the rear element
        const last = this.index(this.front + this.queSize - 1);
        return this.nums[last];
    }

    /* Return an array for printing */
    toArray(): number[] {
        // Copy only the elements currently in the deque
        const res: number[] = [];
        for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
            res[i] = this.nums[this.index(j)];
        }
        return res;
    }
}

/* Driver code */
/* Initialize the deque */
const capacity = 5;
const deque: ArrayDeque = new ArrayDeque(capacity);
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

export {};
