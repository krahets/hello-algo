/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver code */
// [region]{init_queue}
/* Initialize the queue */
// JavaScript has no built-in queue; an Array can be used as a queue
const queue = [];
// [endregion]{init_queue}

// [region]{push}
/* Enqueue elements */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
// [endregion]{push}
console.log('Queue queue =', queue);

// [region]{peek}
/* Access the front element */
const peek = queue[0];
// [endregion]{peek}
console.log('Front element peek =', peek);

// [region]{pop}
/* Dequeue an element */
// The underlying structure is an array, so shift() has O(n) time complexity
const pop = queue.shift();
// [endregion]{pop}
console.log('Dequeued element pop =', pop, '; after dequeuing, queue = ', queue);

// [region]{size}
/* Get the queue size */
const size = queue.length;
// [endregion]{size}
console.log('Queue size =', size);

// [region]{is_empty}
/* Check whether the queue is empty */
const isEmpty = queue.length === 0;
// [endregion]{is_empty}
console.log('Is the queue empty = ', isEmpty);
