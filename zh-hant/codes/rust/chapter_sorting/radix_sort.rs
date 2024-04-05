/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 獲取元素 num 的第 k 位，其中 exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // 傳入 exp 而非 k 可以避免在此重複執行昂貴的次方計算
    return ((num / exp) % 10) as usize;
}

/* 計數排序（根據 nums 第 k 位排序） */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 十進位制的位範圍為 0~9 ，因此需要長度為 10 的桶陣列
    let mut counter = [0; 10];
    let n = nums.len();
    // 統計 0~9 各數字的出現次數
    for i in 0..n {
        let d = digit(nums[i], exp); // 獲取 nums[i] 第 k 位，記為 d
        counter[d] += 1; // 統計數字 d 的出現次數
    }
    // 求前綴和，將“出現個數”轉換為“陣列索引”
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 倒序走訪，根據桶內統計結果，將各元素填入 res
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // 獲取 d 在陣列中的索引 j
        res[j] = nums[i]; // 將當前元素填入索引 j
        counter[d] -= 1; // 將 d 的數量減 1
    }
    // 使用結果覆蓋原陣列 nums
    for i in 0..n {
        nums[i] = res[i];
    }
}

/* 基數排序 */
fn radix_sort(nums: &mut [i32]) {
    // 獲取陣列的最大元素，用於判斷最大位數
    let m = *nums.into_iter().max().unwrap();
    // 按照從低位到高位的順序走訪
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* Driver Code */
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
