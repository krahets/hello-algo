/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // [region]{init_queue}
    // 初始化队列
    // 在 Rust 中，一般将双向队列 VecDeque 看作队列使用
    let mut queue: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_queue}

    // [region]{push}
    // 元素入队
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    // [endregion]{push}
    print!("队列 queue = ");
    print_util::print_queue(&queue);

    // [region]{peek}
    // 访问队首元素
    let peek = queue.front().unwrap();
    // [endregion]{peek}
    println!("\n队首元素 peek = {peek}");

    // [region]{pop}
    // 元素出队
    let pop = queue.pop_front().unwrap();
    // [endregion]{pop}
    print!("出队元素 pop = {pop}，出队后 queue = ");
    print_util::print_queue(&queue);

    // [region]{size}
    // 获取队列的长度
    let size = queue.len();
    // [endregion]{size}
    print!("\n队列长度 size = {size}");

    // [region]{is_empty}
    // 判断队列是否为空
    let is_empty = queue.is_empty();
    // [endregion]{is_empty}
    print!("\n队列是否为空 = {is_empty}");
}
