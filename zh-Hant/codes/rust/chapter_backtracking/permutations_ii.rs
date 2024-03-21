/*
 * File: permutations_ii.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

use std::collections::HashSet;

/* 回溯演算法：全排列 II */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 當狀態長度等於元素數量時，記錄解
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // 走訪所有選擇
    let mut duplicated = HashSet::<i32>::new();
    for i in 0..choices.len() {
        let choice = choices[i];
        // 剪枝：不允許重複選擇元素 且 不允許重複選擇相等元素
        if !selected[i] && !duplicated.contains(&choice) {
            // 嘗試：做出選擇，更新狀態
            duplicated.insert(choice); // 記錄選擇過的元素值
            selected[i] = true;
            state.push(choice);
            // 進行下一輪選擇
            backtrack(state.clone(), choices, selected, res);
            // 回退：撤銷選擇，恢復到之前的狀態
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

    println!("輸入陣列 nums = {:?}", &nums);
    println!("所有排列 res = {:?}", &res);
}
