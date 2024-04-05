/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯演算法：子集和 I */
fn backtrack(
    mut state: Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // 子集和等於 target 時，記錄解
    if total == target {
        res.push(state);
        return;
    }
    // 走訪所有選擇
    for i in 0..choices.len() {
        // 剪枝：若子集和超過 target ，則跳過該選擇
        if total + choices[i] > target {
            continue;
        }
        // 嘗試：做出選擇，更新元素和 total
        state.push(choices[i]);
        // 進行下一輪選擇
        backtrack(state.clone(), target, total + choices[i], choices, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.pop();
    }
}

/* 求解子集和 I（包含重複子集） */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let state = Vec::new(); // 狀態（子集）
    let total = 0; // 子集和
    let mut res = Vec::new(); // 結果串列（子集串列）
    backtrack(state, target, total, nums, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("輸入陣列 nums = {:?}, target = {}", &nums, target);
    println!("所有和等於 {} 的子集 res = {:?}", target, &res);
    println!("請注意，該方法輸出的結果包含重複集合");
}
