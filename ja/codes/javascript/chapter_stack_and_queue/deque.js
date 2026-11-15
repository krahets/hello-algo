/**
 * File: deque.js
 * Created Time: 2023-01-17
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

/* 実行用コード */
// [region]{init_deque}
/* 両端キューを初期化する */
// JavaScript には組み込みの両端キューがないため、Array を両端キューとして使うしかない
const deque = [];
// [endregion]{init_deque}

// [region]{push}
/* 要素をエンキューする */
deque.push(2);
deque.push(5);
deque.push(4);
// 配列なので unshift() メソッドの時間計算量は O(n) であることに注意
deque.unshift(3);
deque.unshift(1);
// [endregion]{push}
console.log('両端キュー deque = ', deque);

// [region]{peek_first}
/* 要素にアクセスする */
const peekFirst = deque[0];
// [endregion]{peek_first}
console.log('キューの先頭要素 peekFirst = ' + peekFirst);
// [region]{peek_last}
const peekLast = deque[deque.length - 1];
// [endregion]{peek_last}
console.log('キューの末尾要素 peekLast = ' + peekLast);

// [region]{pop_first}
/* 要素をデキューする */
// 配列なので shift() メソッドの時間計算量は O(n) であることに注意
const popFront = deque.shift();
// [endregion]{pop_first}
console.log(
    '先頭からデキューした要素 popFront = ' + popFront + '、先頭からデキューした後 deque = ' + deque
);
// [region]{pop_last}
const popBack = deque.pop();
// [endregion]{pop_last}
console.log(
    '末尾からデキューした要素 popBack = ' + popBack + '、末尾からデキューした後 deque = ' + deque
);

// [region]{size}
/* 両端キューの長さを取得する */
const size = deque.length;
// [endregion]{size}
console.log('両端キューの長さ size = ' + size);

// [region]{is_empty}
/* 両端キューが空かどうかを判定する */
const isEmpty = size === 0;
// [endregion]{is_empty}
console.log('両端キューは空か = ' + isEmpty);
