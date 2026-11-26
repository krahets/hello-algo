/**
 * File: edit_distance.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 編輯距離：暴力搜尋 */
function editDistanceDFS(s: string, t: string, i: number, j: number): number {
    // 若 s 和 t 皆為空字串，回傳 0
    if (i === 0 && j === 0) return 0;

    // 若 s 為空字串，回傳 t 的長度
    if (i === 0) return j;

    // 若 t 為空字串，回傳 s 的長度
    if (j === 0) return i;

    // 若兩個字元相同，直接跳過這兩個字元
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 回傳最少編輯步數
    return Math.min(insert, del, replace) + 1;
}

/* 編輯距離：記憶化搜尋 */
function editDistanceDFSMem(
    s: string,
    t: string,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // 若 s 和 t 皆為空字串，回傳 0
    if (i === 0 && j === 0) return 0;

    // 若 s 為空字串，回傳 t 的長度
    if (i === 0) return j;

    // 若 t 為空字串，回傳 s 的長度
    if (j === 0) return i;

    // 若已有紀錄，直接回傳該值
    if (mem[i][j] !== -1) return mem[i][j];

    // 若兩個字元相同，直接跳過這兩個字元
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // 記錄並回傳最少編輯步數
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* 編輯距離：動態規劃 */
function editDistanceDP(s: string, t: string): number {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: m + 1 }, () => 0)
    );
    // 狀態轉移：第一列和第一欄
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // 狀態轉移：其餘各列與各欄
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // 若兩個字元相同，直接跳過這兩個字元
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* 編輯距離：空間最佳化後的動態規劃 */
function editDistanceDPComp(s: string, t: string): number {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // 狀態轉移：第一列
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // 狀態轉移：其餘各列
    for (let i = 1; i <= n; i++) {
        // 狀態轉移：第一欄
        let leftup = dp[0]; // 暫存 dp[i-1, j-1]
        dp[0] = i;
        // 狀態轉移：其餘各欄
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // 若兩個字元相同，直接跳過這兩個字元
                dp[j] = leftup;
            } else {
                // 最少編輯步數 = 插入、刪除、取代三種操作對應的最少步數中的最小值 + 1
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
        }
    }
    return dp[m];
}

/* 主程式 */
const s = 'bag';
const t = 'pack';
const n = s.length,
    m = t.length;

// 暴力搜尋
let res = editDistanceDFS(s, t, n, m);
console.log(`將 ${s} 改成 ${t} 至少需要編輯 ${res} 步`);

// 記憶化搜尋
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: m + 1 }, () => -1)
);
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`將 ${s} 改成 ${t} 至少需要編輯 ${res} 步`);

// 動態規劃
res = editDistanceDP(s, t);
console.log(`將 ${s} 改成 ${t} 至少需要編輯 ${res} 步`);

// 空間最佳化後的動態規劃
res = editDistanceDPComp(s, t);
console.log(`將 ${s} 改成 ${t} 至少需要編輯 ${res} 步`);

export {};
