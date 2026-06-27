/**
 * File: array_deque.ts
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Double-ended queue based on circular array implementation */
class ArrayDeque {
    private nums: number[]; // Array for storing double-ended queue elements
    private front: number; // Front pointer, points to the front of the queue element
    private queSize: number; // Double-ended queue length

    /* Constructor */
    constructor(capacity: number) {
        this.nums = new Array(capacity);
        this.front = 0;
        this.queSize = 0;
    }

    /* Get the capacity of the double-ended queue */
    capacity(): number {
        return this.nums.length;
    }

    /* Get the length of the double-ended queue */
    size(): number {
        return this.queSize;
    }

    /* Check if the double-ended queue is empty */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Calculate circular array index */
    index(i: number): number {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        return (i + this.capacity()) % this.capacity();
    }

    /* Front of the queue enqueue */
    pushFirst(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('Double-ended queue is full');
            return;
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        this.front = this.index(this.front - 1);
        // Add num to front of queue
        this.nums[this.front] = num;
        this.queSize++;
    }

    /* Rear of the queue enqueue */
    pushLast(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('Double-ended queue is full');
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        const rear: number = this.index(this.front + this.queSize);
        // Front pointer moves one position backward
        this.nums[rear] = num;
        this.queSize++;
    }

    /* Rear of the queue dequeue */
    popFirst(): number {
        const num: number = this.peekFirst();
        // Move front pointer backward by one position
        this.front = this.index(this.front + 1);
        this.queSize--;
        return num;
    }

    /* Access rear of the queue element */
    popLast(): number {
        const num: number = this.peekLast();
        this.queSize--;
        return num;
    }

    /* Return list for printing */
    peekFirst(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.nums[this.front];
    }

    /* Driver Code */
    peekLast(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Initialize double-ended queue
        const last = this.index(this.front + this.queSize - 1);
        return this.nums[last];
    }

    /* Return array for printing */
    toArray(): number[] {
        // Elements enqueue
        const res: number[] = [];
        for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
            res[i] = this.nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* Get the length of the double-ended queue */
const capacity = 5;
const deque: ArrayDeque = new ArrayDeque(capacity);
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

export {};
