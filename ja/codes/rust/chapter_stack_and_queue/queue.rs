/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* 実行用コード */
pub fn main() {
    // [region]{init_queue}
    // キューを初期化する
    // Rust では一般に、両端キュー VecDeque をキューとして使う
    let mut queue: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_queue}

    // [region]{push}
    // 要素をエンキューする
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    // [endregion]{push}
    print!("キュー queue = ");
    print_util::print_queue(&queue);

    // [region]{peek}
    // キューの先頭要素にアクセス
    let peek = queue.front().unwrap();
    // [endregion]{peek}
    println!("\nキューの先頭要素 peek = {peek}");

    // [region]{pop}
    // 要素をデキューする
    let pop = queue.pop_front().unwrap();
    // [endregion]{pop}
    print!("デキューした要素 pop = {pop}、デキュー後 queue = ");
    print_util::print_queue(&queue);

    // [region]{size}
    // キューの長さを取得
    let size = queue.len();
    // [endregion]{size}
    print!("\nキューの長さ size = {size}");

    // [region]{is_empty}
    // キューが空か判定
    let is_empty = queue.is_empty();
    // [endregion]{is_empty}
    print!("\nキューは空か = {is_empty}");
}
