/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 実行用コード */
/* キューを初期化する */
// JavaScript には組み込みのキューがないため、Array をキューとして使える
const queue = [];

/* 要素をエンキューする */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue =', queue);

/* キューの先頭要素にアクセス */
const peek = queue[0];
console.log('キューの先頭要素 peek =', peek);

/* 要素をデキューする */
// 内部は配列なので、shift() メソッドの時間計算量は O(n)
const pop = queue.shift();
console.log('デキューした要素 pop =', pop, '、デキュー後 queue = ', queue);

/* キューの長さを取得 */
const size = queue.length;
console.log('キューの長さ size =', size);

/* キューが空か判定 */
const isEmpty = queue.length === 0;
console.log('キューは空か = ', isEmpty);
