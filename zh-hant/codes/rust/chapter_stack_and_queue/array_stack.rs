/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 基於陣列實現的堆疊 */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* 初始化堆疊 */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* 獲取堆疊的長度 */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* 判斷堆疊是否為空 */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* 入堆疊 */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* 出堆疊 */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* 訪問堆疊頂元素 */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("堆疊為空")
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
    // 初始化堆疊
    let mut stack = ArrayStack::<i32>::new();

    // 元素入堆疊
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("堆疊 stack = ");
    print_util::print_array(stack.to_array());

    //訪問堆疊頂元素
    let peek = stack.peek().unwrap();
    print!("\n堆疊頂元素 peek = {}", peek);

    // 元素出堆疊
    let pop = stack.pop().unwrap();
    print!("\n出堆疊元素 pop = {pop}，出堆疊後 stack = ");
    print_util::print_array(stack.to_array());

    // 獲取堆疊的長度
    let size = stack.size();
    print!("\n堆疊的長度 size = {size}");

    // 判斷是否為空
    let is_empty = stack.is_empty();
    print!("\n堆疊是否為空 = {is_empty}");
}
