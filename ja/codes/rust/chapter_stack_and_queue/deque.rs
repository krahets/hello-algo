/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // 両端キューを初期化
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("両端キュー deque = ");
    print_util::print_queue(&deque);

    // 要素にアクセス
    let peek_first = deque.front().unwrap();
    print!("\n先頭要素 peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\n末尾要素 peekLast = {peek_last}");

    /* 要素をエンキュー */
    deque.push_back(4);
    print!("\n要素 4 を末尾に追加後 deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\n要素 1 を先頭に追加後 deque = ");
    print_util::print_queue(&deque);

    // 要素をデキュー
    let pop_last = deque.pop_back().unwrap();
    print!("\n末尾から取り出した要素 = {pop_last}、取り出し後 deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\n先頭から取り出した要素 = {pop_first}、取り出し後 deque = ");
    print_util::print_queue(&deque);

    // 両端キューの長さを取得
    let size = deque.len();
    print!("\n両端キューの長さ size = {size}");

    // 両端キューが空かどうかを判定
    let is_empty = deque.is_empty();
    print!("\n両端キューが空かどうか = {is_empty}");
}
