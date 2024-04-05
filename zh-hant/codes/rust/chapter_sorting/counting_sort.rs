/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 計數排序 */
// 簡單實現，無法用於排序物件
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. 統計陣列最大元素 m
    let m = *nums.into_iter().max().unwrap();
    // 2. 統計各數字的出現次數
    // counter[num] 代表 num 的出現次數
    let mut counter = vec![0; m as usize + 1];
    for &num in &*nums {
        counter[num as usize] += 1;
    }
    // 3. 走訪 counter ，將各元素填入原陣列 nums
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 計數排序 */
// 完整實現，可排序物件，並且是穩定排序
fn counting_sort(nums: &mut [i32]) {
    // 1. 統計陣列最大元素 m
    let m = *nums.into_iter().max().unwrap();
    // 2. 統計各數字的出現次數
    // counter[num] 代表 num 的出現次數
    let mut counter = vec![0; m as usize + 1];
    for &num in &*nums {
        counter[num as usize] += 1;
    }
    // 3. 求 counter 的前綴和，將“出現次數”轉換為“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最後一次出現的索引
    for i in 0..m as usize {
        counter[i + 1] += counter[i];
    }
    // 4. 倒序走訪 nums ，將各元素填入結果陣列 res
    // 初始化陣列 res 用於記錄結果
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // 將 num 放置到對應索引處
        counter[num as usize] -= 1; // 令前綴和自減 1 ，得到下次放置 num 的索引
    }
    // 使用結果陣列 res 覆蓋原陣列 nums
    for i in 0..n {
        nums[i] = res[i];
    }
}

/* Driver Code */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("計數排序（無法排序物件）完成後 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\n計數排序完成後 nums1 = ");
    print_util::print_array(&nums1);
}
