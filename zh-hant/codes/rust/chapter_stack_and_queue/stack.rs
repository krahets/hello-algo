/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 範例程式 */
pub fn main() {
    // 初始化堆疊
    // 在 Rust 中，建議用 Vec 當作堆疊
    let mut stack: Vec<i32> = Vec::new();

    // 將元素推入堆疊
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("堆疊 stack = ");
    print_util::print_array(&stack);

    // 讀取堆疊頂端的元素
    let peek = stack.last().unwrap();
    print!("\n堆疊頂端元素 peek = {peek}");

    // 從堆疊彈出元素
    let pop = stack.pop().unwrap();
    print!("\n彈出的元素 pop = {pop}，彈出後 stack = ");
    print_util::print_array(&stack);

    // 取得堆疊長度
    let size = stack.len();
    print!("\n堆疊長度 size = {size}");

    // 判斷堆疊是否為空
    let is_empty = stack.is_empty();
    print!("\n堆疊是否為空 = {is_empty}");
}
