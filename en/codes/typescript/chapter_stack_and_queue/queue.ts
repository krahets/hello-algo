/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver code */
/* Initialize the queue */
// TypeScript has no built-in queue, so use an Array as a queue
const queue: number[] = [];

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('queue =', queue);

/* Peek at the front element */
const peek = queue[0];
console.log('Front element (peek) =', peek);

/* Dequeue an element */
// shift() takes O(n) time because the queue uses an array
const pop = queue.shift();
console.log('Dequeued element (pop) =', pop, '| queue after removal = ', queue);

/* Get the queue size */
const size = queue.length;
console.log('Queue size =', size);

/* Check whether the queue is empty */
const isEmpty = queue.length === 0;
console.log('Queue is empty = ', isEmpty);

export {};
