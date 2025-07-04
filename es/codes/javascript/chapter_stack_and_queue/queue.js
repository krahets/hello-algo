/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* 初始化队列 */
// JavaScript 没有内置的队列，可以把 Array 当作队列来使用
const queue = [];

/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('队列 queue =', queue);

/* 访问队首元素 */
const peek = queue[0];
console.log('队首元素 peek =', peek);

/* 元素出队 */
// 底层是数组，因此 shift() 方法的时间复杂度为 O(n)
const pop = queue.shift();
console.log('出队元素 pop =', pop, '，出队后 queue = ', queue);

/* 获取队列的长度 */
const size = queue.length;
console.log('队列长度 size =', size);

/* 判断队列是否为空 */
const isEmpty = queue.length === 0;
console.log('队列是否为空 = ', isEmpty);
