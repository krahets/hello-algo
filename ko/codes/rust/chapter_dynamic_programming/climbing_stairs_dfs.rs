/*
 * File: climbing_stairs_dfs.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 탐색 */
fn dfs(i: usize) -> i32 {
    // 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1) + dfs(i - 2);
    count
}

/* 계단 오르기: 탐색 */
fn climbing_stairs_dfs(n: usize) -> i32 {
    dfs(n)
}

/* 실행 예제 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs(n);
    println!("계단 {n}개를 오르는 방법은 {res}가지");
}
