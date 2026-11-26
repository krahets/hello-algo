/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* 常數階 */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* 線性階 */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* 線性階（走訪陣列） */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // 迴圈次數與陣列長度成正比
    for _ in nums {
        count += 1;
    }
    count
}

/* 平方階 */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // 迴圈次數正比於資料大小 n 的平方
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* 平方階（氣泡排序） */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // 計數器

    // 外層迴圈：未排序區間為 [0, i]
    for i in (1..nums.len()).rev() {
        // 內層迴圈：藉由交換，將未排序區間 [0, i] 的最大元素移至最右端
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交換 nums[j] 與 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 交換元素需 3 個基本操作
            }
        }
    }
    count
}

/* 指數階（迴圈實作） */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // 細胞每輪一分為二，形成數列 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* 指數階（遞迴實作） */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* 對數階（迴圈實作） */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* 對數階（遞迴實作） */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* 線性對數階 */
fn linear_log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 1;
    }
    let mut count = linear_log_recur(n / 2) + linear_log_recur(n / 2);
    for _ in 0..n {
        count += 1;
    }
    return count;
}

/* 階乘階（遞迴實作） */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // 1 個呼叫分為 n 個
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* 主程式 */
fn main() {
    // 試著修改 n 再執行，觀察各種複雜度的操作次數如何變化
    let n: i32 = 8;
    println!("輸入規模 n = {}", n);

    let mut count = constant(n);
    println!("常數階的操作次數 = {}", count);

    count = linear(n);
    println!("線性階的操作次數 = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("線性階（走訪陣列）的操作次數 = {}", count);

    count = quadratic(n);
    println!("平方階的操作次數 = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("平方階（氣泡排序）的操作次數 = {}", count);

    count = exponential(n);
    println!("指數階（迴圈實作）的操作次數 = {}", count);
    count = exp_recur(n);
    println!("指數階（遞迴實作）的操作次數 = {}", count);

    count = logarithmic(n);
    println!("對數階（迴圈實作）的操作次數 = {}", count);
    count = log_recur(n);
    println!("對數階（遞迴實作）的操作次數 = {}", count);

    count = linear_log_recur(n);
    println!("線性對數階（遞迴實作）的操作次數 = {}", count);

    count = factorial_recur(n);
    println!("階乘階（遞迴實作）的操作次數 = {}", count);
}
