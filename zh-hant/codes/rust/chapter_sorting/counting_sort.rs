/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 計數排序 */
// 簡易實作，無法用來將物件排序
fn counting_sort_naive(nums: &mut [i32]) {
    // 1. 找出陣列中的最大元素 m
    let m = *nums.iter().max().unwrap();
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. 走訪 counter，將各元素填入原陣列 nums
    let mut i = 0;
    for num in 0..m + 1 {
        for _ in 0..counter[num as usize] {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 計數排序 */
// 完整實作，可將物件排序，且屬於穩定排序
fn counting_sort(nums: &mut [i32]) {
    // 1. 找出陣列中的最大元素 m
    let m = *nums.iter().max().unwrap() as usize;
    // 2. 統計各數字出現的次數
    // counter[num] 代表 num 出現的次數
    let mut counter = vec![0; m + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. 計算 counter 的前綴和，將「出現次數」轉為「結尾索引」
    // 也就是說，counter[num]-1 是 num 在 res 中最後一次出現的索引
    for i in 0..m {
        counter[i + 1] += counter[i];
    }
    // 4. 反向走訪 nums，將各元素填入結果陣列 res
    // 初始化陣列 res，用來記錄結果
    let n = nums.len();
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let num = nums[i];
        res[counter[num as usize] - 1] = num; // 將 num 放到對應索引的位置
        counter[num as usize] -= 1; // 將前綴和減 1，取得下次放置 num 時所需的索引
    }
    // 用結果陣列 res 覆寫原陣列 nums
    nums.copy_from_slice(&res)
}

/* 主程式 */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    print!("計數排序（無法將物件排序）完成後 nums = ");
    print_util::print_array(&nums);

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    print!("\n計數排序完成後 nums1 = ");
    print_util::print_array(&nums1);
}
