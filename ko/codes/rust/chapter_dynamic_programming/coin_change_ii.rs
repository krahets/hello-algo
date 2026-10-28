/*
 * File: coin_change_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 동전 교환 II: 동적 계획법 */
fn coin_change_ii_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // dp 테이블을 초기화한다
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // 첫 번째 열을 초기화한다
    for i in 0..=n {
        dp[i][0] = 1;
    }
    // 상태 전이
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1] as usize];
            }
        }
    }
    dp[n][amt]
}

/* 동전 교환 II: 공간을 최적화한 동적 계획법 */
fn coin_change_ii_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    // dp 테이블을 초기화한다
    let mut dp = vec![0; amt + 1];
    dp[0] = 1;
    // 상태 전이
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우의 방법 수를 더한다
                dp[a] = dp[a] + dp[a - coins[i - 1] as usize];
            }
        }
    }
    dp[amt]
}

/* 실행 코드 */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 5;

    // 동적 계획법
    let res = coin_change_ii_dp(&coins, amt);
    println!("목표 금액을 만드는 동전 조합의 수는 {res}개이다");

    // 공간을 최적화한 동적 계획법
    let res = coin_change_ii_dp_comp(&coins, amt);
    println!("목표 금액을 만드는 동전 조합의 수는 {res}개이다");
}
