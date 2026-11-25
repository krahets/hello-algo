/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 取得元素 num 的第 k 位數字，其中 exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // 傳入 exp 而非 k，可避免在此重複執行成本較高的次方運算
    return ((num / exp) % 10) as usize;
}

/* 計數排序（依 nums 中各元素的第 k 位數字排序） */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 十進位的每個數位介於 0~9 之間，因此需要長度為 10 的桶陣列
    let mut counter = [0; 10];
    let n = nums.len();
    // 統計 0~9 各數字出現的次數
    for i in 0..n {
        let d = digit(nums[i], exp); // 取得 nums[i] 的第 k 位數字，記為 d
        counter[d] += 1; // 統計數字 d 出現的次數
    }
    // 計算前綴和，將「出現次數」轉為「陣列索引」
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 反向走訪，依桶內的統計結果將各元素填入 res
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // 取得 d 在陣列中的索引 j
        res[j] = nums[i]; // 將目前的元素填入索引 j 的位置
        counter[d] -= 1; // 將 d 的數量減 1
    }
    // 用結果覆寫原陣列 nums
    nums.copy_from_slice(&res);
}

/* 基數排序 */
fn radix_sort(nums: &mut [i32]) {
    // 取得陣列中的最大元素，用來判斷最多有幾位數
    let m = *nums.into_iter().max().unwrap();
    // 依序從最低位走訪到最高位
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* 主程式 */
fn main() {
    // 基數排序
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("基數排序完成後 nums = ");
    print_util::print_array(&nums);
}
