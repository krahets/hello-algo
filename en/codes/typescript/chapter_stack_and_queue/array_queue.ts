/**
 * File: array_queue.ts
 * Created Time: 2022-12-11
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Queue class based on circular array */
class ArrayQueue {
    private nums: number[]; // Array for storing queue elements
    private front: number; // Front pointer, pointing to the front element
    private queSize: number; // Queue length

    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = this.queSize = 0;
    }

    /* Get the capacity of the queue */
    get capacity(): number {
        return this.nums.length;
    }

    /* Get the length of the queue */
    get size(): number {
        return this.queSize;
    }

    /* Determine if the queue is empty */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Enqueue */
    push(num: number): void {
        if (this.size === this.capacity) {
            console.log('Queue is full');
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        // Use modulo operation to wrap the rear pointer from the end of the array back to the start
        const rear = (this.front + this.queSize) % this.capacity;
        // Add num to the rear
        this.nums[rear] = num;
        this.queSize++;
    }

    /* Dequeue */
    pop(): number {
        const num = this.peek();
        // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        this.front = (this.front + 1) % this.capacity;
        this.queSize--;
        return num;
    }

    /* Access front element */
    peek(): number {
        if (this.isEmpty()) throw new Error('Queue is empty');
        return this.nums[this.front];
    }

    /* Return Array */
    toArray(): number[] {
        // Only convert elements within valid length range
        const arr = new Array(this.size);
        for (let i = 0, j = this.front; i < this.size; i++, j++) {
            arr[i] = this.nums[j % this.capacity];
        }
        return arr;
    }
}

/* Driver Code */
/* Initialize queue */
const capacity = 10;
const queue = new ArrayQueue(capacity);

/* Element enqueue */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Queue queue =', queue.toArray());

/* Access front element */
const peek = queue.peek();
console.log('Front element peek =' + peek);

/* Element dequeue */
const pop = queue.pop();
console.log('Element dequeued, pop = ' + pop + ', after deque = ', queue.toArray());

/* Get the length of the queue */
const size = queue.size;
console.log('Length of the queue size =' + size);

/* Determine if the queue is empty */
const isEmpty = queue.isEmpty();
console.log('Is the queue empty =' + isEmpty);

/* Test circular array */
for (let i = 0; i < 10; i++) {
    queue.push(i);
    queue.pop();
    console.log('After the ' + i + 'th round of enqueueing + dequeuing, queue = ', queue.toArray());
}

export {};
