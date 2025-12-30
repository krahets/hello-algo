/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* Get the length of the double-ended queue */
// TypeScript has no built-in deque, can only use Array as deque
const deque: number[] = [];

/* Elements enqueue */
deque.push(2);
deque.push(5);
deque.push(4);
// Note: due to array, unshift() method has O(n) time complexity
deque.unshift(3);
deque.unshift(1);
console.log('Double-ended queue deque = ', deque);

/* Update element */
const peekFirst: number = deque[0];
console.log('Front element peekFirst = ' + peekFirst);
const peekLast: number = deque[deque.length - 1];
console.log('Rear element peekLast = ' + peekLast);

/* Element dequeue */
// Note: due to array, shift() method has O(n) time complexity
const popFront: number = deque.shift() as number;
console.log(
    'Front dequeue element popFront = ' + popFront + ', after front dequeue, deque = ' + deque
);
const popBack: number = deque.pop() as number;
console.log(
    'Dequeue rear element popBack = ' + popBack + ', after rear dequeue, deque = ' + deque
);

/* Get the length of the double-ended queue */
const size: number = deque.length;
console.log('Double-ended queue length size = ' + size);

/* Check if the double-ended queue is empty */
const isEmpty: boolean = size === 0;
console.log('Double-ended queue is empty = ' + isEmpty);

export {};
