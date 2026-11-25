/**
 * File: edit_distance.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Edit distance with brute-force search */
function editDistanceDFS(s, t, i, j) {
    // Return 0 if both s and t are empty
    if (i === 0 && j === 0) return 0;

    // Return the length of t if s is empty
    if (i === 0) return j;

    // Return the length of s if t is empty
    if (j === 0) return i;

    // Skip both characters if they match
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFS(s, t, i - 1, j - 1);

    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    const insert = editDistanceDFS(s, t, i, j - 1);
    const del = editDistanceDFS(s, t, i - 1, j);
    const replace = editDistanceDFS(s, t, i - 1, j - 1);
    // Return the minimum number of edits
    return Math.min(insert, del, replace) + 1;
}

/* Edit distance with memoized search */
function editDistanceDFSMem(s, t, mem, i, j) {
    // Return 0 if both s and t are empty
    if (i === 0 && j === 0) return 0;

    // Return the length of t if s is empty
    if (i === 0) return j;

    // Return the length of s if t is empty
    if (j === 0) return i;

    // Return the cached result if available
    if (mem[i][j] !== -1) return mem[i][j];

    // Skip both characters if they match
    if (s.charAt(i - 1) === t.charAt(j - 1))
        return editDistanceDFSMem(s, t, mem, i - 1, j - 1);

    // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
    const insert = editDistanceDFSMem(s, t, mem, i, j - 1);
    const del = editDistanceDFSMem(s, t, mem, i - 1, j);
    const replace = editDistanceDFSMem(s, t, mem, i - 1, j - 1);
    // Cache and return the minimum number of edits
    mem[i][j] = Math.min(insert, del, replace) + 1;
    return mem[i][j];
}

/* Edit distance with dynamic programming */
function editDistanceDP(s, t) {
    const n = s.length,
        m = t.length;
    const dp = Array.from({ length: n + 1 }, () => new Array(m + 1).fill(0));
    // State transitions for the first row and column
    for (let i = 1; i <= n; i++) {
        dp[i][0] = i;
    }
    for (let j = 1; j <= m; j++) {
        dp[0][j] = j;
    }
    // State transitions for the remaining rows and columns
    for (let i = 1; i <= n; i++) {
        for (let j = 1; j <= m; j++) {
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Skip both characters if they match
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[i][j] =
                    Math.min(dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]) + 1;
            }
        }
    }
    return dp[n][m];
}

/* Edit distance with space-optimized dynamic programming */
function editDistanceDPComp(s, t) {
    const n = s.length,
        m = t.length;
    const dp = new Array(m + 1).fill(0);
    // State transitions for the first row
    for (let j = 1; j <= m; j++) {
        dp[j] = j;
    }
    // State transitions for the remaining rows
    for (let i = 1; i <= n; i++) {
        // State transitions for the first column
        let leftup = dp[0]; // Save dp[i-1, j-1] temporarily
        dp[0] = i;
        // State transitions for the remaining columns
        for (let j = 1; j <= m; j++) {
            const temp = dp[j];
            if (s.charAt(i - 1) === t.charAt(j - 1)) {
                // Skip both characters if they match
                dp[j] = leftup;
            } else {
                // Minimum edits = 1 + the smallest remaining edit count after an insertion, deletion, or replacement
                dp[j] = Math.min(dp[j - 1], dp[j], leftup) + 1;
            }
            leftup = temp; // Update the saved value to hold dp[i-1, j-1] for the next iteration
        }
    }
    return dp[m];
}

const s = 'bag';
const t = 'pack';
const n = s.length,
    m = t.length;

// Brute-force search
let res = editDistanceDFS(s, t, n, m);
console.log(`Changing ${s} to ${t} requires at least ${res} edits`);

// Memoized search
const mem = Array.from(new Array(n + 1), () => new Array(m + 1).fill(-1));
res = editDistanceDFSMem(s, t, mem, n, m);
console.log(`Changing ${s} to ${t} requires at least ${res} edits`);

// Dynamic programming
res = editDistanceDP(s, t);
console.log(`Changing ${s} to ${t} requires at least ${res} edits`);

// Space-optimized dynamic programming
res = editDistanceDPComp(s, t);
console.log(`Changing ${s} to ${t} requires at least ${res} edits`);
