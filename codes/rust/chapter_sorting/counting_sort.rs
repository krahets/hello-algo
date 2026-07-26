/*
 * File: counting_sort.rs
 * Created Time: 2023-07-09
 * Author: night-cruise (2586447362@qq.com)
 */

/* 计数排序 */
// 简单实现，无法用于排序对象
pub fn counting_sort_naive(nums: &mut [u32]) {
    // 1. 统计数组最大元素 m
    let Some(m) = nums.iter().max().copied() else {
        // 数组为空，直接返回
        return;
    };
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    // m 过大会导致内存溢出，即使无限内存，当 m == isize::MAX / size_of::<usize>() 时
    // 也会发生容量溢出；在 64 位平台，这种情况不会发生，但 32 位及以下平台上可能发生。因此，
    // 该实现仅适用于 m 较小的场景。
    let mut counter = vec![0_usize; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. 遍历 counter ，将各元素填入原数组 nums
    let mut i = 0;
    for (num, &count) in counter.iter().enumerate() {
        for _ in 0..count {
            // num 来自合法的 u32 类型，除非当前是 16 位及以下平台（那很罕见了），
            // 以下 cast 总是安全的。
            nums[i] = num as u32;
            i += 1;
        }
    }
}

/* 计数排序 */
// 完整实现，可排序对象，并且是稳定排序
pub fn counting_sort(nums: &mut [u32]) {
    // 1. 统计数组最大元素 m
    let Some(m) = nums.iter().max().copied() else {
        // 数组为空，直接返回
        return;
    };
    // 2. 统计各数字的出现次数
    // counter[num] 代表 num 的出现次数
    // m 过大会导致内存溢出，即使无限内存，当 m == isize::MAX / size_of::<usize>() 时
    // 也会发生容量溢出；在 64 位平台，这种情况不会发生，但 32 位及以下平台上可能发生。因此，
    // 该实现仅适用于 m 较小的场景。
    let mut counter = vec![0; m as usize + 1];
    for &num in nums.iter() {
        counter[num as usize] += 1;
    }
    // 3. 求 counter 的前缀和，将“出现次数”转换为“尾索引”
    // 即 counter[num]-1 是 num 在 res 中最后一次出现的索引
    for i in 0..(m as usize) {
        counter[i + 1] += counter[i];
    }
    // 4. 倒序遍历 nums ，将各元素填入结果数组 res
    // 初始化数组 res 用于记录结果
    let n = nums.len();
    let mut res = vec![0; n];
    // 倒序遍历保证排序稳定性
    for &num in nums.iter().rev() {
        // 将 num 放置到对应索引处
        // 这个减法是安全的，因为 counter[num] 不小于 num 的出现次数，
        let index = counter[num as usize] - 1;
        res[index] = num;
        // 令前缀和自减 1 ，得到下次放置 num 的索引
        // 可令 counter[num as usize] = index，
        // 但为了代码可读性，保持与前缀和的语义一致，
        // 此处使用自减操作
        counter[num as usize] -= 1;
    }
    // 使用结果数组 res 覆盖原数组 nums
    nums.copy_from_slice(&res)
}

/* Driver Code */
fn main() {
    let mut nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort_naive(&mut nums);
    println!("计数排序（无法排序对象）完成后 nums = {nums:?}");

    let mut nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
    counting_sort(&mut nums1);
    println!("计数排序完成后 nums1 = {nums1:?}");
}
