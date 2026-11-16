/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver Code */
pub fn main() {
    // [region]{init_stack}
    // 初始化堆疊
    // 在 Rust 中，推薦將 Vec 當作堆疊來使用
    let mut stack: Vec<i32> = Vec::new();
    // [endregion]{init_stack}

    // [region]{push}
    // 元素入堆疊
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    print!("堆疊 stack = ");
    print_util::print_array(&stack);

    // [region]{peek}
    // 訪問堆疊頂元素
    let peek = stack.last().unwrap();
    // [endregion]{peek}
    print!("\n堆疊頂元素 peek = {peek}");

    // [region]{pop}
    // 元素出堆疊
    let pop = stack.pop().unwrap();
    // [endregion]{pop}
    print!("\n出堆疊元素 pop = {pop}，出堆疊後 stack = ");
    print_util::print_array(&stack);

    // [region]{size}
    // 獲取堆疊的長度
    let size = stack.len();
    // [endregion]{size}
    print!("\n堆疊的長度 size = {size}");

    // [region]{is_empty}
    // 判斷堆疊是否為空
    let is_empty = stack.is_empty();
    // [endregion]{is_empty}
    print!("\n堆疊是否為空 = {is_empty}");
}
