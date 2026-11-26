/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 実行例 */
pub fn main() {
    // スタックを初期化する
    // Rust では Vec をスタックとして使うのが推奨される
    let mut stack: Vec<i32> = Vec::new();

    // 要素をプッシュする
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("スタック stack = ");
    print_util::print_array(&stack);

    // スタックのトップを参照する
    let peek = stack.last().unwrap();
    print!("\nスタックのトップの要素 peek = {peek}");

    // 要素をポップする
    let pop = stack.pop().unwrap();
    print!("\nポップした要素 pop = {pop}、ポップ後の stack = ");
    print_util::print_array(&stack);

    // スタックの要素数を取得する
    let size = stack.len();
    print!("\nスタックの要素数 size = {size}");

    // スタックが空かどうかを判定する
    let is_empty = stack.is_empty();
    print!("\nスタックは空か = {is_empty}");
}
