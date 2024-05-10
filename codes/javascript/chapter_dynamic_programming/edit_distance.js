/**
 * File: edit_distance.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* 编辑距离：暴力搜索 */
function editDistanceDFS(s, t, i, j) {
    // 若 s 和 t 都为空，则返回 0
    if (i === 0 && j === 0) return 0;

    // 若 s 为空，则返回 t 长度
    if (i === 0) return j;

    // 若 t 为空，则返回 s 长度
    if (j === 0) return i;

    // 若两字符相等，则直接跳过此两字符
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // 返回最少编辑步数
    return Math.min(insert, del, replace) + 1;
}

/* 编辑距离：记忆化搜索 */
function editDistanceDFSMem(s, t, mem, i, j) {
    // 若 s 和 t 都为空，则返回 0
    if (i === 0 && j === 0) return 0;

    // 若 s 为空，则返回 t 长度
    if (i === 0) return j;

    // 若 t 为空，则返回 s 长度
    if (j === 0) return i;

    // 若已有记录，则直接返回之
    if (mem[i][j] !== -1) return mem[i][j];

    // 若两字符相等，则直接跳过此两字符
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // 记录并返回最少编辑步数
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* 编辑距离：动态规划 */
function editDistanceDP(s, t) {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
    // 状态转移：首行首列
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // 状态转移：其余行和列
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // 若两字符相等，则直接跳过此两字符
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* 编辑距离：空间优化后的动态规划 */
function editDistanceDPComp(s, t) {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // 状态转移：首行
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // 状态转移：其余行
    for (let i = 1; i <= n; i++) {
        // 状态转移：首列
        let leftup = dp[0]; // 暂存 dp[i-1, j-1]
        dp[0] = i;
        // 状态转移：其余列
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // 若两字符相等，则直接跳过此两字符
                dp[j] = leftup;
            } else {
                // 最少编辑步数 = 插入、删除、替换这三种操作的最少编辑步数 + 1
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // 更新为下一轮的 dp[i-1, j-1]
        }
    }
    return dp[m];
}

const s = 'bag';
const t = 'pack';
const n = s.length,
    m = t.length;

// 暴力搜索
let res = editDistanceDFS(s, t, n, m);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);

// 记忆化搜索
const mem = Array.from(new Array(n + 1), () => new Array(m + 1).fill(-1));
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);

// 动态规划
res = editDistanceDP(s, t);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);

// 空间优化后的动态规划
res = editDistanceDPComp(s, t);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);
