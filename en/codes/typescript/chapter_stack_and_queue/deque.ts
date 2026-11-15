/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver code */
// [region]{init_deque}
/* Initialize the deque */
// TypeScript has no built-in deque; use an Array as a deque instead
const deque: number[] = [];
// [endregion]{init_deque}

// [region]{push}
/* Enqueue elements */
deque.push(2);
deque.push(5);
deque.push(4);
// Note: because this uses an array, unshift() has O(n) time complexity
deque.unshift(3);
deque.unshift(1);
// [endregion]{push}
console.log('Deque deque = ', deque);

// [region]{peek_first}
/* Access an element */
const peekFirst: number = deque[0];
// [endregion]{peek_first}
console.log('Front element peekFirst = ' + peekFirst);
// [region]{peek_last}
const peekLast: number = deque[deque.length - 1];
// [endregion]{peek_last}
console.log('Rear element peekLast = ' + peekLast);

// [region]{pop_first}
/* Dequeue an element */
// Note: because this uses an array, shift() has O(n) time complexity
const popFront: number = deque.shift() as number;
// [endregion]{pop_first}
console.log(
    'Element removed from the front, popFront = ' + popFront + ', after dequeuing from the front, deque = ' + deque
);
// [region]{pop_last}
const popBack: number = deque.pop() as number;
// [endregion]{pop_last}
console.log(
    'Element removed from the rear, popBack = ' + popBack + ', after dequeuing from the rear, deque = ' + deque
);

// [region]{size}
/* Get the deque size */
const size: number = deque.length;
// [endregion]{size}
console.log('Deque size = ' + size);

// [region]{is_empty}
/* Check whether the deque is empty */
const isEmpty: boolean = size === 0;
// [endregion]{is_empty}
console.log('Is the deque empty = ' + isEmpty);

export {};
