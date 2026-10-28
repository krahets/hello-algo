/*
 * File: climbing_stairs_dp.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 계단 오르기: 동적 계획법 */
fn climbing_stairs_dp(n: usize) -> i32 {
    // dp[1]과 dp[2]는 이미 알고 있으므로 해당 값을 반환한다
    if n == 1 || n == 2 {
        return n as i32;
    }
    // 부분 문제의 해를 저장할 dp 테이블을 초기화한다
    let mut dp = vec![-1; n + 1];
    // 초기 상태: 가장 작은 부분 문제의 해를 미리 설정한다
    dp[1] = 1;
    dp[2] = 2;
    // 상태 전이: 작은 부분 문제부터 점차 큰 부분 문제를 푼다
    for i in 3..=n {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    dp[n]
}

/* 계단 오르기: 공간을 최적화한 동적 계획법 */
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

/* 실행 코드 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dp(n);
    println!("{n}개의 계단을 오르는 방법은 총 {res}가지이다");

    let res = climbing_stairs_dp_comp(n);
    println!("{n}개의 계단을 오르는 방법은 총 {res}가지이다");
}
