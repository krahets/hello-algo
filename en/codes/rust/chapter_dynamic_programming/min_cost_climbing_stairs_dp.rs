/*
 * File: min_cost_climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* Minimum cost climbing stairs: Dynamic programming */
fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    }
    // Initialize dp table, used to store solutions to subproblems
    let mut dp = vec![-1; n + 1];
    // Initial state: preset the solution to the smallest subproblem
    dp[1] = cost[1];
    dp[2] = cost[2];
    // State transition: gradually solve larger subproblems from smaller ones
    for i in 3..=n {
        dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    dp[n]
}

/* Minimum cost climbing stairs: Space-optimized dynamic programming */
fn min_cost_climbing_stairs_dp_comp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    };
    let (mut a, mut b) = (cost[1], cost[2]);
    for i in 3..=n {
        let tmp = b;
        b = cmp::min(a, tmp) + cost[i];
        a = tmp;
    }
    b
}

/* Driver Code */
pub fn main() {
    let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
    println!("Input stair cost list is {:?}", &cost);

    let res = min_cost_climbing_stairs_dp(&cost);
    println!("Minimum cost to climb stairs is {res}");

    let res = min_cost_climbing_stairs_dp_comp(&cost);
    println!("Minimum cost to climb stairs is {res}");
}
