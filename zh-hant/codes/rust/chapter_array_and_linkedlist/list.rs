/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;

/* Driver Code */
fn main() {
    // 初始化串列
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("串列 nums = ");
    print_util::print_array(&nums);

    // 訪問元素
    let num = nums[1];
    println!("\n訪問索引 1 處的元素，得到 num = {num}");

    // 更新元素
    nums[1] = 0;
    print!("將索引 1 處的元素更新為 0 ，得到 nums = ");
    print_util::print_array(&nums);

    // 清空串列
    nums.clear();
    print!("\n清空串列後 nums = ");
    print_util::print_array(&nums);

    // 在尾部新增元素
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    print!("\n新增元素後 nums = ");
    print_util::print_array(&nums);

    // 在中間插入元素
    nums.insert(3, 6);
    print!("\n在索引 3 處插入數字 6 ，得到 nums = ");
    print_util::print_array(&nums);

    // 刪除元素
    nums.remove(3);
    print!("\n刪除索引 3 處的元素，得到 nums = ");
    print_util::print_array(&nums);

    // 透過索引走訪串列
    let mut _count = 0;
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 直接走訪串列元素
    _count = 0;
    for x in &nums {
        _count += x;
    }

    // 拼接兩個串列
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append（移動） 之後 nums1 為空！

    // nums.extend(&nums1);   // extend（借用） nums1 能繼續使用
    print!("\n將串列 nums1 拼接到 nums 之後，得到 nums = ");
    print_util::print_array(&nums);

    // 排序串列
    nums.sort();
    print!("\n排序串列後 nums = ");
    print_util::print_array(&nums);
}
