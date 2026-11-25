/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* 範例程式 */
pub fn main() {
    // 初始化佇列
    let mut queue: VecDeque<i32> = VecDeque::new();

    // 將元素加入佇列
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("佇列 queue = ");
    print_util::print_queue(&queue);

    // 讀取隊首元素
    let peek = queue.front().unwrap();
    println!("\n隊首元素 peek = {peek}");

    // 從佇列取出元素
    let pop = queue.pop_front().unwrap();
    print!("出隊元素 pop = {pop}，出隊後 queue = ");
    print_util::print_queue(&queue);

    // 取得佇列長度
    let size = queue.len();
    print!("\n佇列長度 size = {size}");

    // 判斷佇列是否為空
    let is_empty = queue.is_empty();
    print!("\n佇列是否為空 = {is_empty}");
}
