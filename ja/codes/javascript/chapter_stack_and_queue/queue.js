/**
 * File: queue.js
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 実行用コード */
// [region]{init_queue}
/* キューを初期化する */
// JavaScript には組み込みのキューがないため、Array をキューとして使える
const queue = [];
// [endregion]{init_queue}

// [region]{push}
/* 要素をエンキューする */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
// [endregion]{push}
console.log('キュー queue =', queue);

// [region]{peek}
/* キューの先頭要素にアクセス */
const peek = queue[0];
// [endregion]{peek}
console.log('キューの先頭要素 peek =', peek);

// [region]{pop}
/* 要素をデキューする */
// 内部は配列なので、shift() メソッドの時間計算量は O(n)
const pop = queue.shift();
// [endregion]{pop}
console.log('デキューした要素 pop =', pop, '、デキュー後 queue = ', queue);

// [region]{size}
/* キューの長さを取得 */
const size = queue.length;
// [endregion]{size}
console.log('キューの長さ size =', size);

// [region]{is_empty}
/* キューが空か判定 */
const isEmpty = queue.length === 0;
// [endregion]{is_empty}
console.log('キューは空か = ', isEmpty);
