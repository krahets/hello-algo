/*
 * File: recursion.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* 遞迴 */
fn recur(n: i32) -> i32 {
    // 終止條件
    if n == 1 {
        return 1;
    }
    // 遞：遞迴呼叫
    let res = recur(n - 1);
    // 迴：回傳結果
    n + res
}

/* 以迭代模擬遞迴 */
fn for_loop_recur(n: i32) -> i32 {
    // 自行建立堆疊，模擬系統的呼叫堆疊
    let mut stack = Vec::new();
    let mut res = 0;
    // 遞：遞迴呼叫
    for i in (1..=n).rev() {
        // 以「推入堆疊」模擬「遞」
        stack.push(i);
    }
    // 迴：回傳結果
    while !stack.is_empty() {
        // 以「彈出堆疊」模擬「迴」
        res += stack.pop().unwrap();
    }
    // res = 1+2+3+...+n
    res
}

/* 尾端遞迴 */
fn tail_recur(n: i32, res: i32) -> i32 {
    // 終止條件
    if n == 0 {
        return res;
    }
    // 尾端遞迴呼叫
    tail_recur(n - 1, res + n)
}

/* 費氏數列：遞迴 */
fn fib(n: i32) -> i32 {
    // 終止條件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1;
    }
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2);
    // 回傳結果
    res
}

/* 主程式 */
fn main() {
    let n = 5;
    let mut res;

    res = recur(n);
    println!("\n遞迴函式的總和 res = {res}");

    res = for_loop_recur(n);
    println!("\n以迭代模擬遞迴的總和 res = {res}");

    res = tail_recur(n, 0);
    println!("\n尾端遞迴函式總和 res = {res}");

    res = fib(n);
    println!("\n費氏數列的第 {n} 項為 {res}");
}
