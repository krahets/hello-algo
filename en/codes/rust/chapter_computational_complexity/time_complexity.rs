/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* Constant order */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* Linear order */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* Linear order (traversing array) */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // Number of iterations is proportional to the array length
    for _ in nums {
        count += 1;
    }
    count
}

/* Exponential order */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // Number of iterations is quadratically related to the data size n
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* Quadratic order (bubble sort) */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // Counter

    // Outer loop: unsorted range is [0, i]
    for i in (1..nums.len()).rev() {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Element swap includes 3 unit operations
            }
        }
    }
    count
}

/* Exponential order (loop implementation) */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* Exponential order (recursive implementation) */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* Logarithmic order (loop implementation) */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* Logarithmic order (recursive implementation) */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* Linearithmic order */
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

/* Factorial order (recursive implementation) */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // Split from 1 into n
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* Driver Code */
fn main() {
    // You can modify n to run and observe the trend of the number of operations for various complexities
    let n: i32 = 8;
    println!("Input data size n = {}", n);

    let mut count = constant(n);
    println!("Constant-time operations count = {}", count);

    count = linear(n);
    println!("Linear-time operations count = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("Linear-time (array traversal) operations count = {}", count);

    count = quadratic(n);
    println!("Quadratic-time operations count = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("Quadratic-time (bubble sort) operations count = {}", count);

    count = exponential(n);
    println!("Exponential-time (iterative) operations count = {}", count);
    count = exp_recur(n);
    println!("Exponential-time (recursive) operations count = {}", count);

    count = logarithmic(n);
    println!("Logarithmic-time (iterative) operations count = {}", count);
    count = log_recur(n);
    println!("Logarithmic-time (recursive) operations count = {}", count);

    count = linear_log_recur(n);
    println!("Linearithmic-time (recursive) operations count = {}", count);

    count = factorial_recur(n);
    println!("Factorial-time (recursive) operations count = {}", count);
}
