/**
 * File: stack.ts
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
// [region]{init_stack}
/* 初始化堆疊 */
// TypeScript 沒有內建的堆疊類別，可以把 Array 當作堆疊來使用
const stack: number[] = [];
// [endregion]{init_stack}

// [region]{push}
/* 元素入堆疊 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
// [endregion]{push}
console.log('堆疊 stack =', stack);

// [region]{peek}
/* 訪問堆疊頂元素 */
const peek = stack[stack.length - 1];
// [endregion]{peek}
console.log('堆疊頂元素 peek =', peek);

// [region]{pop}
/* 元素出堆疊 */
const pop = stack.pop();
// [endregion]{pop}
console.log('出堆疊元素 pop =', pop);
console.log('出堆疊後 stack =', stack);

// [region]{size}
/* 獲取堆疊的長度 */
const size = stack.length;
// [endregion]{size}
console.log('堆疊的長度 size =', size);

// [region]{is_empty}
/* 判斷是否為空 */
const isEmpty = stack.length === 0;
// [endregion]{is_empty}
console.log('堆疊是否為空 =', isEmpty);

export {};
