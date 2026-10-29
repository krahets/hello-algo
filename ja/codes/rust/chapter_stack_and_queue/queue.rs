/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* 実行用コード */
pub fn main() {
    // キューを初期化する
    let mut queue: VecDeque<i32> = VecDeque::new();

    // 要素をエンキューする
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("キュー queue = ");
    print_util::print_queue(&queue);

    // キューの先頭要素にアクセス
    let peek = queue.front().unwrap();
    println!("\nキューの先頭要素 peek = {peek}");

    // 要素をデキューする
    let pop = queue.pop_front().unwrap();
    print!("デキューした要素 pop = {pop}、デキュー後 queue = ");
    print_util::print_queue(&queue);

    // キューの長さを取得
    let size = queue.len();
    print!("\nキューの長さ size = {size}");

    // キューが空か判定
    let is_empty = queue.is_empty();
    print!("\nキューは空か = {is_empty}");
}
