/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 範例程式 */
/* 初始化雙端佇列 */
// JavaScript 沒有內建雙端佇列，只能用 Array 來模擬
const deque = [];

/* 將元素加入雙端佇列 */
deque.push(2);
deque.push(5);
deque.push(4);
// 請注意，底層使用陣列，因此 unshift() 方法的時間複雜度為 O(n)
deque.unshift(3);
deque.unshift(1);
console.log('雙端佇列 deque = ', deque);

/* 讀取隊首與隊尾元素 */
const peekFirst = deque[0];
console.log('隊首元素 peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('隊尾元素 peekLast = ' + peekLast);

/* 從雙端佇列取出元素 */
// 請注意，底層使用陣列，因此 shift() 方法的時間複雜度為 O(n)
const popFront = deque.shift();
console.log(
    '從隊首取出的元素 popFront = ' + popFront + '，從隊首取出後 deque = ' + deque
);
const popBack = deque.pop();
console.log(
    '從隊尾取出的元素 popBack = ' + popBack + '，從隊尾取出後 deque = ' + deque
);

/* 取得雙端佇列長度 */
const size = deque.length;
console.log('雙端佇列長度 size = ' + size);

/* 判斷雙端佇列是否為空 */
const isEmpty = size === 0;
console.log('雙端佇列是否為空 = ' + isEmpty);
