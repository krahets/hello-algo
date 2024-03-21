/**
 * File: stack.js
 * Created Time: 2022-12-04
 * Author: S-N-O-R-L-A-X (snorlax.xu@outlook.com)
 */

/* Driver Code */
/* 初始化栈 */
// JavaScript 没有内置的栈类，可以把 Array 当作栈来使用
const stack = [];

/* 元素入栈 */
stack.push(1);
stack.push(3);
stack.push(2);
stack.push(5);
stack.push(4);
console.log('栈 stack =', stack);

/* 访问栈顶元素 */
const peek = stack[stack.length - 1];
console.log('栈顶元素 peek =', peek);

/* 元素出栈 */
const pop = stack.pop();
console.log('出栈元素 pop =', pop);
console.log('出栈后 stack =', stack);

/* 获取栈的长度 */
const size = stack.length;
console.log('栈的长度 size =', size);

/* 判断是否为空 */
const isEmpty = stack.length === 0;
console.log('栈是否为空 =', isEmpty);
