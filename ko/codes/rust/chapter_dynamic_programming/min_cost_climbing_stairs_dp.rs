/*
 * File: min_cost_climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

use std::cmp;

/* 계단 오르기의 최소 비용: 동적 계획법 */
fn min_cost_climbing_stairs_dp(cost: &[i32]) -> i32 {
    let n = cost.len() - 1;
    if n == 1 || n == 2 {
        return cost[n];
    }
    // 부분 문제의 해를 저장할 dp 테이블 초기화
    let mut dp = vec![-1; n + 1];
    // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1] = cost[1];
    dp[2] = cost[2];
    // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for i in 3..=n {
        dp[i] = cmp::min(dp[i - 1], dp[i - 2]) + cost[i];
    }
    dp[n]
}

/* 계단 오르기의 최소 비용: 공간 최적화 동적 계획법 */
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

/* 실행 예제 */
pub fn main() {
    let cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
    println!("입력한 계단별 비용 목록: {:?}", &cost);

    let res = min_cost_climbing_stairs_dp(&cost);
    println!("계단을 모두 오르는 최소 비용: {res}");

    let res = min_cost_climbing_stairs_dp_comp(&cost);
    println!("계단을 모두 오르는 최소 비용: {res}");
}
