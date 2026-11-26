/*
 * File: knapsack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 0-1 배낭: 완전 탐색 */
fn knapsack_dfs(wgt: &[i32], val: &[i32], i: usize, c: usize) -> i32 {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 || c == 0 {
        return 0;
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs(wgt, val, i - 1, c);
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    let no = knapsack_dfs(wgt, val, i - 1, c);
    let yes = knapsack_dfs(wgt, val, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // 두 경우 중 큰 가치를 반환한다
    std::cmp::max(no, yes)
}

/* 0-1 배낭: 메모이제이션 탐색 */
fn knapsack_dfs_mem(wgt: &[i32], val: &[i32], mem: &mut Vec<Vec<i32>>, i: usize, c: usize) -> i32 {
    // 모든 물건을 검토했거나 남은 용량이 없으면 가치 0을 반환한다
    if i == 0 || c == 0 {
        return 0;
    }
    // 기록이 있으면 바로 반환한다
    if mem[i][c] != -1 {
        return mem[i][c];
    }
    // 배낭 용량을 넘으면 물건을 넣지 않는 선택만 가능하다
    if wgt[i - 1] > c as i32 {
        return knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    }
    // 물건 i를 넣지 않을 때와 넣을 때 각각의 최대 가치를 구한다
    let no = knapsack_dfs_mem(wgt, val, mem, i - 1, c);
    let yes = knapsack_dfs_mem(wgt, val, mem, i - 1, c - wgt[i - 1] as usize) + val[i - 1];
    // 두 경우 중 큰 가치를 기록하고 반환한다
    mem[i][c] = std::cmp::max(no, yes);
    mem[i][c]
}

/* 0-1 배낭: 동적 계획법 */
fn knapsack_dp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
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
                dp[i][c] = std::cmp::max(
                    dp[i - 1][c],
                    dp[i - 1][c - wgt[i - 1] as usize] + val[i - 1],
                );
            }
        }
    }
    dp[n][cap]
}

/* 0-1 배낭: 공간 최적화 동적 계획법 */
fn knapsack_dp_comp(wgt: &[i32], val: &[i32], cap: usize) -> i32 {
    let n = wgt.len();
    // dp 테이블 초기화
    let mut dp = vec![0; cap + 1];
    // 상태 전이
    for i in 1..=n {
        // 역순으로 순회
        for c in (1..=cap).rev() {
            if wgt[i - 1] <= c as i32 {
                // 물건 i를 선택하지 않을 때와 선택할 때 중 큰 값
                dp[c] = std::cmp::max(dp[c], dp[c - wgt[i - 1] as usize] + val[i - 1]);
            }
        }
    }
    dp[cap]
}

/* 실행 예제 */
pub fn main() {
    let wgt = [10, 20, 30, 40, 50];
    let val = [50, 120, 150, 210, 240];
    let cap: usize = 50;
    let n = wgt.len();

    // 완전 탐색
    let res = knapsack_dfs(&wgt, &val, n, cap);
    println!("배낭 용량 내에서 얻는 최대 가치: {res}");

    // 메모이제이션 탐색
    let mut mem = vec![vec![0; cap + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = knapsack_dfs_mem(&wgt, &val, &mut mem, n, cap);
    println!("배낭 용량 내에서 얻는 최대 가치: {res}");

    // 동적 계획법
    let res = knapsack_dp(&wgt, &val, cap);
    println!("배낭 용량 내에서 얻는 최대 가치: {res}");

    // 공간 최적화 동적 계획법
    let res = knapsack_dp_comp(&wgt, &val, cap);
    println!("배낭 용량 내에서 얻는 최대 가치: {res}");
}
