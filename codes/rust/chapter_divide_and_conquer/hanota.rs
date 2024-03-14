/*
 * File: hanota.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(non_snake_case)]

/* 移动一个圆盘 */
fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // 从 src 顶部拿出一个圆盘
    let pan = src.remove(src.len() - 1);
    // 将圆盘放入 tar 顶部
    tar.push(pan);
}

/* 求解汉诺塔问题 f(i) */
fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // 若 src 只剩下一个圆盘，则直接将其移到 tar
    if i == 1 {
        move_pan(src, tar);
        return;
    }
    // 子问题 f(i-1) ：将 src 顶部 i-1 个圆盘借助 tar 移到 buf
    dfs(i - 1, src, tar, buf);
    // 子问题 f(1) ：将 src 剩余一个圆盘移到 tar
    move_pan(src, tar);
    // 子问题 f(i-1) ：将 buf 顶部 i-1 个圆盘借助 src 移到 tar
    dfs(i - 1, buf, src, tar);
}

/* 求解汉诺塔问题 */
fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
    let n = A.len() as i32;
    // 将 A 顶部 n 个圆盘借助 B 移到 C
    dfs(n, A, B, C);
}

/* Driver Code */
pub fn main() {
    let mut A = vec![5, 4, 3, 2, 1];
    let mut B = Vec::new();
    let mut C = Vec::new();
    println!("初始状态下：");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);

    solve_hanota(&mut A, &mut B, &mut C);

    println!("圆盘移动完成后：");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);
}
