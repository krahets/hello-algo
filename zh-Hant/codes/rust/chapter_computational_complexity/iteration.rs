/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for 迴圈 */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // 迴圈求和 1, 2, ..., n-1, n
    for i in 1..=n {
        res += i;
    }
    res
}

/* while 迴圈 */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 初始化條件變數

    // 迴圈求和 1, 2, ..., n-1, n
    while i <= n {
        res += i;
        i += 1; // 更新條件變數
    }
    res
}

/* while 迴圈（兩次更新） */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 初始化條件變數

    // 迴圈求和 1, 4, 10, ...
    while i <= n {
        res += i;
        // 更新條件變數
        i += 1;
        i *= 2;
    }
    res
}

/* 雙層 for 迴圈 */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // 迴圈 i = 1, 2, ..., n-1, n
    for i in 1..=n {
        // 迴圈 j = 1, 2, ..., n-1, n
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
    println!("\nfor 迴圈的求和結果 res = {res}");

    res = while_loop(n);
    println!("\nwhile 迴圈的求和結果 res = {res}");

    res = while_loop_ii(n);
    println!("\nwhile 迴圈（兩次更新）求和結果 res = {}", res);

    let res = nested_for_loop(n);
    println!("\n雙層 for 迴圈的走訪結果 {res}");
}
