/**
 * File: deque.ts
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 実行例 */
/* 両端キューを初期化する */
// TypeScript には組み込みの両端キューがなく、Array で代用するしかない
const deque: number[] = [];

/* 要素を両端キューに追加する */
deque.push(2);
deque.push(5);
deque.push(4);
// 配列を使うため、unshift() の時間計算量は O(n) になる点に注意
deque.unshift(3);
deque.unshift(1);
console.log('両端キュー deque = ', deque);

/* 要素を参照する */
const peekFirst: number = deque[0];
console.log('先頭要素 peekFirst = ' + peekFirst);
const peekLast: number = deque[deque.length - 1];
console.log('末尾要素 peekLast = ' + peekLast);

/* 両端キューから要素を取り出す */
// 配列を使うため、shift() の時間計算量は O(n) になる点に注意
const popFront: number = deque.shift() as number;
console.log(
    '先頭から取り出した要素 popFront = ' + popFront + '、先頭から取り出した後の deque = ' + deque
);
const popBack: number = deque.pop() as number;
console.log(
    '末尾から取り出した要素 popBack = ' + popBack + '、末尾から取り出した後の deque = ' + deque
);

/* 両端キューの要素数を取得する */
const size: number = deque.length;
console.log('両端キューの要素数 size = ' + size);

/* 両端キューが空かどうかを判定する */
const isEmpty: boolean = size === 0;
console.log('両端キューは空か = ' + isEmpty);

export {};
