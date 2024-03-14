/**
 * File: iteration.js
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for 循环 */
function forLoop(n) {
    let res = 0;
    // 循环求和 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 循环 */
function whileLoop(n) {
    let res = 0;
    let i = 1; // 初始化条件变量
    // 循环求和 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // 更新条件变量
    }
    return res;
}

/* while 循环（两次更新） */
function whileLoopII(n) {
    let res = 0;
    let i = 1; // 初始化条件变量
    // 循环求和 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // 更新条件变量
        i++;
        i *= 2;
    }
    return res;
}

/* 双层 for 循环 */
function nestedForLoop(n) {
    let res = '';
    // 循环 i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // 循环 j = 1, 2, ..., n-1, n
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* Driver Code */
const n = 5;
let res;

res = forLoop(n);
console.log(`for 循环的求和结果 res = ${res}`);

res = whileLoop(n);
console.log(`while 循环的求和结果 res = ${res}`);

res = whileLoopII(n);
console.log(`while 循环（两次更新）求和结果 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`双层 for 循环的遍历结果 ${resStr}`);
