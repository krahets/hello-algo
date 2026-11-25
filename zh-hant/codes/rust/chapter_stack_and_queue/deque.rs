/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* 範例程式 */
pub fn main() {
    // 初始化雙端佇列
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("雙端佇列 deque = ");
    print_util::print_queue(&deque);

    // 讀取隊首與隊尾元素
    let peek_first = deque.front().unwrap();
    print!("\n隊首元素 peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\n隊尾元素 peekLast = {peek_last}");

    /* 將元素加入雙端佇列 */
    deque.push_back(4);
    print!("\n將元素 4 加到隊尾後 deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\n將元素 1 加到隊首後 deque = ");
    print_util::print_queue(&deque);

    // 從雙端佇列取出元素
    let pop_last = deque.pop_back().unwrap();
    print!("\n從隊尾取出的元素 = {pop_last}，取出後 deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\n從隊首取出的元素 = {pop_first}，取出後 deque = ");
    print_util::print_queue(&deque);

    // 取得雙端佇列長度
    let size = deque.len();
    print!("\n雙端佇列長度 size = {size}");

    // 判斷雙端佇列是否為空
    let is_empty = deque.is_empty();
    print!("\n雙端佇列是否為空 = {is_empty}");
}
