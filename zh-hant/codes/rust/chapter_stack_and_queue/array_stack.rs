/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 以陣列實作堆疊 */
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

    /* 取得堆疊長度 */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* 判斷堆疊是否為空 */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* 推入堆疊 */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* 彈出堆疊頂端的元素 */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* 取得堆疊頂端元素的參照 */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("堆疊為空")
        };
        self.stack.last()
    }

    /* 回傳 Vec 的參照（&Vec） */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* 範例程式 */
fn main() {
    // 初始化堆疊
    let mut stack = ArrayStack::<i32>::new();

    // 將元素推入堆疊
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("堆疊 stack = ");
    print_util::print_array(stack.to_array());

    //讀取堆疊頂端的元素
    let peek = stack.peek().unwrap();
    print!("\n堆疊頂端元素 peek = {}", peek);

    // 從堆疊彈出元素
    let pop = stack.pop().unwrap();
    print!("\n彈出的元素 pop = {pop}，彈出後 stack = ");
    print_util::print_array(stack.to_array());

    // 取得堆疊長度
    let size = stack.size();
    print!("\n堆疊長度 size = {size}");

    // 判斷堆疊是否為空
    let is_empty = stack.is_empty();
    print!("\n堆疊是否為空 = {is_empty}");
}
