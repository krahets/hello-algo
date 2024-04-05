/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

/* Driver Code */
pub fn main() {
    // 初始化堆疊
    // 在 rust 中，推薦將 Vec 當作堆疊來使用
    let mut stack: Vec<i32> = Vec::new();

    // 元素入堆疊
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("堆疊 stack = ");
    print_util::print_array(&stack);

    // 訪問堆疊頂元素
    let peek = stack.last().unwrap();
    print!("\n堆疊頂元素 peek = {peek}");

    // 元素出堆疊
    let pop = stack.pop().unwrap();
    print!("\n出堆疊元素 pop = {pop}，出堆疊後 stack = ");
    print_util::print_array(&stack);

    // 獲取堆疊的長度
    let size = stack.len();
    print!("\n堆疊的長度 size = {size}");

    // 判斷堆疊是否為空
    let is_empty = stack.is_empty();
    print!("\n堆疊是否為空 = {is_empty}");
}
