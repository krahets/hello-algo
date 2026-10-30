/**
 * File: climbing_stairs_dp.ts
 * Created Time: 2023-07-26
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Climbing stairs: dynamic programming */
function climbingStairsDP(n: number): number {
    if (n === 1 || n === 2) return n;
    // Initialize the dp table to store subproblem solutions
    const dp = new Array(n + 1).fill(-1);
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = 1;
    dp[2] = 2;
    // State transitions: solve progressively larger subproblems using smaller ones
    for (let i = 3; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}

/* Climbing stairs: space-optimized dynamic programming */
function climbingStairsDPComp(n: number): number {
    if (n === 1 || n === 2) return n;
    let a = 1,
        b = 2;
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = a + b;
        a = tmp;
    }
    return b;
}

/* Driver code */
const n = 9;
let res = climbingStairsDP(n);
console.log(`Number of ways to climb ${n} stairs: ${res}`);
res = climbingStairsDPComp(n);
console.log(`Number of ways to climb ${n} stairs: ${res}`);

export {};
