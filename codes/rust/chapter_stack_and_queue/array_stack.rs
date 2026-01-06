/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 基于数组实现的栈 */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* 初始化栈 */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* 获取栈的长度 */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* 判断栈是否为空 */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* 入栈 */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* 出栈 */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* 访问栈顶元素 */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("栈为空")
        };
        self.stack.last()
    }

    /* 返回 &Vec */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* Driver Code */
fn main() {
    // 初始化栈
    let mut stack = ArrayStack::<i32>::new();

    // 元素入栈
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("栈 stack = ");
    print_util::print_array(stack.to_array());

    //访问栈顶元素
    let peek = stack.peek().unwrap();
    print!("\n栈顶元素 peek = {}", peek);

    // 元素出栈
    let pop = stack.pop().unwrap();
    print!("\n出栈元素 pop = {pop}，出栈后 stack = ");
    print_util::print_array(stack.to_array());

    // 获取栈的长度
    let size = stack.size();
    print!("\n栈的长度 size = {size}");

    // 判断是否为空
    let is_empty = stack.is_empty();
    print!("\n栈是否为空 = {is_empty}");
}
