/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver code */
/* Initialize the deque */
// JavaScript has no built-in deque; use an Array as a deque
const deque = [];

/* Enqueue elements */
deque.push(2);
deque.push(5);
deque.push(4);
// Note: because this uses an array, unshift() has O(n) time complexity
deque.unshift(3);
deque.unshift(1);
console.log('Deque deque = ', deque);

/* Access an element */
const peekFirst = deque[0];
console.log('Front element peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('Rear element peekLast = ' + peekLast);

/* Dequeue an element */
// Note: because this uses an array, shift() has O(n) time complexity
const popFront = deque.shift();
console.log(
    'Element removed from the front, popFront = ' + popFront + ', after dequeuing from the front, deque = ' + deque
);
const popBack = deque.pop();
console.log(
    'Element removed from the rear, popBack = ' + popBack + ', after dequeuing from the rear, deque = ' + deque
);

/* Get the deque size */
const size = deque.length;
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty = size === 0;
console.log('Is the deque empty = ' + isEmpty);
