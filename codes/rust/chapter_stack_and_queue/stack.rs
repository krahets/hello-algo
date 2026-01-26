/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

/* Driver Code */
#[allow(clippy::vec_init_then_push)]
fn main() {
    // 初始化栈
    // 在 rust 中，推荐将 Vec 当作栈来使用
    let mut stack: Vec<i32> = Vec::new();

    // 元素入栈
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    println!("栈 stack = {stack:?}");

    // 访问栈顶元素
    let peek = stack.last().unwrap();
    println!("栈顶元素 peek = {peek}");

    // 元素出栈
    let pop = stack.pop().unwrap();
    println!("出栈元素 pop = {pop}，出栈后 stack = {stack:?}");

    // 获取栈的长度
    let size = stack.len();
    println!("栈的长度 size = {size}");

    // 判断栈是否为空
    let is_empty = stack.is_empty();
    println!("栈是否为空 = {is_empty}");
}
