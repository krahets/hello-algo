/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver Code */
pub fn main() {
    // スタックを初期化する
    // Rust では、Vec をスタックとして使うことが推奨される
    let mut stack: Vec<i32> = Vec::new();

    // 要素をプッシュ
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("スタック stack = ");
    print_util::print_array(&stack);

    // スタックトップの要素にアクセス
    let peek = stack.last().unwrap();
    print!("\nスタックトップ要素 peek = {peek}");

    // 要素をポップ
    let pop = stack.pop().unwrap();
    print!("\n取り出した要素 pop = {pop}、取り出し後 stack = ");
    print_util::print_array(&stack);

    // スタックの長さを取得
    let size = stack.len();
    print!("\nスタックの長さ size = {size}");

    // スタックが空かどうかを判定
    let is_empty = stack.is_empty();
    print!("\nスタックが空かどうか = {is_empty}");
}
