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

/* Linear complexity (array traversal) */
fn array_traversal(nums: &[i32]) -> i32 {
    let mut count = 0;
    // The number of iterations is proportional to the array length
    for _ in nums {
        count += 1;
    }
    count
}

/* Quadratic complexity */
fn quadratic(n: i32) -> i32 {
    let mut count = 0;
    // The number of iterations is proportional to the square of the input size n
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

    // Outer loop: the unsorted range is [0, i]
    for i in (1..nums.len()).rev() {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
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

/* Exponential complexity (iterative implementation) */
fn exponential(n: i32) -> i32 {
    let mut count = 0;
    let mut base = 1;
    // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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

/* Logarithmic complexity (iterative implementation) */
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

/* Linearithmic complexity */
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

/* Factorial complexity (recursive implementation) */
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

/* Driver code */
fn main() {
    // Try different values of n to see how the operation count grows for each complexity
    let n: i32 = 8;
    println!("Input size n = {}", n);

    let mut count = constant(n);
    println!("Operation count for constant time = {}", count);

    count = linear(n);
    println!("Operation count for linear time = {}", count);
    count = array_traversal(&vec![0; n as usize]);
    println!("Operation count for linear time (array traversal) = {}", count);

    count = quadratic(n);
    println!("Operation count for quadratic time = {}", count);
    let mut nums = (1..=n).rev().collect::<Vec<_>>(); // [n,n-1,...,2,1]
    count = bubble_sort(&mut nums);
    println!("Operation count for quadratic time (bubble sort) = {}", count);

    count = exponential(n);
    println!("Operation count for exponential time (iteration) = {}", count);
    count = exp_recur(n);
    println!("Operation count for exponential time (recursion) = {}", count);

    count = logarithmic(n);
    println!("Operation count for logarithmic time (iteration) = {}", count);
    count = log_recur(n);
    println!("Operation count for logarithmic time (recursion) = {}", count);

    count = linear_log_recur(n);
    println!("Operation count for linearithmic time (recursion) = {}", count);

    count = factorial_recur(n);
    println!("Operation count for factorial time (recursion) = {}", count);
}
