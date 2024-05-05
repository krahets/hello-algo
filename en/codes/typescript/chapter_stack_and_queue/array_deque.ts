/**
 * File: array_deque.ts
 * Created Time: 2023-02-28
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Double-ended queue class based on circular array */
class ArrayDeque {
    private nums: number[]; // Array used to store elements of the double-ended queue
    private front: number; // Front pointer, pointing to the front element
    private queSize: number; // Length of the double-ended queue

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

    /* Determine if the double-ended queue is empty */
    isEmpty(): boolean {
        return this.queSize === 0;
    }

    /* Calculate circular array index */
    index(i: number): number {
        // Implement circular array by modulo operation
        // When i exceeds the tail of the array, return to the head
        // When i exceeds the head of the array, return to the tail
        return (i + this.capacity()) % this.capacity();
    }

    /* Front enqueue */
    pushFirst(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('Double-ended queue is full');
            return;
        }
        // Move the front pointer one position to the left
        // Implement front crossing the head of the array to return to the tail by modulo operation
        this.front = this.index(this.front - 1);
        // Add num to the front
        this.nums[this.front] = num;
        this.queSize++;
    }

    /* Rear enqueue */
    pushLast(num: number): void {
        if (this.queSize === this.capacity()) {
            console.log('Double-ended queue is full');
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        const rear: number = this.index(this.front + this.queSize);
        // Add num to the rear
        this.nums[rear] = num;
        this.queSize++;
    }

    /* Front dequeue */
    popFirst(): number {
        const num: number = this.peekFirst();
        // Move front pointer one position backward
        this.front = this.index(this.front + 1);
        this.queSize--;
        return num;
    }

    /* Rear dequeue */
    popLast(): number {
        const num: number = this.peekLast();
        this.queSize--;
        return num;
    }

    /* Access front element */
    peekFirst(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        return this.nums[this.front];
    }

    /* Access rear element */
    peekLast(): number {
        if (this.isEmpty()) throw new Error('The Deque Is Empty.');
        // Calculate rear element index
        const last = this.index(this.front + this.queSize - 1);
        return this.nums[last];
    }

    /* Return array for printing */
    toArray(): number[] {
        // Only convert elements within valid length range
        const res: number[] = [];
        for (let i = 0, j = this.front; i < this.queSize; i++, j++) {
            res[i] = this.nums[this.index(j)];
        }
        return res;
    }
}

/* Driver Code */
/* Initialize double-ended queue */
const capacity = 5;
const deque: ArrayDeque = new ArrayDeque(capacity);
deque.pushLast(3);
deque.pushLast(2);
deque.pushLast(5);
console.log('Double-ended queue deque = [' + deque.toArray() + ']');

/* Access element */
const peekFirst = deque.peekFirst();
console.log('Front element peekFirst =' + peekFirst);
const peekLast = deque.peekLast();
console.log('Back element peekLast =' + peekLast);

/* Element enqueue */
deque.pushLast(4);
console.log('Element 4 enqueued at the tail, deque = [' + deque.toArray() + ']');
deque.pushFirst(1);
console.log('Element 1 enqueued at the head, deque = [' + deque.toArray() + ']');

/* Element dequeue */
const popLast = deque.popLast();
console.log(
    'Tail dequeued element =' +
        popLast +
        ', deque after tail dequeue = [' +
        deque.toArray() +
        ']'
);
const popFirst = deque.popFirst();
console.log(
    'Head dequeued element =' +
        popFirst +
        ', deque after head dequeue = [' +
        deque.toArray() +
        ']'
);

/* Get the length of the double-ended queue */
const size = deque.size();
console.log('Length of the double-ended queue size =' + size);

/* Determine if the double-ended queue is empty */
const isEmpty = deque.isEmpty();
console.log('Is the double-ended queue empty =' + isEmpty);

export {};
