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
    // 初始化雙向佇列
    let mut deque: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_deque}

    // [region]{push}
    /* 元素入列 */
    deque.push_back(2); // 新增至佇列尾
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // 新增至佇列首
    deque.push_front(1);
    // [endregion]{push}
    print!("雙向佇列 deque = ");
    print_util::print_queue(&deque);

    // [region]{peek_first}
    // 訪問元素
    let peek_first = deque.front().unwrap(); // 佇列首元素
    // [endregion]{peek_first}
    print!("\n佇列首元素 peekFirst = {peek_first}");
    // [region]{peek_last}
    let peek_last = deque.back().unwrap(); // 佇列尾元素
    // [endregion]{peek_last}
    print!("\n佇列尾元素 peekLast = {peek_last}");

    // [region]{pop_first}
    // 元素出列
    let pop_first = deque.pop_front().unwrap(); // 佇列首元素出列
    // [endregion]{pop_first}
    print!("\n佇列首出列元素 = {pop_first}，佇列首出列後 deque = ");
    print_util::print_queue(&deque);
    // [region]{pop_last}
    let pop_last = deque.pop_back().unwrap(); // 佇列尾元素出列
    // [endregion]{pop_last}
    print!("\n佇列尾出列元素 = {pop_last}，佇列尾出列後 deque = ");
    print_util::print_queue(&deque);

    // [region]{size}
    // 獲取雙向佇列的長度
    let size = deque.len();
    // [endregion]{size}
    print!("\n雙向佇列長度 size = {size}");

    // [region]{is_empty}
    // 判斷雙向佇列是否為空
    let is_empty = deque.is_empty();
    // [endregion]{is_empty}
    print!("\n雙向佇列是否為空 = {is_empty}");
}
