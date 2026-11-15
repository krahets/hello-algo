/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* 実行用コード */
pub fn main() {
    // [region]{init_deque}
    // 両端キューを初期化する
    let mut deque: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_deque}

    // [region]{push}
    /* 要素をエンキューする */
    deque.push_back(2); // キューの末尾に追加する
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // キューの先頭に追加する
    deque.push_front(1);
    // [endregion]{push}
    print!("両端キュー deque = ");
    print_util::print_queue(&deque);

    // [region]{peek_first}
    // 要素にアクセスする
    let peek_first = deque.front().unwrap(); // キューの先頭要素
    // [endregion]{peek_first}
    print!("\nキューの先頭要素 peekFirst = {peek_first}");
    // [region]{peek_last}
    let peek_last = deque.back().unwrap(); // キューの末尾要素
    // [endregion]{peek_last}
    print!("\nキューの末尾要素 peekLast = {peek_last}");

    // [region]{pop_first}
    // 要素をデキューする
    let pop_first = deque.pop_front().unwrap(); // キューの先頭要素をデキューする
    // [endregion]{pop_first}
    print!("\n先頭からデキューした要素 = {pop_first}、先頭からデキューした後 deque = ");
    print_util::print_queue(&deque);
    // [region]{pop_last}
    let pop_last = deque.pop_back().unwrap(); // キューの末尾要素をデキューする
    // [endregion]{pop_last}
    print!("\n末尾からデキューした要素 = {pop_last}、末尾からデキューした後 deque = ");
    print_util::print_queue(&deque);

    // [region]{size}
    // 両端キューの長さを取得する
    let size = deque.len();
    // [endregion]{size}
    print!("\n両端キューの長さ size = {size}");

    // [region]{is_empty}
    // 両端キューが空かどうかを判定する
    let is_empty = deque.is_empty();
    // [endregion]{is_empty}
    print!("\n両端キューは空か = {is_empty}");
}
