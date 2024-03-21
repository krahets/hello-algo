/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯演算法：全排列 I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 當狀態長度等於元素數量時，記錄解
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // 走訪所有選擇
    for i in 0..choices.len() {
        let choice = choices[i];
        // 剪枝：不允許重複選擇元素
        if !selected[i] {
            // 嘗試：做出選擇，更新狀態
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

/* 全排列 I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // 狀態（子集）
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("輸入陣列 nums = {:?}", &nums);
    println!("所有排列 res = {:?}", &res);
}
