/*
 * File: unbounded_knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 무한 배낭: 동적 계획법 */
fn unbounded_knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // dp 테이블 초기화
    let mut dp = vec![vec![0; cap + 1]; n + 1];
    // 상태 전이
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[i][c] = dp[i - 1][c];
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[i][c] = std::cmp::max(dp[i - 1][c], dp[i][c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    return dp[n][cap];
}

/* 무한 배낭: 공간 최적화 동적 계획법 */
fn unbounded_knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // dp 테이블 초기화
    let mut dp = vec![0; cap + 1];
    // 상태 전이
    for i in 1..=n {
        for c in 1..=cap {
            if wgt[i - 1] > c as i32 {
                // 배낭 용량을 넘으면 물건 i를 선택하지 않는다
                dp[c] = dp[c];
            } else {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* 실행 예제 */
pub fn main() {
    let wgt = [1, 2, 3];
    let val = [5, 11, 15];
    let cap: usize = 4;

    // 동적 계획법
    let res = unbounded_knapsack_dp(&wgt, &val, cap);
    println!("배낭 용량 내에서 얻는 최대 가치: {res}");

    // 공간 최적화 동적 계획법
    let res = unbounded_knapsack_dp_comp(&wgt, &val, cap);
    println!("배낭 용량 내에서 얻는 최대 가치: {res}");
}
