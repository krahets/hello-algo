/*
 * File: climbing_stairs_constraint_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 제약이 있는 계단 오르기: 동적 계획법 */
fn climbing_stairs_constraint_dp(n: usize) -> i32 {
    if n == 1 || n == 2 {
        return 1;
    };
    // 부분 문제의 해를 저장할 dp 테이블 초기화
    let mut dp = vec![vec![-1; 3]; n + 1];
    // 초기 상태: 가장 작은 부분 문제의 해를 설정한다
    dp[1][1] = 1;
    dp[1][2] = 0;
    dp[2][1] = 0;
    dp[2][2] = 1;
    // 상태 전이: 작은 부분 문제부터 큰 부분 문제까지 차례로 푼다
    for i in 3..=n {
        dp[i][1] = dp[i - 1][2];
        dp[i][2] = dp[i - 2][1] + dp[i - 2][2];
    }
    dp[n][1] + dp[n][2]
}

/* 실행 예제 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_constraint_dp(n);
    println!("계단 {n}개를 오르는 방법은 {res}가지");
}
