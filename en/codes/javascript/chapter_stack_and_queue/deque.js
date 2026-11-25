/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver code */
/* Initialize the deque */
// JavaScript has no built-in deque, so use an Array as a deque
const deque = [];

/* Add elements to the deque */
deque.push(2);
deque.push(5);
deque.push(4);
// unshift() takes O(n) time because the deque uses an array
deque.unshift(3);
deque.unshift(1);
console.log('deque = ', deque);

/* Peek at the front and rear elements */
const peekFirst = deque[0];
console.log('Front element (peekFirst) = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('Rear element (peekLast) = ' + peekLast);

/* Remove elements from both ends */
// shift() takes O(n) time because the deque uses an array
const popFront = deque.shift();
console.log(
    'Removed from the front (popFront) = ' + popFront + ', deque after removal = ' + deque
);
const popBack = deque.pop();
console.log(
    'Removed from the rear (popBack) = ' + popBack + ', deque after removal = ' + deque
);

/* Get the deque size */
const size = deque.length;
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty = size === 0;
console.log('Deque is empty = ' + isEmpty);
