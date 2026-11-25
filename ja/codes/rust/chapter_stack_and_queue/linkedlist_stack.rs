/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 連結リストを使ったスタック */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 先頭ノードをスタックのトップとする
    stk_size: usize,                              // スタックの要素数
}

impl<T: Copy> LinkedListStack<T> {
    pub fn new() -> Self {
        Self {
            stack_peek: None,
            stk_size: 0,
        }
    }

    /* スタックの要素数を取得する */
    pub fn size(&self) -> usize {
        return self.stk_size;
    }

    /* スタックが空かどうかを判定する */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* プッシュする */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.stack_peek.take();
        self.stack_peek = Some(node);
        self.stk_size += 1;
    }

    /* ポップする */
    pub fn pop(&mut self) -> Option<T> {
        self.stack_peek.take().map(|old_head| {
            self.stack_peek = old_head.borrow_mut().next.take();
            self.stk_size -= 1;

            old_head.borrow().val
        })
    }

    /* スタックのトップのノードを参照する */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* 連結リストを Vec に変換して返す */
    pub fn to_array(&self) -> Vec<T> {
        fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            if let Some(node) = head {
                let mut nums = _to_array(node.borrow().next.as_ref());
                nums.push(node.borrow().val);
                return nums;
            }
            return Vec::new();
        }

        _to_array(self.peek())
    }
}

/* 実行例 */
fn main() {
    /* スタックを初期化する */
    let mut stack = LinkedListStack::new();

    /* 要素をプッシュする */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("スタック stack = ");
    print_util::print_array(&stack.to_array());

    /* スタックのトップを参照する */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\nスタックのトップの要素 peek = {}", peek);

    /* 要素をポップする */
    let pop = stack.pop().unwrap();
    print!("\nポップした要素 pop = {}、ポップ後の stack = ", pop);
    print_util::print_array(&stack.to_array());

    /* スタックの要素数を取得する */
    let size = stack.size();
    print!("\nスタックの要素数 size = {}", size);

    /* 空かどうかを判定する */
    let is_empty = stack.is_empty();
    print!("\nスタックは空か = {}", is_empty);
}
