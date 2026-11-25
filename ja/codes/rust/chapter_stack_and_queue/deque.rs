/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* 実行例 */
pub fn main() {
    // 両端キューを初期化する
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("両端キュー deque = ");
    print_util::print_queue(&deque);

    // 要素を参照する
    let peek_first = deque.front().unwrap();
    print!("\n先頭要素 peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\n末尾要素 peekLast = {peek_last}");

    /* 要素を両端キューに追加する */
    deque.push_back(4);
    print!("\n末尾に 4 を追加した後の deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\n先頭に 1 を追加した後の deque = ");
    print_util::print_queue(&deque);

    // 両端キューから要素を取り出す
    let pop_last = deque.pop_back().unwrap();
    print!("\n末尾から取り出した要素 = {pop_last}、末尾から取り出した後の deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\n先頭から取り出した要素 = {pop_first}、先頭から取り出した後の deque = ");
    print_util::print_queue(&deque);

    // 両端キューの要素数を取得する
    let size = deque.len();
    print!("\n両端キューの要素数 size = {size}");

    // 両端キューが空かどうかを判定する
    let is_empty = deque.is_empty();
    print!("\n両端キューは空か = {is_empty}");
}
