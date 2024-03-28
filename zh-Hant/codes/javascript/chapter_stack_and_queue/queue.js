/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* 初始化佇列 */
// JavaScript 沒有內建的佇列，可以把 Array 當作佇列來使用
const queue = [];

/* 元素入列 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('佇列 queue =', queue);

/* 訪問佇列首元素 */
const peek = queue[0];
console.log('佇列首元素 peek =', peek);

/* 元素出列 */
// 底層是陣列，因此 shift() 方法的時間複雜度為 O(n)
const pop = queue.shift();
console.log('出列元素 pop =', pop, '，出列後 queue = ', queue);

/* 獲取佇列的長度 */
const size = queue.length;
console.log('佇列長度 size =', size);

/* 判斷佇列是否為空 */
const isEmpty = queue.length === 0;
console.log('佇列是否為空 = ', isEmpty);
