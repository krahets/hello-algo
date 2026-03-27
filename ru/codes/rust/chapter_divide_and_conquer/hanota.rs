/*
 * File: hanota.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(non_snake_case)]

/* Переместить один диск */
fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // Снять диск с вершины src
    let pan = src.pop().unwrap();
    // Положить диск на вершину tar
    tar.push(pan);
}

/* Решить задачу Ханойской башни f(i) */
fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // Если в src остался только один диск, сразу переместить его в tar
    if i == 1 {
        move_pan(src, tar);
        return;
    }
    // Подзадача f(i-1): переместить верхние i-1 дисков из src в buf с помощью tar
    dfs(i - 1, src, tar, buf);
    // Подзадача f(1): переместить оставшийся один диск из src в tar
    move_pan(src, tar);
    // Подзадача f(i-1): переместить верхние i-1 дисков из buf в tar с помощью src
    dfs(i - 1, buf, src, tar);
}

/* Решить задачу Ханойской башни */
fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
    let n = A.len() as i32;
    // Переместить верхние n дисков из A в C с помощью B
    dfs(n, A, B, C);
}

/* Driver Code */
pub fn main() {
    let mut A = vec![5, 4, 3, 2, 1];
    let mut B = Vec::new();
    let mut C = Vec::new();
    println!("Исходное состояние:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);

    solve_hanota(&mut A, &mut B, &mut C);

    println!("После завершения перемещения дисков:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);
}
