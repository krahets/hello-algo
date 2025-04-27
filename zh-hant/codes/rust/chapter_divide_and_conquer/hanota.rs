/*
 * File: hanota.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(non_snake_case)]

/* 移動一個圓盤 */
fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // 從 src 頂部拿出一個圓盤
    let pan = src.pop().unwrap();
    // 將圓盤放入 tar 頂部
    tar.push(pan);
}

/* 求解河內塔問題 f(i) */
fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // 若 src 只剩下一個圓盤，則直接將其移到 tar
    if i == 1 {
        move_pan(src, tar);
        return;
    }
    // 子問題 f(i-1) ：將 src 頂部 i-1 個圓盤藉助 tar 移到 buf
    dfs(i - 1, src, tar, buf);
    // 子問題 f(1) ：將 src 剩餘一個圓盤移到 tar
    move_pan(src, tar);
    // 子問題 f(i-1) ：將 buf 頂部 i-1 個圓盤藉助 src 移到 tar
    dfs(i - 1, buf, src, tar);
}

/* 求解河內塔問題 */
fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
    let n = A.len() as i32;
    // 將 A 頂部 n 個圓盤藉助 B 移到 C
    dfs(n, A, B, C);
}

/* Driver Code */
pub fn main() {
    let mut A = vec![5, 4, 3, 2, 1];
    let mut B = Vec::new();
    let mut C = Vec::new();
    println!("初始狀態下：");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);

    solve_hanota(&mut A, &mut B, &mut C);

    println!("圓盤移動完成後：");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);
}
