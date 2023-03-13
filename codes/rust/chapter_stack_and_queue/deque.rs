/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: sjinzh (sjinzh@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

include!("../include/include.rs");

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // 初始化双向队列
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(2);     // 添加至队尾
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3);    // 添加至队首
    deque.push_front(1);
    print!("双向队列 deque = ");
    print_util::print_queue(&deque);

    // 访问元素
    let peek_first = deque.front().unwrap();    // 队首元素
    print!("\n队首元素 peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();      // 队尾元素
    print!("\n队尾元素 peekLast = {peek_last}");

    // 元素出队
    let pop_first = deque.pop_front().unwrap();    // 队首元素出队
    print!("\n队首出队元素 popFirst = {pop_first}，队首出队后 deque = ");
    print_util::print_queue(&deque);
    let pop_last = deque.pop_back().unwrap();      // 队尾元素出队     
    print!("\n队尾出队元素 popLast = {pop_last}，队尾出队后 deque = ");
    print_util::print_queue(&deque);

    // 获取双向队列的长度
    let size = deque.len();
    print!("\n双向队列长度 size = {size}");

    // 判断双向队列是否为空
    let is_empty = deque.is_empty();
    print!("\n双向队列是否为空 = {is_empty}");
}