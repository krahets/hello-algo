/*
 * File: climbing_stairs_backtrack.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯 */
fn backtrack(choices: &[usize], state: usize, n: usize, res: &mut [usize]) {
    // 当爬到第 n 阶时，方案数量加 1
    if state == n {
        res[0] += 1;
    }
    // 遍历所有选择
    for &choice in choices {
        // 剪枝：不允许越过第 n 阶
        if state + choice > n {
            continue;
        }
        // 尝试：做出选择，更新状态
        backtrack(choices, state + choice, n, res);
        // 回退
    }
}

/* 爬楼梯：回溯 */
pub fn climbing_stairs_backtrack(n: usize) -> usize {
    // 可选择向上爬 1 阶或 2 阶
    let choices = [1, 2];
    // 从第 0 阶开始爬
    let state = 0;
    // 使用 res[0] 记录方案数量
    let mut res = vec![0];
    backtrack(&choices, state, n, &mut res);
    res[0]
}

/* Driver Code */
fn main() {
    let n = 9;

    let res = climbing_stairs_backtrack(n);
    println!("爬 {n} 阶楼梯共有 {res} 种方案");
}
