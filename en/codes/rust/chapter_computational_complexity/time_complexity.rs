/*
 * File: time_complexity.rs
 * Created Time: 2023-01-10
 * Author: xBLACICEx (xBLACKICEx@outlook.com), codingonion (coderonion@gmail.com)
 */

/* Constant time */
fn constant(n: i32) -> i32 {
    _ = n;
    let mut count = 0;
    let size = 100_000;
    for _ in 0..size {
        count += 1;
    }
    count
}

/* Linear time */
fn linear(n: i32) -> i32 {
    let mut count = 0;
    for _ in 0..n {
        count += 1;
    }
    count
}

/* Linear time (array traversal) */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // The iteration count is proportional to the array length
    for _ in nums {
        count += 1;
    }
    count
}

/* Quadratic time */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // The iteration count grows quadratically with input size n
    for _ in 0..n {
        for _ in 0..n {
            count += 1;
        }
    }
    count
}

/* Quadratic time (bubble sort) */
fn bubble_sort(nums: &mut [i32]) -> i32 {
    let mut count = 0; // Counter

    // Outer loop: the unsorted range is the closed interval [0, i]
    for i in (1..nums.len()).rev() {
        // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
        for j in 0..i {
            if nums[j] > nums[j + 1] {
                // Swap nums[j] and nums[j + 1]
                let tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Swapping two elements takes 3 elementary operations
            }
        }
    }
    count
}

/* Exponential time (iterative) */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    for _ in 0..n {
        for _ in 0..base {
            count += 1
        }
        base *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    count
}

/* Exponential time (recursive) */
fn exp_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    exp_recur(n - 1) + exp_recur(n - 1) + 1
}

/* Logarithmic time (iterative) */
fn logarithmic(mut n: i32) -> i32 {
    let mut count = 0;
    while n > 1 {
        n = n / 2;
        count += 1;
    }
    count
}

/* Logarithmic time (recursive) */
fn log_recur(n: i32) -> i32 {
    if n <= 1 {
        return 0;
    }
    log_recur(n / 2) + 1
}

/* Linearithmic time */
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

/* Factorial time (recursive) */
fn factorial_recur(n: i32) -> i32 {
    if n == 0 {
        return 1;
    }
    let mut count = 0;
    // Split one problem into n subproblems
    for _ in 0..n {
        count += factorial_recur(n - 1);
    }
    count
}

/* Driver Code */
fn main() {
    // Try different values of n to see how the operation count grows for each complexity
    let n: i32 = 8;
    println!("Input size n = {}", n);

    let mut count = constant(n);
    println!("Constant operation count = {}", count);

    count = linear(n);
    println!("Linear operation count = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("Linear operation count (array traversal) = {}", count);

    count = quadratic(n);
    println!("Quadratic operation count = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("Quadratic operation count (bubble sort) = {}", count);

    count = exponential(n);
    println!("Exponential operation count (iterative) = {}", count);
    count = exp_recur(n);
    println!("Exponential operation count (recursive) = {}", count);

    count = logarithmic(n);
    println!("Logarithmic operation count (iterative) = {}", count);
    count = log_recur(n);
    println!("Logarithmic operation count (recursive) = {}", count);

    count = linear_log_recur(n);
    println!("Linearithmic operation count (recursive) = {}", count);

    count = factorial_recur(n);
    println!("Factorial operation count (recursive) = {}", count);
}
