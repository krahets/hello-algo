/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* 初始化雙向佇列 */
// JavaScript 沒有內建的雙端佇列，只能把 Array 當作雙端佇列來使用
const deque = [];

/* 元素入列 */
deque.push(2);
deque.push(5);
deque.push(4);
// 請注意，由於是陣列，unshift() 方法的時間複雜度為 O(n)
deque.unshift(3);
deque.unshift(1);
console.log('雙向佇列 deque = ', deque);

/* 訪問元素 */
const peekFirst = deque[0];
console.log('佇列首元素 peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('佇列尾元素 peekLast = ' + peekLast);

/* 元素出列 */
// 請注意，由於是陣列，shift() 方法的時間複雜度為 O(n)
const popFront = deque.shift();
console.log(
    '佇列首出列元素 popFront = ' + popFront + '，佇列首出列後 deque = ' + deque
);
const popBack = deque.pop();
console.log(
    '佇列尾出列元素 popBack = ' + popBack + '，佇列尾出列後 deque = ' + deque
);

/* 獲取雙向佇列的長度 */
const size = deque.length;
console.log('雙向佇列長度 size = ' + size);

/* 判斷雙向佇列是否為空 */
const isEmpty = size === 0;
console.log('雙向佇列是否為空 = ' + isEmpty);
