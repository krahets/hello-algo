/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver Code */
pub fn main() {
    // 初始化栈
    // 在 rust 中，推荐将 Vec 当作栈来使用
    let mut stack: Vec<i32> = Vec::new();

    // 元素入栈
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("栈 stack = ");
    print_util::print_array(&stack);

    // 访问栈顶元素
    let peek = stack.last().unwrap();
    print!("\n栈顶元素 peek = {peek}");

    // 元素出栈
    let pop = stack.pop().unwrap();
    print!("\n出栈元素 pop = {pop}，出栈后 stack = ");
    print_util::print_array(&stack);

    // 获取栈的长度
    let size = stack.len();
    print!("\n栈的长度 size = {size}");

    // 判断栈是否为空
    let is_empty = stack.is_empty();
    print!("\n栈是否为空 = {is_empty}");
}
