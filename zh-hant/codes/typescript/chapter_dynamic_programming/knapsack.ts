/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 0-1 背包：暴力搜尋 */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // 若重量超過背包容量，就只能選擇不放入
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 分別計算不放入與放入物品 i 可取得的最大價值
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 回傳兩種選法中較大的價值
    return Math.max(no, yes);
}

/* 0-1 背包：記憶化搜尋 */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // 若已考慮所有物品，或背包沒有剩餘容量，就回傳價值 0
    if (i === 0 || c === 0) {
        return 0;
    }
    // 若已有紀錄，直接回傳該值
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // 若重量超過背包容量，就只能選擇不放入
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 分別計算不放入與放入物品 i 可取得的最大價值
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 記錄並回傳兩種選法中較大的價值
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* 0-1 背包：動態規劃 */
function knapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // 若重量超過背包容量，就不選物品 i
                dp[i][c] = dp[i - 1][c];
            } else {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 背包：空間最佳化後的動態規劃 */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // 初始化 dp 表
    const dp = Array(cap + 1).fill(0);
    // 狀態轉移
    for (let i = 1; i <= n; i++) {
        // 反向走訪
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 取不選與選取物品 i 兩種情況中的較大值
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 主程式 */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// 暴力搜尋
let res = knapsackDFS(wgt, val, n, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);

// 記憶化搜尋
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);

// 動態規劃
res = knapsackDP(wgt, val, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);

// 空間最佳化後的動態規劃
res = knapsackDPComp(wgt, val, cap);
console.log(`在背包容量限制內，物品的最大總價值為 ${res}`);

export {};
