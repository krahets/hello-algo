/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 桶排序 */
fn bucket_sort(nums: &mut [f64]) {
    // 初始化 k = n/2 個桶，預期每個桶會分到 2 個元素
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. 將陣列元素分配到各個桶中
    for &num in nums.iter() {
        // 輸入資料的範圍為 [0, 1)，以 num * k 對應到索引範圍 [0, k-1]
        let i = (num * k as f64) as usize;
        // 將 num 加入編號為 i 的桶
        buckets[i].push(num);
    }
    // 2. 分別將每個桶內的元素排序
    for bucket in &mut buckets {
        // 使用內建排序函式，也可以改用其他排序演算法
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. 依序走訪各桶並合併結果
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* 主程式 */
fn main() {
    // 假設輸入資料為浮點數，範圍為 [0, 1)
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("桶排序完成後 nums = ");
    print_util::print_array(&nums);
}
