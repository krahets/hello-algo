/*
 * File: recursion.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* 递归 */
fn recur(n: i32) -> i32 {
    // 终止条件
    if n == 1 {
        return 1;
    }
    // 递：递归调用
    let res = recur(n - 1);
    // 归：返回结果
    n + res
}

/* 使用迭代模拟递归 */
fn for_loop_recur(n: i32) -> i32 {
    // 使用一个显式的栈来模拟系统调用栈
    let mut stack = Vec::new();
    let mut res = 0;
    // 递：递归调用
    for i in (1..=n).rev() {
        // 通过“入栈操作”模拟“递”
        stack.push(i);
    }
    // 归：返回结果
    while !stack.is_empty() {
        // 通过“出栈操作”模拟“归”
        res += stack.pop().unwrap();
    }
    // res = 1+2+3+...+n
    res
}

/* 尾递归 */
fn tail_recur(n: i32, res: i32) -> i32 {
    // 终止条件
    if n == 0 {
        return res;
    }
    // 尾递归调用
    tail_recur(n - 1, res + n)
}

/* 斐波那契数列：递归 */
fn fib(n: i32) -> i32 {
    // 终止条件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1;
    }
    // 递归调用 f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2);
    // 返回结果
    res
}

/* Driver Code */
fn main() {
    let n = 5;
    let mut res;

    res = recur(n);
    println!("\n递归函数的求和结果 res = {res}");

    res = for_loop_recur(n);
    println!("\n使用迭代模拟递归求和结果 res = {res}");

    res = tail_recur(n, 0);
    println!("\n尾递归函数的求和结果 res = {res}");

    res = fib(n);
    println!("\n斐波那契数列的第 {n} 项为 {res}");
}
