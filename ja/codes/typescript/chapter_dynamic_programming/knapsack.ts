/**
 * File: knapsack.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 0-1 ナップサック問題：全探索 */
function knapsackDFS(
    wgt: Array<number>,
    val: Array<number>,
    i: number,
    c: number
): number {
    // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
    if (i === 0 || c === 0) {
        return 0;
    }
    // ナップサックの容量を超える場合、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFS(wgt, val, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    const no = knapsackDFS(wgt, val, i - 1, c);
    const yes = knapsackDFS(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 2 通りの選択のうち、価値が大きいほうを返す
    return Math.max(no, yes);
}

/* 0-1 ナップサック問題：メモ化探索 */
function knapsackDFSMem(
    wgt: Array<number>,
    val: Array<number>,
    mem: Array<Array<number>>,
    i: number,
    c: number
): number {
    // すべての品物を選び終えたか、ナップサックの残り容量がなければ、価値 0 を返す
    if (i === 0 || c === 0) {
        return 0;
    }
    // 記録済みなら、その値をそのまま返す
    if (mem[i][c] !== -1) {
        return mem[i][c];
    }
    // ナップサックの容量を超える場合、入れない選択しかできない
    if (wgt[i - 1] > c) {
        return knapsackDFSMem(wgt, val, mem, i - 1, c);
    }
    // 品物 i を入れない場合と入れる場合の最大価値を計算する
    const no = knapsackDFSMem(wgt, val, mem, i - 1, c);
    const yes =
        knapsackDFSMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
    // 2 通りの選択のうち、価値が大きいほうを記録して返す
    mem[i][c] = Math.max(no, yes);
    return mem[i][c];
}

/* 0-1 ナップサック問題：動的計画法 */
function knapsackDP(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // dp テーブルを初期化する
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: cap + 1 }, () => 0)
    );
    // 状態遷移
    for (let i = 1; i <= n; i++) {
        for (let c = 1; c <= cap; c++) {
            if (wgt[i - 1] > c) {
                // ナップサックの容量を超える場合、品物 i を選ばない
                dp[i][c] = dp[i - 1][c];
            } else {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[i][c] = Math.max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1]] + val[i - 1]
                );
            }
        }
    }
    return dp[n][cap];
}

/* 0-1 ナップサック問題：空間を最適化した動的計画法 */
function knapsackDPComp(
    wgt: Array<number>,
    val: Array<number>,
    cap: number
): number {
    const n = wgt.length;
    // dp テーブルを初期化する
    const dp = Array(cap + 1).fill(0);
    // 状態遷移
    for (let i = 1; i <= n; i++) {
        // 逆順に走査する
        for (let c = cap; c >= 1; c--) {
            if (wgt[i - 1] <= c) {
                // 品物 i を選ばない場合と選ぶ場合の大きいほうの値
                dp[c] = Math.max(dp[c], dp[c - wgt[i - 1]] + val[i - 1]);
            }
        }
    }
    return dp[cap];
}

/* 実行用コード */
const wgt = [10, 20, 30, 40, 50];
const val = [50, 120, 150, 210, 240];
const cap = 50;
const n = wgt.length;

// 全探索
let res = knapsackDFS(wgt, val, n, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);

// メモ化探索
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: cap + 1 }, () => -1)
);
res = knapsackDFSMem(wgt, val, mem, n, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);

// 動的計画法
res = knapsackDP(wgt, val, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);

// 空間を最適化した動的計画法
res = knapsackDPComp(wgt, val, cap);
console.log(`ナップサックの容量を超えない品物の最大価値は ${res}`);

export {};
