/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 実行用コード */
/* スタックを初期化する */
// TypeScript には組み込みのスタッククラスがないため、Array をスタックとして使える
const stack: number[] = [];

/* 要素をプッシュする */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('スタック stack =', stack);

/* スタックの先頭要素にアクセスする */
const peek = stack[stack.length - 1];
console.log('スタックの先頭要素 peek =', peek);

/* 要素をポップする */
const pop = stack.pop();
console.log('ポップした要素 pop =', pop);
console.log('ポップ後 stack =', stack);

/* スタックの長さを取得する */
const size = stack.length;
console.log('スタックの長さ size =', size);

/* 空かどうかを判定する */
const isEmpty = stack.length === 0;
console.log('スタックは空か =', isEmpty);

export {};
