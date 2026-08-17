/*
 * File: complexity_exercises.rs
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

/* 迭代求和 */
fn sum_iter(n: i32) -> i32 {
    let mut res = 0;
    for i in 1..=n {
        res += i;
    }
    res
}

/* 递归求和 */
fn sum_recur(n: i32) -> i32 {
    if n == 1 {
        return 1;
    }
    n + sum_recur(n - 1)
}

/* 线性阶循环 */
fn linear_loop(n: i32) -> i32 {
    let mut res = 0;
    for i in 0..n {
        res += i;
    }
    res
}

/* 平方阶循环 */
fn quadratic_loop(n: i32) -> i32 {
    let mut res = 0;
    for i in 0..n {
        for j in i..n {
            res += j;
        }
    }
    res
}

/* 对数阶循环 */
fn logarithmic_loop(mut n: i32) -> i32 {
    while n > 1 {
        n /= 2;
    }
    n
}

fn main() {
    assert_eq!(sum_iter(1), 1);
    assert_eq!(sum_recur(1), 1);
    assert_eq!(sum_iter(4), 10);
    assert_eq!(sum_recur(4), 10);
    assert_eq!(linear_loop(4), 6);
    assert_eq!(quadratic_loop(4), 20);
    assert_eq!(logarithmic_loop(4), 1);
    assert_eq!(logarithmic_loop(5), 1);
}
