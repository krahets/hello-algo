/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* 実行例 */
pub fn main() {
    // キューを初期化する
    let mut queue: VecDeque<i32> = VecDeque::new();

    // 要素をキューに追加する
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("キュー queue = ");
    print_util::print_queue(&queue);

    // キューの先頭要素を参照する
    let peek = queue.front().unwrap();
    println!("\n先頭要素 peek = {peek}");

    // キューから要素を取り出す
    let pop = queue.pop_front().unwrap();
    print!("デキューした要素 pop = {pop}、デキュー後の queue = ");
    print_util::print_queue(&queue);

    // キューの要素数を取得する
    let size = queue.len();
    print!("\nキューの要素数 size = {size}");

    // キューが空かどうかを判定する
    let is_empty = queue.is_empty();
    print!("\nキューは空か = {is_empty}");
}
