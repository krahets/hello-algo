/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* 初始化双向队列 */
// JavaScript 没有内置的双端队列，只能把 Array 当作双端队列来使用
const deque = [];

/* 元素入队 */
deque.push(2);
deque.push(5);
deque.push(4);
// 请注意，由于是数组，unshift() 方法的时间复杂度为 O(n)
deque.unshift(3);
deque.unshift(1);
console.log('双向队列 deque = ', deque);

/* 访问元素 */
const peekFirst = deque[0];
console.log('队首元素 peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('队尾元素 peekLast = ' + peekLast);

/* 元素出队 */
// 请注意，由于是数组，shift() 方法的时间复杂度为 O(n)
const popFront = deque.shift();
console.log(
    '队首出队元素 popFront = ' + popFront + '，队首出队后 deque = ' + deque
);
const popBack = deque.pop();
console.log(
    '队尾出队元素 popBack = ' + popBack + '，队尾出队后 deque = ' + deque
);

/* 获取双向队列的长度 */
const size = deque.length;
console.log('双向队列长度 size = ' + size);

/* 判断双向队列是否为空 */
const isEmpty = size === 0;
console.log('双向队列是否为空 = ' + isEmpty);
