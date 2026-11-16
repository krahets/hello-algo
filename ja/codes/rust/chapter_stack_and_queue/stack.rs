/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 実行用コード */
pub fn main() {
    // [region]{init_stack}
    // スタックを初期化する
    // Rust では Vec をスタックとして使うことを推奨する
    let mut stack: Vec<i32> = Vec::new();
    // [endregion]{init_stack}

    // [region]{push}
    // 要素をプッシュする
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    print!("スタック stack = ");
    print_util::print_array(&stack);

    // [region]{peek}
    // スタックの先頭要素にアクセスする
    let peek = stack.last().unwrap();
    // [endregion]{peek}
    print!("\nスタックの先頭要素 peek = {peek}");

    // [region]{pop}
    // 要素をポップする
    let pop = stack.pop().unwrap();
    // [endregion]{pop}
    print!("\nポップした要素 pop = {pop}、ポップ後 stack = ");
    print_util::print_array(&stack);

    // [region]{size}
    // スタックの長さを取得する
    let size = stack.len();
    // [endregion]{size}
    print!("\nスタックの長さ size = {size}");

    // [region]{is_empty}
    // スタックが空かどうかを判定する
    let is_empty = stack.is_empty();
    // [endregion]{is_empty}
    print!("\nスタックは空か = {is_empty}");
}
