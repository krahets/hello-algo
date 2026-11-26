/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 0-1 knapsack with brute-force search */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // Return a value of 0 if all items have been considered or no capacity remains
    if (i === 0 || c === 0) {
        return 0;
    }
    // If the item exceeds the remaining capacity, we can only skip it
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Compute the maximum values for skipping and taking item i
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Return the larger of the two values
    return Math.max(no, yes);
}

/* 0-1 knapsack with memoized search */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // Return a value of 0 if all items have been considered or no capacity remains
    if (i === 0 || c === 0) {
        return 0;
    }
    // Return the cached result if available
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // If the item exceeds the remaining capacity, we can only skip it
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Compute the maximum values for skipping and taking item i
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Cache and return the larger of the two values
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* 0-1 knapsack with dynamic programming */
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
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // Skip item i if its weight exceeds the capacity
                dp[i][c] = dp[i - 1][c];
            } else {
                // Take the larger value from skipping or taking item i
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 knapsack with space-optimized dynamic programming */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // Initialize the dp table
    const dp = Array(cap + 1).fill(0);
    // State transition
    for (let i = 1; i <= n; i++) {
        // Iterate in descending order
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // Take the larger value from skipping or taking item i
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
console.log(`Maximum total item value within the weight limit: ${res}`);

// Memoized search
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`Maximum total item value within the weight limit: ${res}`);

// Dynamic programming
res = knapsackDP(wgt, val, cap);
console.log(`Maximum total item value within the weight limit: ${res}`);

// Space-optimized dynamic programming
res = knapsackDPComp(wgt, val, cap);
console.log(`Maximum total item value within the weight limit: ${res}`);

export {};
