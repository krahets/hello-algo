/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 実行例 */
/* キューを初期化する */
// JavaScript には組み込みのキューがないので、Array をキューとして使える
const queue = [];

/* 要素をキューに追加する */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
console.log('キュー queue =', queue);

/* キューの先頭要素を参照する */
const peek = queue[0];
console.log('先頭要素 peek =', peek);

/* キューから要素を取り出す */
// 内部では配列を使うため、shift() の時間計算量は O(n) になる
const pop = queue.shift();
console.log('デキューした要素 pop =', pop, '、デキュー後の queue = ', queue);

/* キューの要素数を取得する */
const size = queue.length;
console.log('キューの要素数 size =', size);

/* キューが空かどうかを判定する */
const isEmpty = queue.length === 0;
console.log('キューは空か = ', isEmpty);
