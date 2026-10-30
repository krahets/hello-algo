/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver code */
/* Initialize the queue */
// JavaScript has no built-in queue; an Array can be used as a queue
const queue = [];

/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Queue queue =', queue);

/* Access the front element */
const peek = queue[0];
console.log('Front element peek =', peek);

/* Dequeue an element */
// The underlying structure is an array, so shift() has O(n) time complexity
const pop = queue.shift();
console.log('Dequeued element pop =', pop, '; after dequeuing, queue = ', queue);

/* Get the queue size */
const size = queue.length;
console.log('Queue size =', size);

/* Check whether the queue is empty */
const isEmpty = queue.length === 0;
console.log('Is the queue empty = ', isEmpty);
