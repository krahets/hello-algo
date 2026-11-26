/*
 * File: permutations_i.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯演算法：全排列 I */
fn backtrack(mut state: Vec<i32>, choices: &[i32], selected: &mut [bool], res: &mut Vec<Vec<i32>>) {
    // 當狀態長度等於元素個數時，記錄此解
    if state.len() == choices.len() {
        res.push(state);
        return;
    }
    // 逐一檢查所有選項
    for i in 0..choices.len() {
        let choice = choices[i];
        // 剪枝：不可重複選取同一個元素
        if !selected[i] {
            // 嘗試：做出選擇並更新狀態
            selected[i] = true;
            state.push(choice);
            // 進入下一輪選擇
            backtrack(state.clone(), choices, selected, res);
            // 回溯：撤銷選擇，還原先前的狀態
            selected[i] = false;
            state.pop();
        }
    }
}

/* 全排列 I */
fn permutations_i(nums: &mut [i32]) -> Vec<Vec<i32>> {
    let mut res = Vec::new(); // 狀態（子集）
    backtrack(Vec::new(), nums, &mut vec![false; nums.len()], &mut res);
    res
}

/* 主程式 */
pub fn main() {
    let mut nums = [1, 2, 3];

    let res = permutations_i(&mut nums);

    println!("輸入陣列 nums = {:?}", &nums);
    println!("所有排列 res = {:?}", &res);
}
