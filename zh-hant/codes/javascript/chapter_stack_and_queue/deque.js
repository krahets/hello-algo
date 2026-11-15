/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
// [region]{init_deque}
/* 初始化雙向佇列 */
// JavaScript 沒有內建的雙端佇列，只能把 Array 當作雙端佇列來使用
const deque = [];
// [endregion]{init_deque}

// [region]{push}
/* 元素入列 */
deque.push(2);
deque.push(5);
deque.push(4);
// 請注意，由於是陣列，unshift() 方法的時間複雜度為 O(n)
deque.unshift(3);
deque.unshift(1);
// [endregion]{push}
console.log('雙向佇列 deque = ', deque);

// [region]{peek_first}
/* 訪問元素 */
const peekFirst = deque[0];
// [endregion]{peek_first}
console.log('佇列首元素 peekFirst = ' + peekFirst);
// [region]{peek_last}
const peekLast = deque[deque.length - 1];
// [endregion]{peek_last}
console.log('佇列尾元素 peekLast = ' + peekLast);

// [region]{pop_first}
/* 元素出列 */
// 請注意，由於是陣列，shift() 方法的時間複雜度為 O(n)
const popFront = deque.shift();
// [endregion]{pop_first}
console.log(
    '佇列首出列元素 popFront = ' + popFront + '，佇列首出列後 deque = ' + deque
);
// [region]{pop_last}
const popBack = deque.pop();
// [endregion]{pop_last}
console.log(
    '佇列尾出列元素 popBack = ' + popBack + '，佇列尾出列後 deque = ' + deque
);

// [region]{size}
/* 獲取雙向佇列的長度 */
const size = deque.length;
// [endregion]{size}
console.log('雙向佇列長度 size = ' + size);

// [region]{is_empty}
/* 判斷雙向佇列是否為空 */
const isEmpty = size === 0;
// [endregion]{is_empty}
console.log('雙向佇列是否為空 = ' + isEmpty);
