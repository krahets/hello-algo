/*
 * File: subset_sum_i_naive.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯算法：子集和 I */
fn backtrack(
    mut state: Vec<i32>,
    target: i32,
    total: i32,
    choices: &[i32],
    res: &mut Vec<Vec<i32>>,
) {
    // 子集和等于 target 时，记录解
    if total == target {
        res.push(state);
        return;
    }
    // 遍历所有选择
    for i in 0..choices.len() {
        // 剪枝：若子集和超过 target ，则跳过该选择
        if total + choices[i] > target {
            continue;
        }
        // 尝试：做出选择，更新元素和 total
        state.push(choices[i]);
        // 进行下一轮选择
        backtrack(state.clone(), target, total + choices[i], choices, res);
        // 回退：撤销选择，恢复到之前的状态
        state.pop();
    }
}

/* 求解子集和 I（包含重复子集） */
fn subset_sum_i_naive(nums: &[i32], target: i32) -> Vec<Vec<i32>> {
    let state = Vec::new(); // 状态（子集）
    let total = 0; // 子集和
    let mut res = Vec::new(); // 结果列表（子集列表）
    backtrack(state, target, total, nums, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i_naive(&nums, target);

    println!("输入数组 nums = {:?}, target = {}", &nums, target);
    println!("所有和等于 {} 的子集 res = {:?}", target, &res);
    println!("请注意，该方法输出的结果包含重复集合");
}
