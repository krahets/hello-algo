/*
 * File: binary_search.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* 二分搜尋（閉區間） */
fn binary_search(nums: &[i32], target: i32) -> i32 {
    // 將閉區間設為 [0, n-1]，i 和 j 分別指向陣列的首、末元素
    let mut i = 0;
    let mut j = nums.len() as i32 - 1;
    // 當搜尋區間為空（i > j）時，結束迴圈
    while i <= j {
        let m = i + (j - i) / 2; // 計算中點索引 m
        if nums[m as usize] < target {
            // 此時 target 若存在，必在區間 [m+1, j] 內
            i = m + 1;
        } else if nums[m as usize] > target {
            // 此時 target 若存在，必在區間 [i, m-1] 內
            j = m - 1;
        } else {
            // 找到目標元素，回傳其索引
            return m;
        }
    }
    // 找不到目標元素，回傳 -1
    return -1;
}

/* 二分搜尋（左閉右開區間） */
fn binary_search_lcro(nums: &[i32], target: i32) -> i32 {
    // 將左閉右開區間設為 [0, n)，i 指向陣列的首元素，j 指向末元素的下一個位置
    let mut i = 0;
    let mut j = nums.len() as i32;
    // 當搜尋區間為空（i = j）時，結束迴圈
    while i < j {
        let m = i + (j - i) / 2; // 計算中點索引 m
        if nums[m as usize] < target {
            // 此時 target 若存在，必在區間 [m+1, j) 內
            i = m + 1;
        } else if nums[m as usize] > target {
            // 此時 target 若存在，必在區間 [i, m) 內
            j = m;
        } else {
            // 找到目標元素，回傳其索引
            return m;
        }
    }
    // 找不到目標元素，回傳 -1
    return -1;
}

/* 主程式 */
pub fn main() {
    let target = 6;
    let nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

    // 二分搜尋（閉區間）
    let mut index = binary_search(&nums, target);
    println!("目標元素 6 的索引 = {index}");

    // 二分搜尋（左閉右開區間）
    index = binary_search_lcro(&nums, target);
    println!("目標元素 6 的索引 = {index}");
}
