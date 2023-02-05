/**
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use std::vec::Vec;
struct ArrayStack {
    stack: Vec<i32>,
}

impl ArrayStack {
    fn new() -> ArrayStack {
        ArrayStack { stack: Vec::new() }
    }

    //获取栈的长度
    fn size(&self) -> usize {
        self.stack.len()
    }

    //判断栈是否为空
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    //入栈
    fn push(&mut self, num: i32) {
        self.stack.push(num);
    }

    //出栈
    fn pop(&mut self) -> i32 {
        match self.stack.pop() {
            Some(num) => num,
            None => panic!("stack is empty"),
        }
    }

    //访问栈顶元素
    fn peek(&self) -> i32 {
        *self
            .stack
            .last()
            .unwrap_or_else(|| panic!("stack is empty"))
    }

    fn to_vec(&self) -> Vec<i32> {
        self.stack.clone()
    }
}

fn main() {
    //初始化栈
    let mut stack = ArrayStack::new();

    //元素入栈
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    println!("栈 stack = {:?}", stack.to_vec());

    //访问栈顶元素
    let peek = stack.peek();
    println!("栈顶元素 peek = {}", peek);

    //元素出栈
    let pop = stack.pop();
    println!(
        "出栈元素 pop = {}，出栈后 stack = {:?}",
        pop,
        stack.to_vec()
    );

    //获取栈的长度
    let size = stack.size();
    println!("栈的长度 size = {}", size);

    //判断是否为空
    let is_empty = stack.is_empty();
    println!("栈是否为空 = {}", is_empty);
}
