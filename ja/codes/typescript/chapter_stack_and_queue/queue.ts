/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* キューを初期化 */
// TypeScript には組み込みのキューがないため、Array をキューとして使う
const queue: number[] = [];

/* 要素をエンキュー */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue =', queue);

/* キュー先頭の要素にアクセス */
const peek = queue[0];
console.log('先頭要素 peek =', peek);

/* 要素をデキュー */
// 基盤が配列であるため、shift() メソッドの時間計算量は O(n)
const pop = queue.shift();
console.log('デキューした要素 pop =', pop, '，デキュー後の queue = ', queue);

/* キューの長さを取得 */
const size = queue.length;
console.log('キューの長さ size =', size);

/* キューが空かどうかを判定 */
const isEmpty = queue.length === 0;
console.log('キューが空かどうか = ', isEmpty);

export {};
