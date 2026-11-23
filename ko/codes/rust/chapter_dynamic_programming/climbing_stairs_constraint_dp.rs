/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 제약 조건이 있는 계단 오르기: 동적 계획법 */
fn climbing_stairs_constraint_dp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return 1;
    };
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    let mut dp = vec![vec![-1; 3]; n + 1];
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in 3..=n {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    dp[n][1] + dp[n][2]
}

/* 실행 코드 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_constraint_dp(n);
    println!("{n}개의 계단을 오르는 방법은 총 {res}가지이다");
}
