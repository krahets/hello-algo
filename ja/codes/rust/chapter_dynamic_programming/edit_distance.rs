/*
 * File: edit_distance.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 編集距離：総当たり探索 */
fn edit_distance_dfs(s: &str, t: &str, i: usize, j: usize) -> i32 {
    // s と t がともに空なら 0 を返す
    if i == 0 && j == 0 {
        return 0;
    }
    // s が空なら t の長さを返す
    if i == 0 {
        return j as i32;
    }
    // t が空なら s の長さを返す
    if j == 0 {
        return i as i32;
    }
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs(s, t, i - 1, j - 1);
    }
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    let insert = edit_distance_dfs(s, t, i, j - 1);
    let delete = edit_distance_dfs(s, t, i - 1, j);
    let replace = edit_distance_dfs(s, t, i - 1, j - 1);
    // 最小編集回数を返す
    std::cmp::min(std::cmp::min(insert, delete), replace) + 1
}

/* 編集距離：メモ化探索 */
fn edit_distance_dfs_mem(s: &str, t: &str, mem: &mut Vec<Vec<i32>>, i: usize, j: usize) -> i32 {
    // s と t がともに空なら 0 を返す
    if i == 0 && j == 0 {
        return 0;
    }
    // s が空なら t の長さを返す
    if i == 0 {
        return j as i32;
    }
    // t が空なら s の長さを返す
    if j == 0 {
        return i as i32;
    }
    // 記録済みなら、それをそのまま返す
    if mem[i][j] != -1 {
        return mem[i][j];
    }
    // 2 つの文字が等しければ、その 2 文字をそのままスキップする
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    }
    // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
    let insert = edit_distance_dfs_mem(s, t, mem, i, j - 1);
    let delete = edit_distance_dfs_mem(s, t, mem, i - 1, j);
    let replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    // 最小編集回数を記録して返す
    mem[i][j] = std::cmp::min(std::cmp::min(insert, delete), replace) + 1;
    mem[i][j]
}

/* 編集距離：動的計画法 */
fn edit_distance_dp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![vec![0; m + 1]; n + 1];
    // 状態遷移：先頭行と先頭列
    for i in 1..=n {
        dp[i][0] = i as i32;
    }
    for j in 1..m {
        dp[0][j] = j as i32;
    }
    // 状態遷移: 残りの行と列
    for i in 1..=n {
        for j in 1..=m {
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[i][j] =
                    std::cmp::min(std::cmp::min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    dp[n][m]
}

/* 編集距離：空間最適化した動的計画法 */
fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![0; m + 1];
    // 状態遷移：先頭行
    for j in 1..m {
        dp[j] = j as i32;
    }
    // 状態遷移：残りの行
    for i in 1..=n {
        // 状態遷移：先頭列
        let mut leftup = dp[0]; // dp[i-1, j-1] を一時保存する
        dp[0] = i as i32;
        // 状態遷移：残りの列
        for j in 1..=m {
            let temp = dp[j];
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // 2 つの文字が等しければ、その 2 文字をそのままスキップする
                dp[j] = leftup;
            } else {
                // 最小編集回数 = 挿入・削除・置換の 3 操作における最小編集回数 + 1
                dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 次の反復の dp[i-1, j-1] に更新する
        }
    }
    dp[m]
}

/* Driver Code */
pub fn main() {
    let s = "bag";
    let t = "pack";
    let (n, m) = (s.len(), t.len());

    // 全探索
    let res = edit_distance_dfs(s, t, n, m);
    println!("{s} を {t} に変更するには最小で {res} 回の編集が必要");

    // メモ化探索
    let mut mem = vec![vec![0; m + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = edit_distance_dfs_mem(s, t, &mut mem, n, m);
    println!("{s} を {t} に変更するには最小で {res} 回の編集が必要");

    // 動的計画法
    let res = edit_distance_dp(s, t);
    println!("{s} を {t} に変更するには最小で {res} 回の編集が必要");

    // 空間最適化後の動的計画法
    let res = edit_distance_dp_comp(s, t);
    println!("{s} を {t} に変更するには最小で {res} 回の編集が必要");
}
