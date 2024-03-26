/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* 常数阶 */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* 线性阶 */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* 线性阶（遍历数组） */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // 循环次数与数组长度成正比
    for _ in nums {
        count += 1;
    }
    count
}

/* 平方阶 */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // 循环次数与数据大小 n 成平方关系
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* 平方阶（冒泡排序） */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // 计数器

    // 外循环：未排序区间为 [0, i]
    for i in (1..nums.len()).rev() {
        // 内循环：将未排序区间 [0, i] 中的最大元素交换至该区间的最右端
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // 交换 nums[j] 与 nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // 元素交换包含 3 个单元操作
            }
        }
    }
    count
}

/* 指数阶（循环实现） */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // 细胞每轮一分为二，形成数列 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* 指数阶（递归实现） */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* 对数阶（循环实现） */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* 对数阶（递归实现） */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* 线性对数阶 */
fn linear_log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 1;
    }
    let mut count = linear_log_recur(n / 2) + linear_log_recur(n / 2);
    for _ in 0..n as i32 {
        count += 1;
    }
    return count;
}

/* 阶乘阶（递归实现） */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // 从 1 个分裂出 n 个
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* Driver Code */
fn main() {
    // 可以修改 n 运行，体会一下各种复杂度的操作数量变化趋势
    let n: i32 = 8;
    println!("输入数据大小 n = {}", n);

    let mut count = constant(n);
    println!("常数阶的操作数量 = {}", count);

    count = linear(n);
    println!("线性阶的操作数量 = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("线性阶（遍历数组）的操作数量 = {}", count);

    count = quadratic(n);
    println!("平方阶的操作数量 = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("平方阶（冒泡排序）的操作数量 = {}", count);

    count = exponential(n);
    println!("指数阶（循环实现）的操作数量 = {}", count);
    count = exp_recur(n);
    println!("指数阶（递归实现）的操作数量 = {}", count);

    count = logarithmic(n);
    println!("对数阶（循环实现）的操作数量 = {}", count);
    count = log_recur(n);
    println!("对数阶（递归实现）的操作数量 = {}", count);

    count = linear_log_recur(n);
    println!("线性对数阶（递归实现）的操作数量 = {}", count);

    count = factorial_recur(n);
    println!("阶乘阶（递归实现）的操作数量 = {}", count);
}
