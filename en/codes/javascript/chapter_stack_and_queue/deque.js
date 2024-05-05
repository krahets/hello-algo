/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* Initialize double-ended queue */
// JavaScript does not have a built-in deque, but Array can be used as a deque
const deque = [];

/* Element enqueue */
deque.push(2);
deque.push(5);
deque.push(4);
// Please note, as it is an array, the unshift() method has a time complexity of O(n)
deque.unshift(3);
deque.unshift(1);
console.log('Double-ended queue deque =', deque);

/* Access element */
const peekFirst = deque[0];
console.log('Front element peekFirst =' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('Back element peekLast =' + peekLast);

/* Element dequeue */
// Please note, as it is an array, the shift() method has a time complexity of O(n)
const popFront = deque.shift();
console.log(
    'Head dequeued element, popFront = ' + popFront + ', after deque = ' + deque
);
const popBack = deque.pop();
console.log(
    'Tail dequeued element, popBack = ' + popBack + ', after deque = ' + deque
);

/* Get the length of the double-ended queue */
const size = deque.length;
console.log('Length of the double-ended queue size =' + size);

/* Determine if the double-ended queue is empty */
const isEmpty = size === 0;
console.log('Is the double-ended queue empty =' + isEmpty);
