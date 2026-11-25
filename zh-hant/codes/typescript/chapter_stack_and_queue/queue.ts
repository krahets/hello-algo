/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 範例程式 */
/* 初始化佇列 */
// TypeScript 沒有內建佇列，可以用 Array 當作佇列
const queue: number[] = [];

/* 將元素加入佇列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('佇列 queue =', queue);

/* 讀取隊首元素 */
const peek = queue[0];
console.log('隊首元素 peek =', peek);

/* 從佇列取出元素 */
// 底層使用陣列，因此 shift() 方法的時間複雜度為 O(n)
const pop = queue.shift();
console.log('出隊元素 pop =', pop, '，出隊後 queue = ', queue);

/* 取得佇列長度 */
const size = queue.length;
console.log('佇列長度 size =', size);

/* 判斷佇列是否為空 */
const isEmpty = queue.length === 0;
console.log('佇列是否為空 = ', isEmpty);

export {};
