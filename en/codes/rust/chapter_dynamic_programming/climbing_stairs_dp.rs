/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* Climbing stairs: Dynamic programming */
fn climbing_stairs_dp(n: usize) -> i32 {
    // Known dp[1] and dp[2], return them
    if n == 1 || n == 2 {
        return n as i32;
    }
    // Initialize dp table, used to store solutions to subproblems
    let mut dp = vec![-1; n + 1];
    // Initial state: preset the solution to the smallest subproblem
    dp[1] = 1;
    dp[2] = 2;
    // State transition: gradually solve larger subproblems from smaller ones
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* Climbing stairs: Space-optimized dynamic programming */
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

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dp(n);
    println!("Climbing {n} stairs has {res} solutions");

    let res = climbing_stairs_dp_comp(n);
    println!("Climbing {n} stairs has {res} solutions");
}
