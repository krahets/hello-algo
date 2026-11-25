/**
 * File: stack.js
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 実行例 */
/* スタックを初期化する */
// JavaScript には組み込みのスタッククラスがないので、Array をスタックとして使える
const stack = [];

/* 要素をプッシュする */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('スタック stack =', stack);

/* スタックのトップを参照する */
const peek = stack[stack.length - 1];
console.log('スタックのトップの要素 peek =', peek);

/* 要素をポップする */
const pop = stack.pop();
console.log('ポップした要素 pop =', pop);
console.log('ポップ後の stack =', stack);

/* スタックの要素数を取得する */
const size = stack.length;
console.log('スタックの要素数 size =', size);

/* 空かどうかを判定する */
const isEmpty = stack.length === 0;
console.log('スタックは空か =', isEmpty);
