/*
 * File: binary_search_edge.rs
 * Created Time: 2023-08-30
 * Author: night-cruise (2586447362@qq.com)
 */

/* 二分查找最左一个 target */
pub fn binary_search_left_edge(nums: &[i32], target: i32) -> i32 {
    // 等价于查找 target 的插入点
    let i = binary_search_insertion(nums, target);
    // 未找到 target ，返回 -1
    if i == nums.len() as i32 || nums[i as usize] != target {
        return -1;
    }
    // 找到 target ，返回索引 i
    i
}

/* 二分查找最右一个 target */
pub fn binary_search_right_edge(nums: &[i32], target: i32) -> i32 {
    // 转化为查找最左一个 target + 1
    let i = binary_search_insertion(nums, target + 1);
    // j 指向最右一个 target ，i 指向首个大于 target 的元素
    let j = i - 1;
    // 未找到 target ，返回 -1
    if j == -1 || nums[j as usize] != target {
        return -1;
    }
    // 找到 target ，返回索引 j
    j
}

// 在之前的代码里，这个函数导入自 binary_search_insertion.rs 文件。
// 然而，binary_search_insertion.rs 是一个 bin crate，不应被当作
// 模块使用，这是一种不良实践。为了方便起见，我们将该函数直接复制过来。
fn binary_search_insertion(nums: &[i32], target: i32) -> i32 {
    let (mut i, mut j) = (0, nums.len() as i32 - 1); // 初始化双闭区间 [0, n-1]
    while i <= j {
        let m = i + (j - i) / 2;
        if nums[m as usize] < target {
            i = m + 1;
        } else if nums[m as usize] > target {
            j = m - 1;
        } else {
            j = m - 1;
        }
    }
    i
}

/* Driver Code */
fn main() {
    // 包含重复元素的数组
    let nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
    println!("\n数组 nums = {:?}", nums);

    // 二分查找左边界和右边界
    for target in [6, 7] {
        let index = binary_search_left_edge(&nums, target);
        println!("最左一个元素 {} 的索引为 {}", target, index);
        let index = binary_search_right_edge(&nums, target);
        println!("最右一个元素 {} 的索引为 {}", target, index);
    }
}
