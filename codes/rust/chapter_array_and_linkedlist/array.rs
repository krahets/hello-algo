/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use rand::Rng;

/* 随机访问元素 */
fn random_access(nums: &[i32]) -> i32 {
    // 在区间 [0, nums.len()) 中随机抽取一个数字
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // 获取并返回随机元素
    let random_num = nums[random_index];
    random_num
}

/* 扩展数组长度 */
fn extend(nums: Vec<i32>, enlarge: usize) -> Vec<i32> {
    // 初始化一个扩展长度后的数组
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // 将原数组中的所有元素复制到新
    for i in 0..nums.len() {
        res[i] = nums[i];
    }
    // 返回扩展后的新数组
    res
}

/* 在数组的索引 index 处插入元素 num */
fn insert(nums: &mut Vec<i32>, num: i32, index: usize) {
    // 把索引 index 以及之后的所有元素向后移动一位
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // 将 num 赋给 index 处的元素
    nums[index] = num;
}

/* 删除索引 index 处的元素 */
fn remove(nums: &mut Vec<i32>, index: usize) {
    // 把索引 index 之后的所有元素向前移动一位
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* 遍历数组 */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // 通过索引遍历数组
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 直接遍历数组元素
    for num in nums {
        _count += num;
    }
}

/* 在数组中查找指定元素 */
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
    let arr = [0; 5];
    print!("数组 arr = ");
    print_util::print_array(&arr);
    // 在 Rust 中，指定长度时（[i32; 5]）为数组
    // 由于 Rust 的数组被设计为在编译期确定长度，因此只能使用常量来指定长度
    // 为了方便实现扩容 extend() 方法，以下将(Vec) 看作数组（Array）也是rust一般情况下使用动态数组的类型
    let nums = vec![1, 3, 2, 5, 4];
    print!("\n数组 nums = ");
    print_util::print_array(&nums);

    // 随机访问
    let random_num = random_access(&nums);
    println!("\n在 nums 中获取随机元素 {}", random_num);

    // 长度扩展
    let mut nums = extend(nums, 3);
    print!("将数组长度扩展至 8 ，得到 nums = ");
    print_util::print_array(&nums);

    // 插入元素
    insert(&mut nums, 6, 3);
    print!("\n在索引 3 处插入数字 6 ，得到 nums = ");
    print_util::print_array(&nums);

    // 删除元素
    remove(&mut nums, 2);
    print!("\n删除索引 2 处的元素，得到 nums = ");
    print_util::print_array(&nums);

    // 遍历数组
    traverse(&nums);

    // 查找元素
    let index = find(&nums, 3).unwrap();
    println!("\n在 nums 中查找元素 3 ，得到索引 = {}", index);
}
