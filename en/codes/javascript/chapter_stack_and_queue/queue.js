/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* Initialize queue */
// JavaScript does not have a built-in queue, but Array can be used as a queue
const queue = [];

/* Element enqueue */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('Queue queue =', queue);

/* Access front element */
const peek = queue[0];
console.log('Front element peek =', peek);

/* Element dequeue */
// Since it's an array, the shift() method has a time complexity of O(n)
const pop = queue.shift();
console.log('Element dequeued, pop =', pop, ', after queue = ', queue);

/* Get the length of the queue */
const size = queue.length;
console.log('Queue length size =', size);

/* Determine if the queue is empty */
const isEmpty = queue.length === 0;
console.log('Is the queue empty =', isEmpty);
