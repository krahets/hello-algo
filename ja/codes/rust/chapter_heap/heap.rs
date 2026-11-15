/*
 * File: heap.rs
 * Created Time: 2023-07-16
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::print_util;

// [region]{import}
use std::{cmp::Reverse, collections::BinaryHeap};
// [endregion]{import}

/* 実行用コード */
fn main() {
    // [region]{init}
    /* ヒープを初期化する */
    // 最小ヒープを初期化する
    #[allow(unused_assignments)]
    let mut min_heap = BinaryHeap::new();
    // Rust の BinaryHeap は最大ヒープであり、最小ヒープには通常 Reverse を「かぶせる」
    // 最大ヒープを初期化する
    let mut max_heap = BinaryHeap::new();
    // [endregion]{init}

    println!("\n以下のテストケースは最大ヒープを対象とする");

    // [region]{push}
    /* ヒープに要素を挿入する */
    max_heap.push(1);
    max_heap.push(3);
    max_heap.push(2);
    max_heap.push(5);
    max_heap.push(4);
    // [endregion]{push}
    print_util::print_heap(max_heap.iter().map(|&val| val).collect());

    // [region]{peek}
    /* ヒープの先頭要素を取得する */
    let peek = max_heap.peek().unwrap(); // 5
    // [endregion]{peek}
    println!("\nヒープの先頭要素は {}", peek);

    // [region]{pop_1}
    /* ヒープの先頭要素を取り出す */
    // 取り出した要素は降順の列を形成する
    let peek = max_heap.pop().unwrap(); // 5
    // [endregion]{pop_1}
    println!("{}", peek);
    // [region]{pop_2}
    let peek = max_heap.pop().unwrap(); // 4
    // [endregion]{pop_2}
    println!("{}", peek);
    // [region]{pop_3}
    let peek = max_heap.pop().unwrap(); // 3
    // [endregion]{pop_3}
    println!("{}", peek);
    // [region]{pop_4}
    let peek = max_heap.pop().unwrap(); // 2
    // [endregion]{pop_4}
    println!("{}", peek);
    // [region]{pop_5}
    let peek = max_heap.pop().unwrap(); // 1
    // [endregion]{pop_5}
    println!("{}", peek);

    // [region]{size}
    /* ヒープのサイズを取得する */
    let size = max_heap.len();
    // [endregion]{size}
    println!("\nヒープの要素数は {}", size);

    // [region]{is_empty}
    /* ヒープが空か判定 */
    let is_empty = max_heap.is_empty();
    // [endregion]{is_empty}
    println!("\nヒープは空か {}", is_empty);

    // [region]{heapify}
    /* リストを入力してヒープを構築する */
    // 時間計算量は O(n) であり、O(nlogn) ではない
    min_heap = BinaryHeap::from(vec![Reverse(1), Reverse(3), Reverse(2), Reverse(5), Reverse(4)]);
    // [endregion]{heapify}
    println!("\nリストを入力して最小ヒープを構築した後");
    print_util::print_heap(min_heap.iter().map(|&val| val.0).collect());
}
