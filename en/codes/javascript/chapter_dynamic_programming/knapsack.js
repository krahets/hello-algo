/**
 * File: knapsack.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 0-1 knapsack: Brute-force search */
function knapsackDFS(wgt, val, i, c) {
    // If all items have been selected or knapsack has no remaining capacity, return value 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // If exceeds knapsack capacity, can only choose not to put it in
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Return the larger value of the two options
    return Math.max(no, yes);
}

/* 0-1 knapsack: Memoization search */
function knapsackDFSMem(wgt, val, mem, i, c) {
    // If all items have been selected or knapsack has no remaining capacity, return value 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // If there's a record, return it directly
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // If exceeds knapsack capacity, can only choose not to put it in
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // Calculate the maximum value of not putting in and putting in item i
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // Record and return the larger value of the two options
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* 0-1 knapsack: Dynamic programming */
function knapsackDP(wgt, val, cap) {
    const n = wgt.length;
    // Initialize dp table
    const dp = Array(n + 1)
        .fill(0)
        .map(() => Array(cap + 1).fill(0));
    // State transition
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // If exceeds knapsack capacity, don't select item i
                dp[i][c] = dp[i - 1][c];
            } else {
                // The larger value between not selecting and selecting item i
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 knapsack: Space-optimized dynamic programming */
function knapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // Initialize dp table
    const dp = Array(cap + 1).fill(0);
    // State transition
    for (let i = 1; i <= n; i++) {
        // Traverse in reverse order
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // The larger value between not selecting and selecting item i
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* Driver Code */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// Brute-force search
let res = knapsackDFS(wgt, val, n, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

// Memoization search
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

// Dynamic programming
res = knapsackDP(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);

// Space-optimized dynamic programming
res = knapsackDPComp(wgt, val, cap);
console.log(`Maximum item value not exceeding knapsack capacity is ${res}`);
