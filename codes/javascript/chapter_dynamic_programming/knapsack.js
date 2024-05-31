/**
 * File: knapsack.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 0-1 背包：暴力搜索 */
function knapsackDFS(wgt, val, i, c) {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // 若超过背包容量，则只能选择不放入背包
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 计算不放入和放入物品 i 的最大价值
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 返回两种方案中价值更大的那一个
    return Math.max(no, yes);
}

/* 0-1 背包：记忆化搜索 */
function knapsackDFSMem(wgt, val, mem, i, c) {
    // 若已选完所有物品或背包无剩余容量，则返回价值 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // 若已有记录，则直接返回
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // 若超过背包容量，则只能选择不放入背包
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 计算不放入和放入物品 i 的最大价值
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 记录并返回两种方案中价值更大的那一个
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* 0-1 背包：动态规划 */
function knapsackDP(wgt, val, cap) {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array(n + 1)
        .fill(0)
        .map(() => Array(cap + 1).fill(0));
    // 状态转移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若超过背包容量，则不选物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 不选和选物品 i 这两种方案的较大值
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 背包：空间优化后的动态规划 */
function knapsackDPComp(wgt, val, cap) {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array(cap + 1).fill(0);
    // 状态转移
    for (let i = 1; i <= n; i++) {
        // 倒序遍历
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 不选和选物品 i 这两种方案的较大值
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

// 暴力搜索
let res = knapsackDFS(wgt, val, n, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);

// 记忆化搜索
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);

// 动态规划
res = knapsackDP(wgt, val, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);

// 空间优化后的动态规划
res = knapsackDPComp(wgt, val, cap);
console.log(`不超过背包容量的最大物品价值为 ${res}`);
