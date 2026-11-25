/*
 * File: climbing_stairs_dfs_mem.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 메모이제이션 탐색 */
fn dfs(i: usize, mem: &mut [i32]) -> i32 {
    // 이미 아는 dp[1]과 dp[2]의 값 중 해당 값을 반환한다
    if i == 1 || i == 2 {
        return i as i32;
    }
    // dp[i]의 기록이 있으면 바로 반환한다
    if mem[i] != -1 {
        return mem[i];
    }
    // dp[i] = dp[i-1] + dp[i-2]
    let count = dfs(i - 1, mem) + dfs(i - 2, mem);
    // dp[i] 기록
    mem[i] = count;
    count
}

/* 계단 오르기: 메모이제이션 탐색 */
fn climbing_stairs_dfs_mem(n: usize) -> i32 {
    // mem[i]에 i번째 계단까지 오르는 방법 수를 기록한다. -1은 기록이 없음을 뜻한다
    let mut mem = vec![-1; n + 1];
    dfs(n, &mut mem)
}

/* 실행 예제 */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_dfs_mem(n);
    println!("계단 {n}개를 오르는 방법은 {res}가지");
}
