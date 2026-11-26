/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* 範例主程式 */
fn main() {
    // 初始化列表
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("列表 nums = ");
    print_util::print_array(&nums);

    // 存取元素
    let num = nums[1];
    println!("\n存取索引 1 處的元素，得到 num = {num}");

    // 更新元素
    nums[1] = 0;
    print!("將索引 1 處的元素更新為 0，得到 nums = ");
    print_util::print_array(&nums);

    // 清空列表
    nums.clear();
    print!("\n清空列表後，nums = ");
    print_util::print_array(&nums);

    // 在尾端加入元素
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\n加入元素後，nums = ");
    print_util::print_array(&nums);

    // 在中間插入元素
    nums.insert(3, 6);
    print!("\n在索引 3 處插入數字 6，得到 nums = ");
    print_util::print_array(&nums);

    // 刪除元素
    nums.remove(3);
    print!("\n刪除索引 3 處的元素，得到 nums = ");
    print_util::print_array(&nums);

    // 依索引走訪列表
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 直接走訪列表中的元素
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // 串接兩個列表
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append（移動）後，nums1 就空了！

    // nums.extend(&nums1);   // extend 採用借用，之後仍可使用 nums1
    print!("\n將列表 nums1 接在 nums 之後，得到 nums = ");
    print_util::print_array(&nums);

    // 排序列表
    nums.sort();
    print!("\n列表排序後，nums = ");
    print_util::print_array(&nums);
}
