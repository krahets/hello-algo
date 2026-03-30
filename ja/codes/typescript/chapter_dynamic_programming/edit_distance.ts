/**
 * File: edit_distance.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 編集距離：総当たり探索 */
function editDistanceDFS(s: string, t: string, i: number, j: number): number {
    // s と t がともに空なら 0 を返す
    if (i === 0 && j === 0) return 0;

    // s が空なら t の長さを返す
    if (i === 0) return j;

    // t が空なら s の長さを返す
    if (j === 0) return i;

    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 最小編集回数を返す
    return Math.min(insert, del, replace) + 1;
}

/* 編集距離：メモ化探索 */
function editDistanceDFSMem(
    s: string,
    t: string,
    mem: Array<Array<number>>,
    i: number,
    j: number
): number {
    // s と t がともに空なら 0 を返す
    if (i === 0 && j === 0) return 0;

    // s が空なら t の長さを返す
    if (i === 0) return j;

    // t が空なら s の長さを返す
    if (j === 0) return i;

    // 記録済みなら、それをそのまま返す
    if (mem[i][j] !== -1) return mem[i][j];

    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // 最小編集回数を記録して返す
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* 編集距離：動的計画法 */
function editDistanceDP(s: string, t: string): number {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () =>
        Array.from({ length: m + 1 }, () => 0)
    );
    // 状態遷移：先頭行と先頭列
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // 状態遷移: 残りの行と列
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* 編集距離：空間最適化した動的計画法 */
function editDistanceDPComp(s: string, t: string): number {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // 状態遷移：先頭行
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // 状態遷移：残りの行
    for (let i = 1; i <= n; i++) {
        // 状態遷移：先頭列
        let leftup = dp[0]; // dp[i-1, j-1] を一時保存する
        dp[0] = i;
        // 状態遷移：残りの列
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[j] = leftup;
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // 次の反復の dp[i-1, j-1] に更新する
        }
    }
    return dp[m];
}

/* Driver Code */
const s = 'bag';
const t = 'pack';
const n = s.length,
    m = t.length;

// 全探索
let res = editDistanceDFS(s, t, n, m);
console.log(`${s} を ${t} に変更するには最小で ${res} 回の編集が必要`);

// メモ化探索
const mem = Array.from({ length: n + 1 }, () =>
    Array.from({ length: m + 1 }, () => -1)
);
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`${s} を ${t} に変更するには最小で ${res} 回の編集が必要`);

// 動的計画法
res = editDistanceDP(s, t);
console.log(`${s} を ${t} に変更するには最小で ${res} 回の編集が必要`);

// 空間最適化後の動的計画法
res = editDistanceDPComp(s, t);
console.log(`${s} を ${t} に変更するには最小で ${res} 回の編集が必要`);

export {};
