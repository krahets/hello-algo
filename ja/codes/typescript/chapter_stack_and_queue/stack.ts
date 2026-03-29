/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* スタックを初期化 */
// TypeScript には組み込みのスタッククラスがないため、Array をスタックとして使う
const stack: number[] = [];

/* 要素をプッシュ */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('スタック stack =', stack);

/* スタックトップの要素にアクセス */
const peek = stack[stack.length - 1];
console.log('スタックトップ要素 peek =', peek);

/* 要素をポップ */
const pop = stack.pop();
console.log('ポップした要素 pop =', pop);
console.log('ポップ後の stack =', stack);

/* スタックの長さを取得 */
const size = stack.length;
console.log('スタックの長さ size =', size);

/* 空かどうかを判定 */
const isEmpty = stack.length === 0;
console.log('スタックが空かどうか =', isEmpty);

export {};
