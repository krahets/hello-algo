/*
 * File: hanota.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(non_snake_case)]

/* Move a disc */
fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // Take out a disc from the top of src
    let pan = src.remove(src.len() - 1);
    // Place the disc on top of tar
    tar.push(pan);
}

/* Solve the Tower of Hanoi problem f(i) */
fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // If only one disc remains on src, move it to tar
    if i == 1 {
        move_pan(src, tar);
        return;
    }
    // Subproblem f(i-1): move the top i-1 discs from src with the help of tar to buf
    dfs(i - 1, src, tar, buf);
    // Subproblem f(1): move the remaining one disc from src to tar
    move_pan(src, tar);
    // Subproblem f(i-1): move the top i-1 discs from buf with the help of src to tar
    dfs(i - 1, buf, src, tar);
}

/* Solve the Tower of Hanoi problem */
fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
    let n = A.len() as i32;
    // Move the top n discs from A with the help of B to C
    dfs(n, A, B, C);
}

/* Driver Code */
pub fn main() {
    let mut A = vec![5, 4, 3, 2, 1];
    let mut B = Vec::new();
    let mut C = Vec::new();
    println!("Initial state:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);

    solve_hanota(&mut A, &mut B, &mut C);

    println!("After the discs are moved:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);
}
