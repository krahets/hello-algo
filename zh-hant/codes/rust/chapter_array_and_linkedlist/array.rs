/*
 * File: array.rs
 * Created Time: 2023-01-15
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use rand::Rng;

/* 隨機存取元素 */
fn random_access(nums: &[i32]) -> i32 {
    // 從區間 [0, nums.len()) 隨機選取一個數
    let random_index = rand::thread_rng().gen_range(0..nums.len());
    // 取得並回傳隨機選出的元素
    let random_num = nums[random_index];
    random_num
}

/* 增加陣列長度 */
fn extend(nums: &[i32], enlarge: usize) -> Vec<i32> {
    // 初始化加長後的陣列
    let mut res: Vec<i32> = vec![0; nums.len() + enlarge];
    // 將原陣列的所有元素複製到新陣列
    res[0..nums.len()].copy_from_slice(nums);

    // 回傳加長後的新陣列
    res
}

/* 在陣列的索引 index 處插入元素 num */
fn insert(nums: &mut [i32], num: i32, index: usize) {
    // 將索引 index 起的所有元素往後移一格
    for i in (index + 1..nums.len()).rev() {
        nums[i] = nums[i - 1];
    }
    // 將 num 指派給索引 index 處的元素
    nums[index] = num;
}

/* 刪除索引 index 處的元素 */
fn remove(nums: &mut [i32], index: usize) {
    // 將索引 index 之後的所有元素往前移一格
    for i in index..nums.len() - 1 {
        nums[i] = nums[i + 1];
    }
}

/* 走訪陣列 */
fn traverse(nums: &[i32]) {
    let mut _count = 0;
    // 依索引走訪陣列
    for i in 0..nums.len() {
        _count += nums[i];
    }
    // 直接走訪陣列中的元素
    _count = 0;
    for &num in nums {
        _count += num;
    }
}

/* 在陣列中尋找指定元素 */
fn find(nums: &[i32], target: i32) -> Option<usize> {
    for i in 0..nums.len() {
        if nums[i] == target {
            return Some(i);
        }
    }
    None
}

/* 範例主程式 */
fn main() {
    /* 初始化陣列 */
    let arr: [i32; 5] = [0; 5];
    print!("陣列 arr = ");
    print_util::print_array(&arr);
    // 在 Rust 中，指定長度時（[i32; 5]）是陣列，未指定長度時（&[i32]）是切片
    // Rust 陣列的長度必須在編譯時確定，因此只能用常數指定長度
    // Rust 通常使用 Vector 型別來表示動態陣列
    // 為了方便實作擴充容量的 extend() 方法，以下將 vector 視為陣列（array）
    let nums: Vec<i32> = vec![1, 3, 2, 5, 4];
    print!("\n陣列 nums = ");
    print_util::print_array(&nums);

    // 隨機存取
    let random_num = random_access(&nums);
    println!("\n從 nums 隨機取得的元素為 {}", random_num);

    // 增加長度
    let mut nums: Vec<i32> = extend(&nums, 3);
    print!("將陣列長度增加至 8，得到 nums = ");
    print_util::print_array(&nums);

    // 插入元素
    insert(&mut nums, 6, 3);
    print!("\n在索引 3 處插入數字 6，得到 nums = ");
    print_util::print_array(&nums);

    // 刪除元素
    remove(&mut nums, 2);
    print!("\n刪除索引 2 處的元素，得到 nums = ");
    print_util::print_array(&nums);

    // 走訪陣列
    traverse(&nums);

    // 尋找元素
    let index = find(&nums, 3).unwrap();
    println!("\n在 nums 中尋找元素 3，得到索引 = {}", index);
}
