/*
 * File: coin_change.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 동전 교환: 동적 계획법 */
fn coin_change_dp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // dp 테이블을 초기화한다
    let mut dp = vec![vec![0; amt + 1]; n + 1];
    // 상태 전이: 첫 번째 행과 첫 번째 열
    for a in 1..=amt {
        dp[0][a] = max;
    }
    // 상태 전이: 나머지 행과 열
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[i][a] = dp[i - 1][a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[i][a] = std::cmp::min(dp[i - 1][a], dp[i][a - coins[i - 1] as usize] + 1);
            }
        }
    }
    if dp[n][amt] != max {
        return dp[n][amt] as i32;
    } else {
        -1
    }
}

/* 동전 교환: 공간을 최적화한 동적 계획법 */
fn coin_change_dp_comp(coins: &[i32], amt: usize) -> i32 {
    let n = coins.len();
    let max = amt + 1;
    // dp 테이블을 초기화한다
    let mut dp = vec![0; amt + 1];
    dp.fill(max);
    dp[0] = 0;
    // 상태 전이
    for i in 1..=n {
        for a in 1..=amt {
            if coins[i - 1] > a as i32 {
                // 목표 금액을 초과하면 동전 i를 선택하지 않는다
                dp[a] = dp[a];
            } else {
                // 동전 i를 선택하지 않는 경우와 선택하는 경우 중 더 작은 값
                dp[a] = std::cmp::min(dp[a], dp[a - coins[i - 1] as usize] + 1);
            }
        }
    }
    if dp[amt] != max {
        return dp[amt] as i32;
    } else {
        -1
    }
}

/* 실행 코드 */
pub fn main() {
    let coins = [1, 2, 5];
    let amt: usize = 4;

    // 동적 계획법
    let res = coin_change_dp(&coins, amt);
    println!("목표 금액을 만드는 데 필요한 최소 동전 개수는 {res}개이다");

    // 공간을 최적화한 동적 계획법
    let res = coin_change_dp_comp(&coins, amt);
    println!("목표 금액을 만드는 데 필요한 최소 동전 개수는 {res}개이다");
}
