/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* 回溯算法：全排列 II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 当状态长度等于元素数量时，记录解
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // 遍历所有选择
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // 剪枝：不允许重复选择元素 且 不允许重复选择相等元素
        if !selected[i] && !duplicated.contains(&choice) {
            // 尝试：做出选择，更新状态
            duplicated.insert(choice); // 记录选择过的元素值
            selected[i] = true;
            state.push(choice);
            // 进行下一轮选择
            backtrack(state.clone(), choices, selected, res);
            // 回退：撤销选择，恢复到之前的状态
            selected[i] = false;
            state.remove(state.len() - 1);
        }
    }
}

/* 全排列 II */
fn permutations_ii(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new();
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [1, 2, 2];

    let res = permutations_ii(&mut nums);

    println!("输入数组 nums = {:?}", &nums);
    println!("所有排列 res = {:?}", &res);
}
