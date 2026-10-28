/*
 * File: hanota.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(non_snake_case)]

/* 원판 하나 이동 */
fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // src의 맨 위에서 원판 하나를 꺼낸다
    let pan = src.pop().unwrap();
    // 원판을 tar의 맨 위에 놓는다
    tar.push(pan);
}

/* 하노이의 탑 문제 f(i) 풀기 */
fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // src에 원판이 하나만 남아 있으면 바로 tar로 옮긴다
    if i == 1 {
        move_pan(src, tar);
        return;
    }
    // 부분 문제 f(i-1): tar를 이용하여 src의 맨 위 원판 i-1개를 buf로 옮긴다
    dfs(i - 1, src, tar, buf);
    // 부분 문제 f(1): src에 남은 원판 하나를 tar로 옮긴다
    move_pan(src, tar);
    // 부분 문제 f(i-1): src를 이용하여 buf의 맨 위 원판 i-1개를 tar로 옮긴다
    dfs(i - 1, buf, src, tar);
}

/* 하노이의 탑 문제 풀기 */
fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
    let n = A.len() as i32;
    // B를 이용하여 A의 맨 위 원판 n개를 C로 옮긴다
    dfs(n, A, B, C);
}

/* 실행 코드 */
pub fn main() {
    let mut A = vec![5, 4, 3, 2, 1];
    let mut B = Vec::new();
    let mut C = Vec::new();
    println!("초기 상태:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);

    solve_hanota(&mut A, &mut B, &mut C);

    println!("원판 이동을 마친 후:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);
}
