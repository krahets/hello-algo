/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for ループ */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // 1, 2, ..., n-1, n を順に加算する
    for i in 1..=n {
        res += i;
    }
    res
}

/* while ループ */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 条件変数を初期化する

    // 1, 2, ..., n-1, n を順に加算する
    while i <= n {
        res += i;
        i += 1; // 条件変数を更新する
    }
    res
}

/* while ループ（2回更新） */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 条件変数を初期化する

    // 1, 4, 10, ... を順に加算する
    while i <= n {
        res += i;
        // 条件変数を更新する
        i += 1;
        i *= 2;
    }
    res
}

/* 二重 for ループ */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // i = 1, 2, ..., n-1, n とループする
    for i in 1..=n {
        // j = 1, 2, ..., n-1, n とループする
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
    println!("\nfor ループの合計結果 res = {res}");

    res = while_loop(n);
    println!("\nwhile ループの合計結果 res = {res}");

    res = while_loop_ii(n);
    println!("\nwhile ループ（2 回更新）の合計結果 res = {}", res);

    let res = nested_for_loop(n);
    println!("\n二重 for ループの走査結果 {res}");
}
