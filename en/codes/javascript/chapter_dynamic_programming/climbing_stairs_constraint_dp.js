/**
 * File: climbing_stairs_constraint_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Climbing stairs with constraints: dynamic programming */
function climbingStairsConstraintDP(n) {
    if (n === 1 || n === 2) {
        return 1;
    }
    // Initialize the dp table to store subproblem solutions
    const dp = Array.from(new Array(n + 1), () => new Array(3));
    // Initial states: set the solutions to the smallest subproblems
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // State transitions: solve progressively larger subproblems using smaller ones
    for (let i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* Driver code */
const n = 9;
const res = climbingStairsConstraintDP(n);
console.log(`Number of ways to climb ${n} stairs: ${res}`);
