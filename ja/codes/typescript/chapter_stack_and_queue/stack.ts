/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 実行用コード */
// [region]{init_stack}
/* スタックを初期化する */
// TypeScript には組み込みのスタッククラスがないため、Array をスタックとして使える
const stack: number[] = [];
// [endregion]{init_stack}

// [region]{push}
/* 要素をプッシュする */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
// [endregion]{push}
console.log('スタック stack =', stack);

// [region]{peek}
/* スタックの先頭要素にアクセスする */
const peek = stack[stack.length - 1];
// [endregion]{peek}
console.log('スタックの先頭要素 peek =', peek);

// [region]{pop}
/* 要素をポップする */
const pop = stack.pop();
// [endregion]{pop}
console.log('ポップした要素 pop =', pop);
console.log('ポップ後 stack =', stack);

// [region]{size}
/* スタックの長さを取得する */
const size = stack.length;
// [endregion]{size}
console.log('スタックの長さ size =', size);

// [region]{is_empty}
/* 空かどうかを判定する */
const isEmpty = stack.length === 0;
// [endregion]{is_empty}
console.log('スタックは空か =', isEmpty);

export {};
