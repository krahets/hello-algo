/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 配列で実装したスタック */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* スタックを初期化する */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* スタックの長さを取得する */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* スタックが空かどうかを判定する */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* プッシュ */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* ポップ */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* スタックの先頭要素にアクセスする */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("スタックが空です")
        };
        self.stack.last()
    }

    /* &Vec を返す */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* 実行用コード */
fn main() {
    // スタックを初期化する
    let mut stack = ArrayStack::<i32>::new();

    // 要素をプッシュする
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("スタック stack = ");
    print_util::print_array(stack.to_array());

    //スタックの先頭要素にアクセスする
    let peek = stack.peek().unwrap();
    print!("\nスタックの先頭要素 peek = {}", peek);

    // 要素をポップする
    let pop = stack.pop().unwrap();
    print!("\nポップした要素 pop = {pop}、ポップ後 stack = ");
    print_util::print_array(stack.to_array());

    // スタックの長さを取得する
    let size = stack.size();
    print!("\nスタックの長さ size = {size}");

    // 空かどうかを判定する
    let is_empty = stack.is_empty();
    print!("\nスタックは空か = {is_empty}");
}
