/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Climbing stairs with constraint: Dynamic programming */
fn climbing_stairs_constraint_dp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return 1;
    };
    // Initialize dp table, used to store solutions to subproblems
    let mut dp = vec![vec![-1; 3]; n + 1];
    // Initial state: preset the solution to the smallest subproblem
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // State transition: gradually solve larger subproblems from smaller ones
    for i in 3..=n {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    dp[n][1] + dp[n][2]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_constraint_dp(n);
    println!("Climbing {n} stairs has {res} solutions");
}
