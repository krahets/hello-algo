/*
 * File: iteration.rs
 * Created Time: 2023-09-02
 * Author: night-cruise (2586447362@qq.com)
 */

/* for ループ */
fn for_loop(n: i32) -> i32 {
    let mut res = 0;
    // 1, 2, ..., n-1, n の和をループで求める
    for i in 1..=n {
        res += i;
    }
    res
}

/* while ループ */
fn while_loop(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 条件判定用の変数を初期化

    // 1, 2, ..., n-1, n の和をループで求める
    while i <= n {
        res += i;
        i += 1; // 条件判定用の変数を更新
    }
    res
}

/* while ループ（2 回更新） */
fn while_loop_ii(n: i32) -> i32 {
    let mut res = 0;
    let mut i = 1; // 条件判定用の変数を初期化

    // 1, 4, 10, ... の和をループで求める
    while i <= n {
        res += i;
        // 条件判定用の変数を更新
        i += 1;
        i *= 2;
    }
    res
}

/* 二重の for ループ */
fn nested_for_loop(n: i32) -> String {
    let mut res = vec![];
    // i = 1, 2, ..., n-1, n の順に繰り返す
    for i in 1..=n {
        // j = 1, 2, ..., n-1, n の順に繰り返す
        for j in 1..=n {
            res.push(format!("({}, {}), ", i, j));
        }
    }
    res.join("")
}

/* 実行例 */
fn main() {
    let n = 5;
    let mut res;

    res = for_loop(n);
    println!("\nfor ループによる総和 res = {res}");

    res = while_loop(n);
    println!("\nwhile ループによる総和 res = {res}");

    res = while_loop_ii(n);
    println!("\nwhile ループ（2 回更新）による総和 res = {}", res);

    let res = nested_for_loop(n);
    println!("\n二重の for ループの走査結果 {res}");
}
