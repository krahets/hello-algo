/*
 * File: edit_distance.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 편집 거리: 완전 탐색 */
fn edit_distance_dfs(s: &str, t: &str, i: usize, j: usize) -> i32 {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if i == 0 && j == 0 {
        return 0;
    }
    // s가 비어 있으면 t의 길이를 반환한다
    if i == 0 {
        return j as i32;
    }
    // t가 비어 있으면 s의 길이를 반환한다
    if j == 0 {
        return i as i32;
    }
    // 두 문자가 같으면 둘 다 건너뛴다
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs(s, t, i - 1, j - 1);
    }
    // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
    let insert = edit_distance_dfs(s, t, i, j - 1);
    let delete = edit_distance_dfs(s, t, i - 1, j);
    let replace = edit_distance_dfs(s, t, i - 1, j - 1);
    // 최소 편집 횟수 반환
    std::cmp::min(std::cmp::min(insert, delete), replace) + 1
}

/* 편집 거리: 메모이제이션 탐색 */
fn edit_distance_dfs_mem(s: &str, t: &str, mem: &mut Vec<Vec<i32>>, i: usize, j: usize) -> i32 {
    // s와 t가 모두 비어 있으면 0을 반환한다
    if i == 0 && j == 0 {
        return 0;
    }
    // s가 비어 있으면 t의 길이를 반환한다
    if i == 0 {
        return j as i32;
    }
    // t가 비어 있으면 s의 길이를 반환한다
    if j == 0 {
        return i as i32;
    }
    // 기록이 있으면 바로 반환한다
    if mem[i][j] != -1 {
        return mem[i][j];
    }
    // 두 문자가 같으면 둘 다 건너뛴다
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    }
    // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
    let insert = edit_distance_dfs_mem(s, t, mem, i, j - 1);
    let delete = edit_distance_dfs_mem(s, t, mem, i - 1, j);
    let replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    // 최소 편집 횟수를 기록하고 반환한다
    mem[i][j] = std::cmp::min(std::cmp::min(insert, delete), replace) + 1;
    mem[i][j]
}

/* 편집 거리: 동적 계획법 */
fn edit_distance_dp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![vec![0; m + 1]; n + 1];
    // 상태 전이: 첫 행과 첫 열
    for i in 1..=n {
        dp[i][0] = i as i32;
    }
    for j in 1..m {
        dp[0][j] = j as i32;
    }
    // 상태 전이: 나머지 행과 열
    for i in 1..=n {
        for j in 1..=m {
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // 두 문자가 같으면 둘 다 건너뛴다
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
                dp[i][j] =
                    std::cmp::min(std::cmp::min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    dp[n][m]
}

/* 편집 거리: 공간 최적화 동적 계획법 */
fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![0; m + 1];
    // 상태 전이: 첫 행
    for j in 1..m {
        dp[j] = j as i32;
    }
    // 상태 전이: 나머지 행
    for i in 1..=n {
        // 상태 전이: 첫 열
        let mut leftup = dp[0]; // dp[i-1, j-1] 임시 저장
        dp[0] = i as i32;
        // 상태 전이: 나머지 열
        for j in 1..=m {
            let temp = dp[j];
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // 두 문자가 같으면 둘 다 건너뛴다
                dp[j] = leftup;
            } else {
                // 최소 편집 횟수 = 삽입, 삭제, 교체 후 남은 편집 횟수의 최솟값 + 1
                dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 다음 반복에서 쓸 dp[i-1, j-1] 값으로 갱신한다
        }
    }
    dp[m]
}

/* 실행 예제 */
pub fn main() {
    let s = "bag";
    let t = "pack";
    let (n, m) = (s.len(), t.len());

    // 완전 탐색
    let res = edit_distance_dfs(s, t, n, m);
    println!("문자열 {s}에서 {t}까지 최소 편집 횟수는 {res}회");

    // 메모이제이션 탐색
    let mut mem = vec![vec![0; m + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = edit_distance_dfs_mem(s, t, &mut mem, n, m);
    println!("문자열 {s}에서 {t}까지 최소 편집 횟수는 {res}회");

    // 동적 계획법
    let res = edit_distance_dp(s, t);
    println!("문자열 {s}에서 {t}까지 최소 편집 횟수는 {res}회");

    // 공간 최적화 동적 계획법
    let res = edit_distance_dp_comp(s, t);
    println!("문자열 {s}에서 {t}까지 최소 편집 횟수는 {res}회");
}
