/**
 * File: min_cost_climbing_stairs_dp.js
 * Created Time: 2023-08-23
 * Author: Gaofer Chou (gaofer-chou@qq.com)
 */

/* Minimum cost to climb stairs: dynamic programming */
function minCostClimbingStairsDP(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    // Initialize the dp table to store subproblem solutions
    const dp = new Array(n + 1);
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = cost[1];
    dp[2] = cost[2];
    // State transitions: solve progressively larger subproblems using smaller ones
    for (let i = 3; i <= n; i++) {
        dp[i] = Math.min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    return dp[n];
}

/* Minimum cost to climb stairs: space-optimized dynamic programming */
function minCostClimbingStairsDPComp(cost) {
    const n = cost.length - 1;
    if (n === 1 || n === 2) {
        return cost[n];
    }
    let a = cost[1],
        b = cost[2];
    for (let i = 3; i <= n; i++) {
        const tmp = b;
        b = Math.min(a, tmp) + cost[i];
        a = tmp;
    }
    return b;
}

/* Driver code */
const cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
console.log('Input list of stair costs:', cost);

let res = minCostClimbingStairsDP(cost);
console.log(`Minimum cost to climb the stairs: ${res}`);

res = minCostClimbingStairsDPComp(cost);
console.log(`Minimum cost to climb the stairs: ${res}`);
