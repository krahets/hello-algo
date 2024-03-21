/*
 * File: subset_sum_ii.rs
 * Created Time: 2023-07-09
 * Author: codingonion (coderonion@gmail.com)
 */

/* 回溯演算法：子集和 II */
fn backtrack(
    mut state: Vec<i32>,
    target: i32,
    choices: &[i32],
    start: usize,
    res: &mut Vec<Vec<i32>>,
) {
    // 子集和等於 target 時，記錄解
    if target == 0 {
        res.push(state);
        return;
    }
    // 走訪所有選擇
    // 剪枝二：從 start 開始走訪，避免生成重複子集
    // 剪枝三：從 start 開始走訪，避免重複選擇同一元素
    for i in start..choices.len() {
        // 剪枝一：若子集和超過 target ，則直接結束迴圈
        // 這是因為陣列已排序，後邊元素更大，子集和一定超過 target
        if target - choices[i] < 0 {
            break;
        }
        // 剪枝四：如果該元素與左邊元素相等，說明該搜尋分支重複，直接跳過
        if i > start && choices[i] == choices[i - 1] {
            continue;
        }
        // 嘗試：做出選擇，更新 target, start
        state.push(choices[i]);
        // 進行下一輪選擇
        backtrack(state.clone(), target - choices[i], choices, i, res);
        // 回退：撤銷選擇，恢復到之前的狀態
        state.pop();
    }
}

/* 求解子集和 II */
fn subset_sum_ii(nums: &mut [i32], target: i32) -> Vec<Vec<i32>> {
    let state = Vec::new(); // 狀態（子集）
    nums.sort(); // 對 nums 進行排序
    let start = 0; // 走訪起始點
    let mut res = Vec::new(); // 結果串列（子集串列）
    backtrack(state, target, nums, start, &mut res);
    res
}

/* Driver Code */
pub fn main() {
    let mut nums = [4, 4, 5];
    let target = 9;

    let res = subset_sum_ii(&mut nums, target);

    println!("輸入陣列 nums = {:?}, target = {}", &nums, target);
    println!("所有和等於 {} 的子集 res = {:?}", target, &res);
}
