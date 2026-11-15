/**
 * File: queue.ts
 * Created Time: 2022-12-05
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
// [region]{init_queue}
/* 初始化队列 */
// TypeScript 没有内置的队列，可以把 Array 当作队列来使用
const queue: number[] = [];
// [endregion]{init_queue}

// [region]{push}
/* 元素入队 */
queue.push(1);
queue.push(3);
queue.push(2);
queue.push(5);
queue.push(4);
// [endregion]{push}
console.log('队列 queue =', queue);

// [region]{peek}
/* 访问队首元素 */
const peek = queue[0];
// [endregion]{peek}
console.log('队首元素 peek =', peek);

// [region]{pop}
/* 元素出队 */
// 底层是数组，因此 shift() 方法的时间复杂度为 O(n)
const pop = queue.shift();
// [endregion]{pop}
console.log('出队元素 pop =', pop, '，出队后 queue = ', queue);

// [region]{size}
/* 获取队列的长度 */
const size = queue.length;
// [endregion]{size}
console.log('队列长度 size =', size);

// [region]{is_empty}
/* 判断队列是否为空 */
const isEmpty = queue.length === 0;
// [endregion]{is_empty}
console.log('队列是否为空 = ', isEmpty);

export {};
