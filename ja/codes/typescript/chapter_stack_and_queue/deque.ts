/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 実行用コード */
/* 両端キューを初期化する */
// TypeScript には組み込みの両端キューがないため、Array を両端キューとして使うしかない
const deque: number[] = [];

/* 要素をエンキューする */
deque.push(2);
deque.push(5);
deque.push(4);
// 配列なので unshift() メソッドの時間計算量は O(n) であることに注意
deque.unshift(3);
deque.unshift(1);
console.log('両端キュー deque = ', deque);

/* 要素にアクセスする */
const peekFirst: number = deque[0];
console.log('キューの先頭要素 peekFirst = ' + peekFirst);
const peekLast: number = deque[deque.length - 1];
console.log('キューの末尾要素 peekLast = ' + peekLast);

/* 要素をデキューする */
// 配列なので shift() メソッドの時間計算量は O(n) であることに注意
const popFront: number = deque.shift() as number;
console.log(
    '先頭からデキューした要素 popFront = ' + popFront + '、先頭からデキューした後 deque = ' + deque
);
const popBack: number = deque.pop() as number;
console.log(
    '末尾からデキューした要素 popBack = ' + popBack + '、末尾からデキューした後 deque = ' + deque
);

/* 両端キューの長さを取得する */
const size: number = deque.length;
console.log('両端キューの長さ size = ' + size);

/* 両端キューが空かどうかを判定する */
const isEmpty: boolean = size === 0;
console.log('両端キューは空か = ' + isEmpty);

export {};
