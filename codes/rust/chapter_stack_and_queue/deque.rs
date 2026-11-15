/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // [region]{init_deque}
    // 初始化双向队列
    let mut deque: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_deque}

    // [region]{push}
    /* 元素入队 */
    deque.push_back(2); // 添加至队尾
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 添加至队首
    deque.push_front(1);
    // [endregion]{push}
    print!("双向队列 deque = ");
    print_util::print_queue(&deque);

    // [region]{peek_first}
    // 访问元素
    let peek_first = deque.front().unwrap(); // 队首元素
    // [endregion]{peek_first}
    print!("\n队首元素 peekFirst = {peek_first}");
    // [region]{peek_last}
    let peek_last = deque.back().unwrap(); // 队尾元素
    // [endregion]{peek_last}
    print!("\n队尾元素 peekLast = {peek_last}");

    // [region]{pop_first}
    // 元素出队
    let pop_first = deque.pop_front().unwrap(); // 队首元素出队
    // [endregion]{pop_first}
    print!("\n队首出队元素 = {pop_first}，队首出队后 deque = ");
    print_util::print_queue(&deque);
    // [region]{pop_last}
    let pop_last = deque.pop_back().unwrap(); // 队尾元素出队
    // [endregion]{pop_last}
    print!("\n队尾出队元素 = {pop_last}，队尾出队后 deque = ");
    print_util::print_queue(&deque);

    // [region]{size}
    // 获取双向队列的长度
    let size = deque.len();
    // [endregion]{size}
    print!("\n双向队列长度 size = {size}");

    // [region]{is_empty}
    // 判断双向队列是否为空
    let is_empty = deque.is_empty();
    // [endregion]{is_empty}
    print!("\n双向队列是否为空 = {is_empty}");
}
