/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for 循环 */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // 循环求和 1, 2, ..., n-1, n
    for i in 1..=n {
        res += i;
    }
    res
}

/* while 循环 */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 初始化条件变量

    // 循环求和 1, 2, ..., n-1, n
    while i <= n {
        res += i;
        i += 1; // 更新条件变量
    }
    res
}

/* while 循环（两次更新） */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 初始化条件变量

    // 循环求和 1, 4, 10, ...
    while i <= n {
        res += i;
        // 更新条件变量
        i += 1;
        i *= 2;
    }
    res
}

/* 双层 for 循环 */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // 循环 i = 1, 2, ..., n-1, n
    for i in 1..=n {
        // 循环 j = 1, 2, ..., n-1, n
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* Driver Code */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nfor 循环的求和结果 res = {res}");

    res = while_loop(n);
    println!("\nwhile 循环的求和结果 res = {res}");

    res = while_loop_ii(n);
    println!("\nwhile 循环（两次更新）求和结果 res = {}", res);

    let res = nested_for_loop(n);
    println!("\n双层 for 循环的遍历结果 {res}");
}
