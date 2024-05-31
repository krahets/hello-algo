/*
 * File: radix_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* 获取元素 num 的第 k 位，其中 exp = 10^(k-1) */
fn digit(num: i32, exp: i32) -> usize {
    // 传入 exp 而非 k 可以避免在此重复执行昂贵的次方计算
    return ((num / exp) % 10) as usize;
}

/* 计数排序（根据 nums 第 k 位排序） */
fn counting_sort_digit(nums: &mut [i32], exp: i32) {
    // 十进制的位范围为 0~9 ，因此需要长度为 10 的桶数组
    let mut counter = [0; 10];
    let n = nums.len();
    // 统计 0~9 各数字的出现次数
    for i in 0..n {
        let d = digit(nums[i], exp); // 获取 nums[i] 第 k 位，记为 d
        counter[d] += 1; // 统计数字 d 的出现次数
    }
    // 求前缀和，将“出现个数”转换为“数组索引”
    for i in 1..10 {
        counter[i] += counter[i - 1];
    }
    // 倒序遍历，根据桶内统计结果，将各元素填入 res
    let mut res = vec![0; n];
    for i in (0..n).rev() {
        let d = digit(nums[i], exp);
        let j = counter[d] - 1; // 获取 d 在数组中的索引 j
        res[j] = nums[i]; // 将当前元素填入索引 j
        counter[d] -= 1; // 将 d 的数量减 1
    }
    // 使用结果覆盖原数组 nums
    nums.copy_from_slice(&res);
}

/* 基数排序 */
fn radix_sort(nums: &mut [i32]) {
    // 获取数组的最大元素，用于判断最大位数
    let m = *nums.into_iter().max().unwrap();
    // 按照从低位到高位的顺序遍历
    let mut exp = 1;
    while exp <= m {
        counting_sort_digit(nums, exp);
        exp *= 10;
    }
}

/* Driver Code */
fn main() {
    // 基数排序
    let mut nums = [
        10546151, 35663510, 42865989, 34862445, 81883077, 88906420, 72429244, 30524779, 82060337,
        63832996,
    ];
    radix_sort(&mut nums);
    print!("基数排序完成后 nums = ");
    print_util::print_array(&nums);
}
