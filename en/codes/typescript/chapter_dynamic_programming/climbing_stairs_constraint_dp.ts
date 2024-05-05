/**
 * File: climbing_stairs_constraint_dp.ts
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Constrained climbing stairs: Dynamic programming */
function climbingStairsConstraintDP(n: number): number {
    if (n === 1 || n === 2) {
        return 1;
    }
    // Initialize dp table, used to store subproblem solutions
    const dp = Array.from({ length: n + 1 }, () => new Array(3));
    // Initial state: preset the smallest subproblem solution
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // State transition: gradually solve larger subproblems from smaller ones
    for (let i = 3; i <= n; i++) {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    return dp[n][1] + dp[n][2];
}

/* Driver Code */
const n = 9;
const res = climbingStairsConstraintDP(n);
console.log(`爬 ${n} 阶楼梯共有 ${res} 种方案`);

export {};
