/*
 * File: recursion.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* 再帰 */
fn recur(n: i32) -> i32 {
    // 終了条件
    if n == 1 {
        return 1;
    }
    // 行き：再帰呼び出し
    let res = recur(n - 1);
    // 帰り：結果を返す
    n + res
}

/* 反復で再帰を模擬 */
fn for_loop_recur(n: i32) -> i32 {
    // 明示的なスタックでシステムの呼び出しスタックを模擬
    let mut stack = Vec::new();
    let mut res = 0;
    // 行き：再帰呼び出し
    for i in (1..=n).rev() {
        // プッシュで「行き」を模擬
        stack.push(i);
    }
    // 帰り：結果を返す
    while !stack.is_empty() {
        // ポップで「帰り」を模擬
        res += stack.pop().unwrap();
    }
    // res = 1+2+3+...+n
    res
}

/* 末尾再帰 */
fn tail_recur(n: i32, res: i32) -> i32 {
    // 終了条件
    if n == 0 {
        return res;
    }
    // 末尾再帰呼び出し
    tail_recur(n - 1, res + n)
}

/* フィボナッチ数列：再帰 */
fn fib(n: i32) -> i32 {
    // 終了条件 f(1) = 0, f(2) = 1
    if n == 1 || n == 2 {
        return n - 1;
    }
    // 再帰呼び出し f(n) = f(n-1) + f(n-2)
    let res = fib(n - 1) + fib(n - 2);
    // 結果を返す
    res
}

/* 実行例 */
fn main() {
    let n = 5;
    let mut res;

    res = recur(n);
    println!("\n再帰関数による総和 res = {res}");

    res = for_loop_recur(n);
    println!("\n反復で再帰を模擬して求めた総和 res = {res}");

    res = tail_recur(n, 0);
    println!("\n末尾再帰関数による総和 res = {res}");

    res = fib(n);
    println!("\nフィボナッチ数列の第 {n} 項は {res}");
}
