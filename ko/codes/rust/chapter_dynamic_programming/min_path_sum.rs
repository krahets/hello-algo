/*
 * File: min_path_sum.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 최소 경로 합: 완전 탐색 */
fn min_path_sum_dfs(grid: &Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 왼쪽 위 모서리에서 (i-1, j)와 (i, j-1)까지의 최소 경로 비용을 계산한다
    let up = min_path_sum_dfs(grid, i - 1, j);
    let left = min_path_sum_dfs(grid, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 반환한다
    std::cmp::min(left, up) + grid[i as usize][j as usize]
}

/* 최소 경로 합: 메모이제이션을 이용한 탐색 */
fn min_path_sum_dfs_mem(grid: &Vec<Vec<i32>>, mem: &mut Vec<Vec<i32>>, i: i32, j: i32) -> i32 {
    // 왼쪽 위 모서리의 칸이면 탐색을 종료한다
    if i == 0 && j == 0 {
        return grid[0][0];
    }
    // 행 또는 열 인덱스가 범위를 벗어나면 비용 +∞를 반환한다
    if i < 0 || j < 0 {
        return i32::MAX;
    }
    // 기록이 이미 있으면 바로 반환한다
    if mem[i as usize][j as usize] != -1 {
        return mem[i as usize][j as usize];
    }
    // 왼쪽 칸과 위쪽 칸까지의 최소 경로 비용
    let up = min_path_sum_dfs_mem(grid, mem, i - 1, j);
    let left = min_path_sum_dfs_mem(grid, mem, i, j - 1);
    // 왼쪽 위 모서리에서 (i, j)까지의 최소 경로 비용을 기록하고 반환한다
    mem[i as usize][j as usize] = std::cmp::min(left, up) + grid[i as usize][j as usize];
    mem[i as usize][j as usize]
}

/* 최소 경로 합: 동적 계획법 */
fn min_path_sum_dp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // dp 테이블을 초기화한다
    let mut dp = vec![vec![0; m]; n];
    dp[0][0] = grid[0][0];
    // 상태 전이: 첫 번째 행
    for j in 1..m {
        dp[0][j] = dp[0][j - 1] + grid[0][j];
    }
    // 상태 전이: 첫 번째 열
    for i in 1..n {
        dp[i][0] = dp[i - 1][0] + grid[i][0];
    }
    // 상태 전이: 나머지 행과 열
    for i in 1..n {
        for j in 1..m {
            dp[i][j] = std::cmp::min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j];
        }
    }
    dp[n - 1][m - 1]
}

/* 최소 경로 합: 공간을 최적화한 동적 계획법 */
fn min_path_sum_dp_comp(grid: &Vec<Vec<i32>>) -> i32 {
    let (n, m) = (grid.len(), grid[0].len());
    // dp 테이블을 초기화한다
    let mut dp = vec![0; m];
    // 상태 전이: 첫 번째 행
    dp[0] = grid[0][0];
    for j in 1..m {
        dp[j] = dp[j - 1] + grid[0][j];
    }
    // 상태 전이: 나머지 행
    for i in 1..n {
        // 상태 전이: 첫 번째 열
        dp[0] = dp[0] + grid[i][0];
        // 상태 전이: 나머지 열
        for j in 1..m {
            dp[j] = std::cmp::min(dp[j - 1], dp[j]) + grid[i][j];
        }
    }
    dp[m - 1]
}

/* 실행 코드 */
pub fn main() {
    let grid = vec![
        vec![1, 3, 1, 5],
        vec![2, 2, 4, 2],
        vec![5, 3, 2, 1],
        vec![4, 3, 5, 2],
    ];
    let (n, m) = (grid.len(), grid[0].len());

    // 완전 탐색
    let res = min_path_sum_dfs(&grid, n as i32 - 1, m as i32 - 1);
    println!("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다");

    // 메모이제이션을 이용한 탐색
    let mut mem = vec![vec![0; m]; n];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = min_path_sum_dfs_mem(&grid, &mut mem, n as i32 - 1, m as i32 - 1);
    println!("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다");

    // 동적 계획법
    let res = min_path_sum_dp(&grid);
    println!("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다");

    // 공간을 최적화한 동적 계획법
    let res = min_path_sum_dp_comp(&grid);
    println!("왼쪽 위 모서리에서 오른쪽 아래 모서리까지의 최소 경로 합은 {res}이다");
}
