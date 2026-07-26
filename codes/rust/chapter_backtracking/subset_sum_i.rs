/*
 * File: subset_sum_i.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯算法：子集和 I */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // 子集和等于 target 时，记录解
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // 遍历所有选择
    // 剪枝二：从 start 开始遍历，避免生成重复子集
    for i in start..choices.len() {
        // 剪枝一：若子集和超过 target ，则直接结束循环
        // 这是因为数组已排序，后边元素更大，子集和一定超过 target
        if target - choices[i] < 0 {
            break;
        }
        // 尝试：做出选择，更新 target, start
        state.push(choices[i]);
        // 进行下一轮选择
        backtrack(state, target - choices[i], choices, i, res);
        // 回退：撤销选择，恢复到之前的状态
        state.pop();
    }
}

/* 求解子集和 I */
pub fn subset_sum_i(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    // 状态（子集）
    let mut state = Vec::new();
    // 对 nums 进行排序
    nums.sort();
    // 遍历起始点
    let start = 0;
    // 结果列表（子集列表）
    let mut res = Vec::new();
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* Driver Code */
fn main() {
    let mut nums = [3, 4, 5];
    let target = 9;

    let res = subset_sum_i(&mut nums, target);

    println!("输入数组 nums = {nums:?}, target = {target}");
    println!("所有和等于 {target} 的子集 res = {res:?}");
}
