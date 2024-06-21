/*
 * File: bucket_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 桶排序 */
fn bucket_sort(nums: &mut [f64]) {
    // 初始化 k = n/2 个桶，预期向每个桶分配 2 个元素
    let k = nums.len() / 2;
    let mut buckets = vec![vec![]; k];
    // 1. 将数组元素分配到各个桶中
    for &num in nums.iter() {
        // 输入数据范围为 [0, 1)，使用 num * k 映射到索引范围 [0, k-1]
        let i = (num * k as f64) as usize;
        // 将 num 添加进桶 i
        buckets[i].push(num);
    }
    // 2. 对各个桶执行排序
    for bucket in &mut buckets {
        // 使用内置排序函数，也可以替换成其他排序算法
        bucket.sort_by(|a, b| a.partial_cmp(b).unwrap());
    }
    // 3. 遍历桶合并结果
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
    // 设输入数据为浮点数，范围为 [0, 1)
    let mut nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
    bucket_sort(&mut nums);
    print!("桶排序完成后 nums = ");
    print_util::print_array(&nums);
}
