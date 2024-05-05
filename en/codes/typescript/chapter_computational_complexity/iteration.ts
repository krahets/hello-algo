/**
 * File: iteration.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for loop */
function forLoop(n: number): number {
    let res = 0;
    // Loop sum 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while loop */
function whileLoop(n: number): number {
    let res = 0;
    let i = 1; // Initialize condition variable
    // Loop sum 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // Update condition variable
    }
    return res;
}

/* while loop (two updates) */
function whileLoopII(n: number): number {
    let res = 0;
    let i = 1; // Initialize condition variable
    // Loop sum 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Update condition variable
        i++;
        i *= 2;
    }
    return res;
}

/* Double for loop */
function nestedForLoop(n: number): string {
    let res = '';
    // Loop i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // Loop j = 1, 2, ..., n-1, n
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* Driver Code */
const n = 5;
let res: number;

res = forLoop(n);
console.log(`for 循环的求和结果 res = ${res}`);

res = whileLoop(n);
console.log(`while 循环的求和结果 res = ${res}`);

res = whileLoopII(n);
console.log(`while 循环（两次更新）求和结果 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`双层 for 循环的遍历结果 ${resStr}`);

export {};
