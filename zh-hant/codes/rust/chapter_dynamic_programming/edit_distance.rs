/*
 * File: edit_distance.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 編輯距離：暴力搜尋 */
fn edit_distance_dfs(s: &str, t: &str, i: usize, j: usize) -> i32 {
    // 若 s 和 t 都為空，則返回 0
    if i == 0 && j == 0 {
        return 0;
    }
    // 若 s 為空，則返回 t 長度
    if i == 0 {
        return j as i32;
    }
    // 若 t 為空，則返回 s 長度
    if j == 0 {
        return i as i32;
    }
    // 若兩字元相等，則直接跳過此兩字元
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs(s, t, i - 1, j - 1);
    }
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    let insert = edit_distance_dfs(s, t, i, j - 1);
    let delete = edit_distance_dfs(s, t, i - 1, j);
    let replace = edit_distance_dfs(s, t, i - 1, j - 1);
    // 返回最少編輯步數
    std::cmp::min(std::cmp::min(insert, delete), replace) + 1
}

/* 編輯距離：記憶化搜尋 */
fn edit_distance_dfs_mem(s: &str, t: &str, mem: &mut Vec<Vec<i32>>, i: usize, j: usize) -> i32 {
    // 若 s 和 t 都為空，則返回 0
    if i == 0 && j == 0 {
        return 0;
    }
    // 若 s 為空，則返回 t 長度
    if i == 0 {
        return j as i32;
    }
    // 若 t 為空，則返回 s 長度
    if j == 0 {
        return i as i32;
    }
    // 若已有記錄，則直接返回之
    if mem[i][j] != -1 {
        return mem[i][j];
    }
    // 若兩字元相等，則直接跳過此兩字元
    if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
        return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    }
    // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
    let insert = edit_distance_dfs_mem(s, t, mem, i, j - 1);
    let delete = edit_distance_dfs_mem(s, t, mem, i - 1, j);
    let replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1);
    // 記錄並返回最少編輯步數
    mem[i][j] = std::cmp::min(std::cmp::min(insert, delete), replace) + 1;
    mem[i][j]
}

/* 編輯距離：動態規劃 */
fn edit_distance_dp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![vec![0; m + 1]; n + 1];
    // 狀態轉移：首行首列
    for i in 1..=n {
        dp[i][0] = i as i32;
    }
    for j in 1..m {
        dp[0][j] = j as i32;
    }
    // 狀態轉移：其餘行和列
    for i in 1..=n {
        for j in 1..=m {
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // 若兩字元相等，則直接跳過此兩字元
                dp[i][j] = dp[i - 1][j - 1];
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[i][j] =
                    std::cmp::min(std::cmp::min(dp[i][j - 1], dp[i - 1][j]), dp[i - 1][j - 1]) + 1;
            }
        }
    }
    dp[n][m]
}

/* 編輯距離：空間最佳化後的動態規劃 */
fn edit_distance_dp_comp(s: &str, t: &str) -> i32 {
    let (n, m) = (s.len(), t.len());
    let mut dp = vec![0; m + 1];
    // 狀態轉移：首行
    for j in 1..m {
        dp[j] = j as i32;
    }
    // 狀態轉移：其餘行
    for i in 1..=n {
        // 狀態轉移：首列
        let mut leftup = dp[0]; // 暫存 dp[i-1, j-1]
        dp[0] = i as i32;
        // 狀態轉移：其餘列
        for j in 1..=m {
            let temp = dp[j];
            if s.chars().nth(i - 1) == t.chars().nth(j - 1) {
                // 若兩字元相等，則直接跳過此兩字元
                dp[j] = leftup;
            } else {
                // 最少編輯步數 = 插入、刪除、替換這三種操作的最少編輯步數 + 1
                dp[j] = std::cmp::min(std::cmp::min(dp[j - 1], dp[j]), leftup) + 1;
            }
            leftup = temp; // 更新為下一輪的 dp[i-1, j-1]
        }
    }
    dp[m]
}

/* Driver Code */
pub fn main() {
    let s = "bag";
    let t = "pack";
    let (n, m) = (s.len(), t.len());

    // 暴力搜尋
    let res = edit_distance_dfs(s, t, n, m);
    println!("將 {s} 更改為 {t} 最少需要編輯 {res} 步");

    // 記憶搜尋
    let mut mem = vec![vec![0; m + 1]; n + 1];
    for row in mem.iter_mut() {
        row.fill(-1);
    }
    let res = edit_distance_dfs_mem(s, t, &mut mem, n, m);
    println!("將 {s} 更改為 {t} 最少需要編輯 {res} 步");

    // 動態規劃
    let res = edit_distance_dp(s, t);
    println!("將 {s} 更改為 {t} 最少需要編輯 {res} 步");

    // 空間最佳化後的動態規劃
    let res = edit_distance_dp_comp(s, t);
    println!("將 {s} 更改為 {t} 最少需要編輯 {res} 步");
}
