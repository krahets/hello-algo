/**
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: sjinzh (sjinzh@gmail.com)
*/

use std::collections::LinkedList;

/* Driver Code */
pub fn main() {
    // 初始化队列
    let mut queue: LinkedList<i32> = LinkedList::new();

    // 元素入队
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("队列 queue = ");
    inc::print_util::print_queue(&queue);

    // 访问队首元素
    let peek = queue.front().unwrap();
    println!("\n队首元素 peek = {peek}");

    // 元素出队
    let poll = queue.pop_front().unwrap();
    print!("出队元素 poll = {poll}，出队后 queue = ");
    inc::print_util::print_queue(&queue);

    // 获取队列的长度
    let size = queue.len();
    print!("\n队列长度 size = {size}");

    /* 判断队列是否为空 */
    let is_empty = queue.is_empty();
    print!("\n队列是否为空 = {is_empty}");
}