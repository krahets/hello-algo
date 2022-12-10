/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 初始化队列 */
// TypeScript 没有内置的队列，可以把 Array 当作队列来使用 
// 注意：由于是数组，所以 shift() 的时间复杂度是 O(n)
const queue: number[] = [];

/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);

/* 访问队首元素 */
const peek = queue[0];

/* 元素出队 */
// O(n)
const poll = queue.shift();

/* 获取队列的长度 */
const size = queue.length;

/* 判断队列是否为空 */
const empty = queue.length === 0;

export { };
