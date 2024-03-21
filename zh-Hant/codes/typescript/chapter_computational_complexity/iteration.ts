/**
 * File: iteration.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for 迴圈 */
function forLoop(n: number): number {
    let res = 0;
    // 迴圈求和 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 迴圈 */
function whileLoop(n: number): number {
    let res = 0;
    let i = 1; // 初始化條件變數
    // 迴圈求和 1, 2, ..., n-1, n
    while (i <= n) {
        res += i;
        i++; // 更新條件變數
    }
    return res;
}

/* while 迴圈（兩次更新） */
function whileLoopII(n: number): number {
    let res = 0;
    let i = 1; // 初始化條件變數
    // 迴圈求和 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // 更新條件變數
        i++;
        i *= 2;
    }
    return res;
}

/* 雙層 for 迴圈 */
function nestedForLoop(n: number): string {
    let res = '';
    // 迴圈 i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // 迴圈 j = 1, 2, ..., n-1, n
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
console.log(`for 迴圈的求和結果 res = ${res}`);

res = whileLoop(n);
console.log(`while 迴圈的求和結果 res = ${res}`);

res = whileLoopII(n);
console.log(`while 迴圈（兩次更新）求和結果 res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`雙層 for 迴圈的走訪結果 ${resStr}`);

export {};
