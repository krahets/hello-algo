/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* Get the length of the double-ended queue */
// JavaScript has no built-in deque, can only use Array as deque
const deque = [];

/* Elements enqueue */
deque.push(2);
deque.push(5);
deque.push(4);
// Note: due to array, unshift() method has O(n) time complexity
deque.unshift(3);
deque.unshift(1);
console.log('Double-ended queue deque = ', deque);

/* Update element */
const peekFirst = deque[0];
console.log('Front element peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('Rear element peekLast = ' + peekLast);

/* Element dequeue */
// Note: due to array, shift() method has O(n) time complexity
const popFront = deque.shift();
console.log(
    'Front dequeue element popFront = ' + popFront + ', after front dequeue, deque = ' + deque
);
const popBack = deque.pop();
console.log(
    'Dequeue rear element popBack = ' + popBack + ', after rear dequeue, deque = ' + deque
);

/* Get the length of the double-ended queue */
const size = deque.length;
console.log('Double-ended queue length size = ' + size);

/* Check if the double-ended queue is empty */
const isEmpty = size === 0;
console.log('Double-ended queue is empty = ' + isEmpty);
