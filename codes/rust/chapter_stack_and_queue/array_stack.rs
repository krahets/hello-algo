/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

/* 基于数组实现的栈 */
pub struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* 初始化栈 */
    #[allow(clippy::new_without_default)]
    pub fn new() -> ArrayStack<T> {
        Self { stack: Vec::new() }
    }

    /* 获取栈的长度 */
    pub fn size(&self) -> usize {
        self.stack.len()
    }

    /* 判断栈是否为空 */
    pub fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* 入栈 */
    pub fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* 出栈 */
    pub fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* 访问栈顶元素 */
    pub fn peek(&self) -> Option<&T> {
        self.stack.last()
    }

    /* 返回 &Vec */
    pub fn to_array(&self) -> &Vec<T> {
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
    println!("栈 stack = {:?}", stack.to_array());

    //访问栈顶元素
    let peek = stack.peek().unwrap();
    println!("栈顶元素 peek = {peek}");

    // 元素出栈
    let pop = stack.pop().unwrap();
    println!(
        "出栈元素 pop = {}，出栈后 stack = {:?}",
        pop,
        stack.to_array()
    );

    // 获取栈的长度
    let size = stack.size();
    println!("栈的长度 size = {size}");

    // 判断是否为空
    let is_empty = stack.is_empty();
    println!("栈是否为空 = {is_empty}");
}
