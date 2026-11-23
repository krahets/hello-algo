/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Climbing stairs: dynamic programming */
fn climbing_stairs_dp(n: usize) -> i32 {
    // The values of dp[1] and dp[2] are known; return them
    if n == 1 || n == 2 {
        return n as i32;
    }
    // Initialize the dp table to store subproblem solutions
    let mut dp = vec![-1; n + 1];
    // Initial states: set the solutions to the smallest subproblems
    dp[1] = 1;
    dp[2] = 2;
    // State transitions: solve progressively larger subproblems using smaller ones
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* Climbing stairs: space-optimized dynamic programming */
fn climbing_stairs_dp_comp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return n as i32;
    }
    let (mut a, mut b) = (1, 2);
    for _ in 3..=n {
        let tmp = b;
        b = a + b;
        a = tmp;
    }
    b
}

/* Driver code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dp(n);
    println!("Number of ways to climb {n} stairs: {res}");

    let res = climbing_stairs_dp_comp(n);
    println!("Number of ways to climb {n} stairs: {res}");
}
