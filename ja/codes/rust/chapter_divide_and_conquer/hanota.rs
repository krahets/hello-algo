/*
 * File: hanota.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(non_snake_case)]

/* 円盤を 1 枚移す */
fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // src の一番上から円盤を 1 枚取り出す
    let pan = src.pop().unwrap();
    // 円盤を tar の一番上に置く
    tar.push(pan);
}

/* ハノイの塔の問題 f(i) を解く */
fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // src の円盤が残り 1 枚なら、そのまま tar に移す
    if i == 1 {
        move_pan(src, tar);
        return;
    }
    // 部分問題 f(i-1)：src の上から i-1 枚を tar を使って buf に移す
    dfs(i - 1, src, tar, buf);
    // 部分問題 f(1)：src に残った 1 枚を tar に移す
    move_pan(src, tar);
    // 部分問題 f(i-1)：buf の上から i-1 枚を src を使って tar に移す
    dfs(i - 1, buf, src, tar);
}

/* ハノイの塔を解く */
fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
    let n = A.len() as i32;
    // A の上から n 枚の円盤を B を使って C に移す
    dfs(n, A, B, C);
}

/* 実行例 */
pub fn main() {
    let mut A = vec![5, 4, 3, 2, 1];
    let mut B = Vec::new();
    let mut C = Vec::new();
    println!("初期状態：");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);

    solve_hanota(&mut A, &mut B, &mut C);

    println!("円盤をすべて移した後：");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);
}
