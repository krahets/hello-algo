/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 0-1 knapsack: brute-force search */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // If all items have been considered or no capacity remains, return value 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Return the larger value from the two choices
    return Math.max(no, yes);
}

/* 0-1 knapsack: memoized search */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // If all items have been considered or no capacity remains, return value 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // If a result has already been recorded, return it directly
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // If the item exceeds the remaining capacity, it must be excluded
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Calculate the maximum values obtained by excluding and including item i
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Record and return the larger value from the two choices
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* 0-1 knapsack: dynamic programming */
function knapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Initialize the dp table
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // State transitions
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If item i exceeds the remaining capacity, do not choose it
                dp[i][c] = dp[i - 1][c];
            } else {
                // Take the larger value obtained by excluding and including item i
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 knapsack: space-optimized dynamic programming */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Initialize the dp table
    const dp = Array(cap + 1).fill(0);
    // State transitions
    for (let i = 1; i <= n; i++) {
        // Traverse in decreasing order
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Take the larger value obtained by excluding and including item i
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver code */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Brute-force search
let res = knapsackDFS(wgt, val, n, cap);
console.log(`Maximum total item value within the knapsack capacity: ${res}`);

// Memoized search
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`Maximum total item value within the knapsack capacity: ${res}`);

// Dynamic programming
res = knapsackDP(wgt, val, cap);
console.log(`Maximum total item value within the knapsack capacity: ${res}`);

// Space-optimized dynamic programming
res = knapsackDPComp(wgt, val, cap);
console.log(`Maximum total item value within the knapsack capacity: ${res}`);

export {};
