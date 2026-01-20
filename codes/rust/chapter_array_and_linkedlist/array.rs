/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use rand::Rng;

/* 随机访问元素 */
fn random_access(nums: &[i32]) -> i32 {
    // 在区间 [0, nums.len()) 中随机抽取一个数字
    let random_index = rand::rng().random_range(0..nums.len());
    // 获取并返回随机元素
    nums[random_index]
}

/* 扩展数组长度 */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // 初始化一个扩展长度后的数组
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // 将原数组中的所有元素复制到新
    res[0..nums.len()].copy_from_slice(nums);

    // 返回扩展后的新数组
    res
}

/* 在数组的索引 index 处插入元素 num */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // 把索引 index 以及之后的所有元素向后移动一位
    for i in ((index + 1)..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num;
}

/* 删除索引 index 处的元素 */
fn remove(nums: &mut [i32], index: usize) {
    // 把索引 index 之后的所有元素向前移动一位
    for i in index..(nums.len() - 1) {
        nums[i] = nums[i + 1];
    }
}

/* 遍历数组 */
#[allow(unused)]
#[allow(clippy::needless_range_loop)]
fn traverse(nums: &[i32]) {
    let mut count = 0;
    // 通过索引遍历数组
    for i in 0..nums.len() {
        count += nums[i];
    }
    // 直接遍历数组元素
    count = 0;
    for &num in nums {
        count += num;
    }
}

/* 在数组中查找指定元素 */
#[allow(clippy::manual_find)]
#[allow(clippy::needless_range_loop)]
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* Driver Code */
fn main() {
    /* 初始化数组 */
    let arr: [i32; 5] = [0; 5];
    println!("数组 arr = {arr:?}");
    // 在 Rust 中，指定长度时（[i32; 5]）为数组，不指定长度时（&[i32]）为切片
    // 由于 Rust 的数组被设计为在编译期确定长度，因此只能使用常量来指定长度
    // Vector 是 Rust 一般情况下用作动态数组的类型
    // 为了方便实现扩容 extend() 方法，以下将 vector 看作数组（array）
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    println!("数组 nums = {nums:?}");

    // 随机访问
    let random_num = random_access(&nums);
    println!("在 nums 中获取随机元素 {random_num}");

    // 长度扩展
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("将数组长度扩展至 8 ，得到 nums = {nums:?}");

    // 插入元素
    insert(&mut nums, 6, 3);
    println!("在索引 3 处插入数字 6 ，得到 nums = {nums:?}");

    // 删除元素
    remove(&mut nums, 2);
    println!("删除索引 2 处的元素，得到 nums = {nums:?}");

    // 遍历数组
    traverse(&nums);

    // 查找元素
    let index = find(&nums, 3).unwrap();
    println!("在 nums 中查找元素 3 ，得到索引 = {index}");
}
