/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* 双方向連結リストノード */
pub struct ListNode<T> {
    pub val: T,                                 // ノード値
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 後継ノードへのポインタ
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前駆ノードへのポインタ
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

/* 双方向連結リストベースの両端キュー */
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

    /* 両端キューの長さを取得 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 両端キューが空かどうかを判定 */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* エンキュー操作 */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 先頭へのエンキュー操作
        if is_front {
            match self.front.take() {
                // 連結リストが空なら、front と rear の両方を node に向ける
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // node を連結リストの先頭に追加
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
                // 連結リストが空なら、front と rear の両方を node に向ける
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // node を連結リストの末尾に追加
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // 末尾ノードを更新する
                }
            }
        }
        self.que_size += 1; // キューの長さを更新
    }

    /* キュー先頭にエンキュー */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* キュー末尾にエンキュー */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* デキュー操作 */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // キューが空なら、そのまま `None` を返す
        if self.is_empty() {
            return None;
        };
        // キュー先頭からの取り出し
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
                self.que_size -= 1; // キューの長さを更新
                old_front.borrow().val
            })
        }
        // キュー末尾からの取り出し
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
                self.que_size -= 1; // キューの長さを更新
                old_rear.borrow().val
            })
        }
    }

    /* キュー先頭からデキュー */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* キュー末尾からデキュー */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* キュー先頭の要素にアクセス */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* キュー末尾の要素にアクセス */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* 出力用の配列を返す */
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

/* Driver Code */
fn main() {
    /* 両端キューを初期化 */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("両端キュー deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 要素にアクセス */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\n先頭要素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\n末尾要素 peek_last = {}", peek_last);

    /* 要素をエンキュー */
    deque.push_last(4);
    print!("\n要素 4 を末尾に追加後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\n要素 1 を先頭に追加後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 要素をデキュー */
    let pop_last = deque.pop_last().unwrap();
    print!("\n末尾から取り出した要素 = {}、取り出し後 deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\n先頭から取り出した要素 = {}、取り出し後 deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 両端キューの長さを取得 */
    let size = deque.size();
    print!("\n両端キューの長さ size = {}", size);

    /* 両端キューが空かどうかを判定 */
    let is_empty = deque.is_empty();
    print!("\n両端キューが空かどうか = {}", is_empty);
}
