/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Access front of the queue element */
// TypeScript has no built-in queue, can use Array as queue
const queue: number[] = [];

/* Elements enqueue */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Queue queue =', queue);

/* Return list for printing */
const peek = queue[0];
console.log('Front element peek =', peek);

/* Element dequeue */
// Underlying is array, so shift() method has O(n) time complexity
const pop = queue.shift();
console.log('Dequeue element pop =', pop, ', after dequeue, queue = ', queue);

/* Get the length of the queue */
const size = queue.length;
console.log('Queue length size =', size);

/* Check if the queue is empty */
const isEmpty = queue.length === 0;
console.log('Queue is empty = ', isEmpty);

export {};
