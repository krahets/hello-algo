/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 連結リストで実装したキュー */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 先頭ノード front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 末尾ノード rear
    que_size: usize,                         // キューの長さ
}

impl<T: Copy> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* キューの長さを取得 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* キューが空か判定 */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* エンキュー */
    pub fn push(&mut self, num: T) {
        // 末尾ノードの後ろに num を追加する
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // キューが空でない場合、このノードを末尾ノードの後ろに追加する
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // キューが空の場合、先頭と末尾の両方がこのノードを指すようにする
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.que_size += 1;
    }

    /* デキュー */
    pub fn pop(&mut self) -> Option<T> {
        self.front.take().map(|old_front| {
            match old_front.borrow_mut().next.take() {
                Some(new_front) => {
                    self.front = Some(new_front);
                }
                None => {
                    self.rear.take();
                }
            }
            self.que_size -= 1;
            old_front.borrow().val
        })
    }

    /* キューの先頭要素にアクセス */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 連結リストを Array に変換して返す */
    pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
        let mut res: Vec<T> = Vec::new();

        fn recur<T: Copy>(cur: Option<&Rc<RefCell<ListNode<T>>>>, res: &mut Vec<T>) {
            if let Some(cur) = cur {
                res.push(cur.borrow().val);
                recur(cur.borrow().next.as_ref(), res);
            }
        }

        recur(head, &mut res);

        res
    }
}

/* 実行用コード */
fn main() {
    /* キューを初期化する */
    let mut queue = LinkedListQueue::new();

    /* 要素をエンキューする */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("キュー queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* キューの先頭要素にアクセス */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\nキューの先頭要素 peek = {}", peek);

    /* 要素をデキューする */
    let pop = queue.pop().unwrap();
    print!("\nデキューした要素 pop = {}、デキュー後 queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* キューの長さを取得 */
    let size = queue.size();
    print!("\nキューの長さ size = {}", size);

    /* キューが空か判定 */
    let is_empty = queue.is_empty();
    print!("\nキューは空か = {}", is_empty);
}
