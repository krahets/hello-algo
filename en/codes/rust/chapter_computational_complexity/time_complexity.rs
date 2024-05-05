/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* Constant complexity */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* Linear complexity */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* Linear complexity (traversing an array) */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // Loop count is proportional to the length of the array
    for _ in nums {
        count += 1;
    }
    count
}

/* Quadratic complexity */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // Loop count is squared in relation to the data size n
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* Quadratic complexity (bubble sort) */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // Counter

    // Outer loop: unsorted range is [0, i]
    for i in (1..nums.len()).rev() {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Element swap includes 3 individual operations
            }
        }
    }
    count
}

/* Exponential complexity (loop implementation) */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* Exponential complexity (recursive implementation) */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* Logarithmic complexity (loop implementation) */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* Logarithmic complexity (recursive implementation) */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* Linear logarithmic complexity */
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

/* Factorial complexity (recursive implementation) */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // From 1 split into n
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* Driver Code */
fn main() {
    // Can modify n to experience the trend of operation count changes under various complexities
    let n: i32 = 8;
    println!("Input data size n = {}", n);

    let mut count = constant(n);
    println!("Number of constant complexity operations = {}", count);

    count = linear(n);
    println!("Number of linear time operations = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("Number of linear time operations (array traversal) = {}", count);

    count = quadratic(n);
    println!("Number of quadratic time operations = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("Number of quadratic time operations (bubble sort) = {}", count);

    count = exponential(n);
    println!("Number of exponential time operations (loop implementation) = {}", count);
    count = exp_recur(n);
    println!("Number of exponential time operations (recursive implementation) = {}", count);

    count = logarithmic(n);
    println!("Number of logarithmic time operations (loop implementation) = {}", count);
    count = log_recur(n);
    println!("Number of logarithmic time operations (recursive implementation) = {}", count);

    count = linear_log_recur(n);
    println!("Number of log-linear time operations (recursive implementation) = {}", count);

    count = factorial_recur(n);
    println!("Number of factorial time operations (recursive implementation) = {}", count);
}
