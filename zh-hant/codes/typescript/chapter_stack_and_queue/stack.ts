/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* 範例程式 */
/* 初始化堆疊 */
// TypeScript 沒有內建堆疊類別，可以用 Array 當作堆疊
const stack: number[] = [];

/* 將元素推入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('堆疊 stack =', stack);

/* 讀取堆疊頂端的元素 */
const peek = stack[stack.length - 1];
console.log('堆疊頂端元素 peek =', peek);

/* 從堆疊彈出元素 */
const pop = stack.pop();
console.log('彈出的元素 pop =', pop);
console.log('彈出後 stack =', stack);

/* 取得堆疊長度 */
const size = stack.length;
console.log('堆疊長度 size =', size);

/* 判斷堆疊是否為空 */
const isEmpty = stack.length === 0;
console.log('堆疊是否為空 =', isEmpty);

export {};
