/**
 * File: iteration.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for loop */
function forLoop(n: number): number {
    let res = 0;
    // Sum 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while loop */
function whileLoop(n: number): number {
    let res = 0;
    let i = 1; // Initialize condition variable
    // Sum 1, 2, ..., n-1, n
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
    // Sum 1, 4, 10, ...
    while (i <= n) {
        res += i;
        // Update condition variable
        i++;
        i *= 2;
    }
    return res;
}

/* Nested for loop */
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
console.log(`For loop sum result res = ${res}`);

res = whileLoop(n);
console.log(`While loop sum result res = ${res}`);

res = whileLoopII(n);
console.log(`While loop (two updates) sum result res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`Nested for loop traversal result ${resStr}`);

export {};
