/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* 双方向連結リストのノード */
pub struct ListNode<T> {
    pub val: T,                                 // ノードの値
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 後続ノードへのポインタ
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前のノードへのポインタ
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode {
            val,
            next: None,
            prev: None,
        }))
    }
}

/* 双方向連結リストで実装した両端キュー */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 先頭ノード front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 末尾ノード rear
    que_size: usize,                         // 両端キューの長さ
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 両端キューの長さを取得する */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 両端キューが空かどうかを判定する */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* エンキュー操作 */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 先頭へのエンキュー操作
        if is_front {
            match self.front.take() {
                // 連結リストが空の場合、front と rear の両方が node を指すようにする
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // node を連結リストの先頭に追加する
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // 先頭ノードを更新する
                }
            }
        }
        // 末尾へのエンキュー操作
        else {
            match self.rear.take() {
                // 連結リストが空の場合、front と rear の両方が node を指すようにする
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // node を連結リストの末尾に追加する
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // 末尾ノードを更新する
                }
            }
        }
        self.que_size += 1; // キューの長さを更新する
    }

    /* 先頭にエンキューする */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* 末尾にエンキューする */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* デキュー操作 */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // キューが空の場合、そのまま None を返す
        if self.is_empty() {
            return None;
        };
        // 先頭からのデキュー操作
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // 先頭ノードを更新する
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // キューの長さを更新する
                old_front.borrow().val
            })
        }
        // 末尾からのデキュー操作
        else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear); // 末尾ノードを更新する
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1; // キューの長さを更新する
                old_rear.borrow().val
            })
        }
    }

    /* 先頭からデキューする */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* 末尾からデキューする */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* キューの先頭要素にアクセス */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* キューの末尾要素にアクセスする */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* 表示用の配列を返す */
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
    /* 両端キューを初期化する */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("両端キュー deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 要素にアクセスする */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\nキューの先頭要素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\nキューの末尾要素 peek_last = {}", peek_last);

    /* 要素をエンキューする */
    deque.push_last(4);
    print!("\n要素 4 を末尾にエンキューした後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\n要素 1 を先頭にエンキューした後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 要素をデキューする */
    let pop_last = deque.pop_last().unwrap();
    print!("\n末尾からデキューした要素 = {}、末尾からデキューした後 deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\n先頭からデキューした要素 = {}、先頭からデキューした後 deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 両端キューの長さを取得する */
    let size = deque.size();
    print!("\n両端キューの長さ size = {}", size);

    /* 両端キューが空かどうかを判定する */
    let is_empty = deque.is_empty();
    print!("\n両端キューは空か = {}", is_empty);
}
