/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯 */
fn backtrack(choices: &[i32], state: i32, n: i32, res: &mut [i32]) {
    // 當爬到第 n 階時，方案數量加 1
    if state == n {
        res[0] = res[0] + 1;
    }
    // 走訪所有選擇
    for &choice in choices {
        // 剪枝：不允許越過第 n 階
        if state + choice > n {
            continue;
        }
        // 嘗試：做出選擇，更新狀態
        backtrack(choices, state + choice, n, res);
        // 回退
    }
}

/* 爬樓梯：回溯 */
fn climbing_stairs_backtrack(n: usize) -> i32 {
    let choices = vec![1, 2]; // 可選擇向上爬 1 階或 2 階
    let state = 0; // 從第 0 階開始爬
    let mut res = Vec::new();
    res.push(0); // 使用 res[0] 記錄方案數量
    backtrack(&choices, state, n as i32, &mut res);
    res[0]
}

/* Driver Code */
pub fn main() {
    let n: usize = 9;

    let res = climbing_stairs_backtrack(n);
    println!("爬 {n} 階樓梯共有 {res} 種方案");
}
