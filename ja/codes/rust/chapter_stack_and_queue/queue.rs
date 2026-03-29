/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // キューを初期化
    let mut queue: VecDeque<i32> = VecDeque::new();

    // 要素をエンキュー
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("キュー queue = ");
    print_util::print_queue(&queue);

    // キュー先頭の要素にアクセス
    let peek = queue.front().unwrap();
    println!("\n先頭要素 peek = {peek}");

    // 要素をデキュー
    let pop = queue.pop_front().unwrap();
    print!("取り出した要素 pop = {pop}、取り出し後 queue = ");
    print_util::print_queue(&queue);

    // キューの長さを取得
    let size = queue.len();
    print!("\nキューの長さ size = {size}");

    // キューが空かどうかを判定
    let is_empty = queue.is_empty();
    print!("\nキューが空かどうか = {is_empty}");
}
