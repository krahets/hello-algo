/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* Driver Code */
/* 両端キューを初期化 */
// JavaScript には組み込みの両端キューがないため、Array を両端キューとして使う
const deque = [];

/* 要素をエンキュー */
deque.push(2);
deque.push(5);
deque.push(4);
// 注意: 配列であるため、unshift() メソッドの時間計算量は O(n)
deque.unshift(3);
deque.unshift(1);
console.log('両端キュー deque = ', deque);

/* 要素にアクセス */
const peekFirst = deque[0];
console.log('先頭要素 peekFirst = ' + peekFirst);
const peekLast = deque[deque.length - 1];
console.log('末尾要素 peekLast = ' + peekLast);

/* 要素をデキュー */
// 注意: 配列であるため、shift() メソッドの時間計算量は O(n)
const popFront = deque.shift();
console.log(
    '先頭からデキューした要素 popFront = ' + popFront + '，先頭からデキュー後 deque = ' + deque
);
const popBack = deque.pop();
console.log(
    '末尾からデキューした要素 popBack = ' + popBack + '，末尾からデキュー後 deque = ' + deque
);

/* 両端キューの長さを取得 */
const size = deque.length;
console.log('両端キューの長さ size = ' + size);

/* 両端キューが空かどうかを判定 */
const isEmpty = size === 0;
console.log('両端キューが空かどうか = ' + isEmpty);
