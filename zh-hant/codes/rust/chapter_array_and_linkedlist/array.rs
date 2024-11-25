/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* 隨機訪問元素 */
fn random_access(nums: &[i32]) -> i32 {
    // 在區間 [0, nums.len()) 中隨機抽取一個數字
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // 獲取並返回隨機元素
    let random_num = nums[random_index];
    random_num
}

/* 擴展陣列長度 */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // 初始化一個擴展長度後的陣列
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // 將原陣列中的所有元素複製到新
    for i in 0..nums.len() {
        res[i] = nums[i];
    }
    // 返回擴展後的新陣列
    res
}

/* 在陣列的索引 index 處插入元素 num */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // 把索引 index 以及之後的所有元素向後移動一位
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // 將 num 賦給 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
fn remove(nums: &mut [i32], index: usize) {
    // 把索引 index 之後的所有元素向前移動一位
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // 透過索引走訪陣列
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 直接走訪陣列元素
    for num in nums {
        _count += num;
    }
}

/* 在陣列中查詢指定元素 */
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
    /* 初始化陣列 */
    let arr: [i32; 5] = [0; 5];
    print!("陣列 arr = ");
    print_util::print_array(&arr);
    // 在 Rust 中，指定長度時（[i32; 5]）為陣列，不指定長度時（&[i32]）為切片
    // 由於 Rust 的陣列被設計為在編譯期確定長度，因此只能使用常數來指定長度
    // Vector 是 Rust 一般情況下用作動態陣列的型別
    // 為了方便實現擴容 extend() 方法，以下將 vector 看作陣列（array）
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\n陣列 nums = ");
    print_util::print_array(&nums);

    // 隨機訪問
    let random_num = random_access(&nums);
    println!("\n在 nums 中獲取隨機元素 {}", random_num);

    // 長度擴展
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("將陣列長度擴展至 8 ，得到 nums = ");
    print_util::print_array(&nums);

    // 插入元素
    insert(&mut nums, 6, 3);
    print!("\n在索引 3 處插入數字 6 ，得到 nums = ");
    print_util::print_array(&nums);

    // 刪除元素
    remove(&mut nums, 2);
    print!("\n刪除索引 2 處的元素，得到 nums = ");
    print_util::print_array(&nums);

    // 走訪陣列
    traverse(&nums);

    // 查詢元素
    let index = find(&nums, 3).unwrap();
    println!("\n在 nums 中查詢元素 3 ，得到索引 = {}", index);
}
