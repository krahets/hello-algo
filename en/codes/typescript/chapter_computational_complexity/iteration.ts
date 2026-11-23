/**
 * File: iteration.ts
 * Created Time: 2023-08-28
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* for loop */
function forLoop(n: number): number {
    let res = 0;
    // Sum 1, 2, ..., n-1, n in a loop
    for (let i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while loop */
function whileLoop(n: number): number {
    let res = 0;
    let i = 1; // Initialize the loop control variable
    // Sum 1, 2, ..., n-1, n in a loop
    while (i <= n) {
        res += i;
        i++; // Update the loop control variable
    }
    return res;
}

/* while loop (two updates) */
function whileLoopII(n: number): number {
    let res = 0;
    let i = 1; // Initialize the loop control variable
    // Sum 1, 4, 10, ... in a loop
    while (i <= n) {
        res += i;
        // Update the loop control variable
        i++;
        i *= 2;
    }
    return res;
}

/* Nested for loops */
function nestedForLoop(n: number): string {
    let res = '';
    // Loop over i = 1, 2, ..., n-1, n
    for (let i = 1; i <= n; i++) {
        // Loop over j = 1, 2, ..., n-1, n
        for (let j = 1; j <= n; j++) {
            res += `(${i}, ${j}), `;
        }
    }
    return res;
}

/* Driver code */
const n = 5;
let res: number;

res = forLoop(n);
console.log(`Sum from the for loop: res = ${res}`);

res = whileLoop(n);
console.log(`Sum from the while loop: res = ${res}`);

res = whileLoopII(n);
console.log(`Sum from the while loop with two updates: res = ${res}`);

const resStr = nestedForLoop(n);
console.log(`Traversal result from the nested for loops: ${resStr}`);

export {};
