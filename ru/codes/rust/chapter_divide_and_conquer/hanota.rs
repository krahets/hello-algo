/*
 * File: hanota.rs
 * Created Time: 2023-07-15
 * Author: codingonion (coderonion@gmail.com)
 */

#![allow(non_snake_case)]

/* Перенос одного диска */
fn move_pan(src: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // Снимаем верхний диск с src
    let pan = src.pop().unwrap();
    // Кладём диск на вершину tar
    tar.push(pan);
}

/* Решение задачи о ханойских башнях f(i) */
fn dfs(i: i32, src: &mut Vec<i32>, buf: &mut Vec<i32>, tar: &mut Vec<i32>) {
    // Если с src осталось перенести один диск, кладём его сразу на tar
    if i == 1 {
        move_pan(src, tar);
        return;
    }
    // Подзадача f(i-1): переносим i-1 верхних дисков с src на buf с помощью tar
    dfs(i - 1, src, tar, buf);
    // Подзадача f(1): переносим оставшийся диск с src на tar
    move_pan(src, tar);
    // Подзадача f(i-1): переносим i-1 верхних дисков с buf на tar с помощью src
    dfs(i - 1, buf, src, tar);
}

/* Решение задачи о ханойских башнях */
fn solve_hanota(A: &mut Vec<i32>, B: &mut Vec<i32>, C: &mut Vec<i32>) {
    let n = A.len() as i32;
    // Переносим n верхних дисков с A на C с помощью B
    dfs(n, A, B, C);
}

/* Основная программа */
pub fn main() {
    let mut A = vec![5, 4, 3, 2, 1];
    let mut B = Vec::new();
    let mut C = Vec::new();
    println!("Исходное состояние:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);

    solve_hanota(&mut A, &mut B, &mut C);

    println!("После переноса дисков:");
    println!("A = {:?}", A);
    println!("B = {:?}", B);
    println!("C = {:?}", C);
}
