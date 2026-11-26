/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯演算法：子集和 I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // 子集總和達到目標時，記錄此解
    if total == target {
        res.push(state.clone());
        return;
    }
    // 逐一檢查所有選項
    for i in 0..choices.len() {
        // 剪枝：若加入該元素後總和超過 target，略過這個選擇
        if total + choices[i] > target {
            continue;
        }
        // 嘗試：做出選擇，更新元素總和 total
        state.push(choices[i]);
        // 進入下一輪選擇
        backtrack(state, target, total + choices[i], choices, res);
        // 回溯：撤銷選擇，還原先前的狀態
        state.pop();
    }
}

/* 求解子集和 I（含重複子集） */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 狀態（子集）
    let total = 0; // 子集總和
    let mut res = Vec::new(); // 結果串列（子集串列）
    backtrack(&mut state, target, total, nums, &mut res);
    res
}

/* 主程式 */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("輸入陣列 nums = {:?}, target = {}", &nums, target);
    println!("總和等於 {} 的所有子集 res = {:?}", target, &res);
    println!("請注意，這個方法輸出的結果含有重複集合");
}
