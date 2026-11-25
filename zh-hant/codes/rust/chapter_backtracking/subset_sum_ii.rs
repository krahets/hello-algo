/*
 * File: subset_sum_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯演算法：子集和 II */
fn backtrack(
    state: &mut Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // 子集總和達到目標時，記錄此解
    if target == 0 {
        res.push(state.clone());
        return;
    }
    // 逐一檢查所有選項
    // 剪枝二：從 start 開始走訪，避免產生重複子集
    // 剪枝三：從 start 開始走訪，避免重複選取同一個元素
    for i in start..choices.len() {
        // 剪枝一：若候選值超過剩餘目標值 target，結束迴圈
        // 陣列已排序，後面的元素更大，也一定超過剩餘目標值 target
        if target - choices[i] < 0 {
            break;
        }
        // 剪枝四：若本輪已嘗試過左鄰的相等元素，就略過這個重複分支
        if i > start && choices[i] == choices[i - 1] {
            continue;
        }
        // 嘗試：做出選擇，更新 target 和 start
        state.push(choices[i]);
        // 進入下一輪選擇
        backtrack(state, target - choices[i], choices, i + 1, res);
        // 回溯：撤銷選擇，還原先前的狀態
        state.pop();
    }
}

/* 求解子集和 II */
fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let mut state = Vec::new(); // 狀態（子集）
    nums.sort(); // 將 nums 排序
    let start = 0; // 走訪的起點
    let mut res = Vec::new(); // 結果串列（子集串列）
    backtrack(&mut state, target, nums, start, &mut res);
    res
}

/* 主程式 */
pub fn main() {
    let mut nums = [4, 4, 5];
    let target = 9;

    let res = subset_sum_ii(&mut nums, target);

    println!("輸入陣列 nums = {:?}, target = {}", &nums, target);
    println!("總和等於 {} 的所有子集 res = {:?}", target, &res);
}
