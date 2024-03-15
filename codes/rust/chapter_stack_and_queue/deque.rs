/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

include!("../include/include.rs");

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // 初始化双向队列
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("双向队列 deque = ");
    print_util::print_queue(&deque);

    // 访问元素
    let peek_first = deque.front().unwrap();
    print!("\n队首元素 peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\n队尾元素 peekLast = {peek_last}");

    /* 元素入队 */
    deque.push_back(4);
    print!("\n元素 4 队尾入队后 deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\n元素 1 队首入队后 deque = ");
    print_util::print_queue(&deque);

    // 元素出队
    let pop_last = deque.pop_back().unwrap();
    print!("\n队尾出队元素 = {pop_last}，队尾出队后 deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\n队首出队元素 = {pop_first}，队首出队后 deque = ");
    print_util::print_queue(&deque);

    // 获取双向队列的长度
    let size = deque.len();
    print!("\n双向队列长度 size = {size}");

    // 判断双向队列是否为空
    let is_empty = deque.is_empty();
    print!("\n双向队列是否为空 = {is_empty}");
}
