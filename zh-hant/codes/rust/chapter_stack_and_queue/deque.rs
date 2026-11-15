/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // 初始化雙向佇列
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("雙向佇列 deque = ");
    print_util::print_queue(&deque);

    // 訪問元素
    let peek_first = deque.front().unwrap();
    print!("\n佇列首元素 peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\n佇列尾元素 peekLast = {peek_last}");

    /* 元素入列 */
    deque.push_back(4);
    print!("\n元素 4 佇列尾入列後 deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\n元素 1 佇列首入列後 deque = ");
    print_util::print_queue(&deque);

    // 元素出列
    let pop_last = deque.pop_back().unwrap();
    print!("\n佇列尾出列元素 = {pop_last}，佇列尾出列後 deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\n佇列首出列元素 = {pop_first}，佇列首出列後 deque = ");
    print_util::print_queue(&deque);

    // 獲取雙向佇列的長度
    let size = deque.len();
    print!("\n雙向佇列長度 size = {size}");

    // 判斷雙向佇列是否為空
    let is_empty = deque.is_empty();
    print!("\n雙向佇列是否為空 = {is_empty}");
}
