/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* 初始化堆疊 */
// TypeScript 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
const stack: number[] = [];

/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('堆疊 stack =', stack);

/* 訪問堆疊頂元素 */
const peek = stack[stack.length - 1];
console.log('堆疊頂元素 peek =', peek);

/* 元素出堆疊 */
const pop = stack.pop();
console.log('出堆疊元素 pop =', pop);
console.log('出堆疊後 stack =', stack);

/* 獲取堆疊的長度 */
const size = stack.length;
console.log('堆疊的長度 size =', size);

/* 判斷是否為空 */
const isEmpty = stack.length === 0;
console.log('堆疊是否為空 =', isEmpty);

export {};
