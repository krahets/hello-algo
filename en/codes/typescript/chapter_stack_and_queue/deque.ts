/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver code */
/* Initialize the deque */
// TypeScript has no built-in deque, so use an Array as a deque
const deque: number[] = [];

/* Add elements to the deque */
deque.push(2);
deque.push(5);
deque.push(4);
// unshift() takes O(n) time because the deque uses an array
deque.unshift(3);
deque.unshift(1);
console.log('deque = ', deque);

/* Peek at the front and rear elements */
const peekFirst: number = deque[0];
console.log('Front element (peekFirst) = ' + peekFirst);
const peekLast: number = deque[deque.length - 1];
console.log('Rear element (peekLast) = ' + peekLast);

/* Remove elements from both ends */
// shift() takes O(n) time because the deque uses an array
const popFront: number = deque.shift() as number;
console.log(
    'Removed from the front (popFront) = ' + popFront + ', deque after removal = ' + deque
);
const popBack: number = deque.pop() as number;
console.log(
    'Removed from the rear (popBack) = ' + popBack + ', deque after removal = ' + deque
);

/* Get the deque size */
const size: number = deque.length;
console.log('Deque size = ' + size);

/* Check whether the deque is empty */
const isEmpty: boolean = size === 0;
console.log('Deque is empty = ' + isEmpty);

export {};
