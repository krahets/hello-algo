/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* Driver Code */
#[allow(unused)]
#[allow(clippy::needless_range_loop)]
fn main() {
    // 初始化列表
    let mut nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    println!("列表 nums = {nums:?}");

    // 访问元素
    let num = nums[1];
    println!("\n访问索引 1 处的元素，得到 num = {num}");

    // 更新元素
    nums[1] = 0;
    println!("将索引 1 处的元素更新为 0 ，得到 nums = {nums:?}");

    // 清空列表
    nums.clear();
    println!("清空列表后 nums = {nums:?}");

    // 在尾部添加元素
    nums.push(1);
    nums.push(3);
    nums.push(2);
    nums.push(5);
    nums.push(4);
    println!("添加元素后 nums = {nums:?}");

    // 在中间插入元素
    nums.insert(3, 6);
    println!("在索引 3 处插入数字 6 ，得到 nums = {nums:?}");

    // 删除元素
    nums.remove(3);
    println!("删除索引 3 处的元素，得到 nums = {nums:?}");

    // 通过索引遍历列表
    let mut count = 0;
    for i in 0..nums.len() {
        count += nums[i];
    }
    // 直接遍历列表元素
    count = 0;
    for x in &nums {
        count += x;
    }

    // 拼接两个列表
    let mut nums1 = vec![6, 8, 7, 10, 9];
    nums.append(&mut nums1); // append（移动） 之后 nums1 为空！

    // nums.extend(&nums1);   // extend（借用） nums1 能继续使用
    println!("将列表 nums1 拼接到 nums 之后，得到 nums = {nums:?}");

    // 排序列表
    nums.sort();
    println!("排序列表后 nums = {nums:?}");
}
