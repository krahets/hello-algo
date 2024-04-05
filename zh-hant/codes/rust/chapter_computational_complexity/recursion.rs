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
    // 迴：返回結果
    n + res
}

/* 使用迭代模擬遞迴 */
fn for_loop_recur(n: i32) -> i32 {
    // 使用一個顯式的堆疊來模擬系統呼叫堆疊
    let mut stack = Vec::new();
    let mut res = 0;
    // 遞：遞迴呼叫
    for i in (1..=n).rev() {
        // 透過“入堆疊操作”模擬“遞”
        stack.push(i);
    }
    // 迴：返回結果
    while !stack.is_empty() {
        // 透過“出堆疊操作”模擬“迴”
        res += stack.pop().unwrap();
    }
    // res = 1+2+3+...+n
    res
}

/* 尾遞迴 */
fn tail_recur(n: i32, res: i32) -> i32 {
    // 終止條件
    if n == 0 {
        return res;
    }
    // 尾遞迴呼叫
    tail_recur(n - 1, res + n)
}

/* 費波那契數列：遞迴 */
fn fib(n: i32) -> i32 {
    // 終止條件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1;
    }
    // 遞迴呼叫 f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2);
    // 返回結果
    res
}

/* Driver Code */
fn main() {
    let n = 5;
    let mut res;

    res = recur(n);
    println!("\n遞迴函式的求和結果 res = {res}");

    res = for_loop_recur(n);
    println!("\n使用迭代模擬遞迴求和結果 res = {res}");

    res = tail_recur(n, 0);
    println!("\n尾遞迴函式的求和結果 res = {res}");

    res = fib(n);
    println!("\n費波那契數列的第 {n} 項為 {res}");
}
