/**
 * File: edit_distance.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Edit distance: Brute force search */
function editDistanceDFS(s, t, i, j) {
    // If both s and t are empty, return 0
    if (i === 0 && j === 0) return 0;

    // If s is empty, return the length of t
    if (i === 0) return j;

    // If t is empty, return the length of s
    if (j === 0) return i;

    // If the two characters are equal, skip these two characters
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Return the minimum number of edits
    return Math.min(insert, del, replace) + 1;
}

/* Edit distance: Memoized search */
function editDistanceDFSMem(s, t, mem, i, j) {
    // If both s and t are empty, return 0
    if (i === 0 && j === 0) return 0;

    // If s is empty, return the length of t
    if (i === 0) return j;

    // If t is empty, return the length of s
    if (j === 0) return i;

    // If there is a record, return it
    if (mem[i][j] !== -1) return mem[i][j];

    // If the two characters are equal, skip these two characters
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Record and return the minimum number of edits
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* Edit distance: Dynamic programming */
function editDistanceDP(s, t) {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
    // State transition: first row and first column
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // State transition: the rest of the rows and columns
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // If the two characters are equal, skip these two characters
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* Edit Distance: Space-optimized dynamic programming */
function editDistanceDPComp(s, t) {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // State transition: first row
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // State transition: the rest of the rows
    for (let i = 1; i <= n; i++) {
        // State transition: first column
        let leftup = dp[0]; // Temporarily store dp[i-1, j-1]
        dp[0] = i;
        // State transition: the rest of the columns
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // If the two characters are equal, skip these two characters
                dp[j] = leftup;
            } else {
                // The minimum number of edits = the minimum number of edits from three operations (insert, remove, replace) + 1
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // Update for the next round of dp[i-1, j-1]
        }
    }
    return dp[m];
}

const s = 'bag';
const t = 'pack';
const n = s.length,
    m = t.length;

// Brute force search
let res = editDistanceDFS(s, t, n, m);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);

// Memoized search
const mem = Array.from(new Array(n + 1), () => new Array(m + 1).fill(-1));
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);

// Dynamic programming
res = editDistanceDP(s, t);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);

// Space-optimized dynamic programming
res = editDistanceDPComp(s, t);
console.log(`将 ${s} 更改为 ${t} 最少需要编辑 ${res} 步`);
