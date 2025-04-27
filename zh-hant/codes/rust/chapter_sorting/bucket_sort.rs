/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

/* 桶排序 */
fn bucket_sort(nums: &mut [f64]) {
    // 初始化 k = n/2 個桶，預期向每個桶分配 2 個元素
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. 將陣列元素分配到各個桶中
    for &num in nums.iter() {
        // 輸入資料範圍為 [0, 1)，使用 num * k 對映到索引範圍 [0, k-1]
        let i = (num * k as f64) as usize;
        // 將 num 新增進桶 i
        buckets[i].push(num);
    }
    // 2. 對各個桶執行排序
    for bucket in &mut buckets {
        // 使用內建排序函式，也可以替換成其他排序演算法
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. 走訪桶合併結果
    let mut i = 0;
    for bucket in buckets.iter() {
        for &num in bucket.iter() {
            nums[i] = num;
            i += 1;
        }
    }
}

/* Driver Code */
fn main() {
    // 設輸入資料為浮點數，範圍為 [0, 1)
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("桶排序完成後 nums = ");
    print_util::print_array(&nums);
}
