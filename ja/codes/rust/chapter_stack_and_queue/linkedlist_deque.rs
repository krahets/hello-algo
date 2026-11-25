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
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 次のノードへのポインタ
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

/* 双方向連結リストを使った両端キュー */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 先頭ノード front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 末尾ノード rear
    que_size: usize,                         // 両端キューの要素数
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 両端キューの要素数を取得する */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 両端キューが空かどうかを判定する */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* 両端キューに要素を追加する */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 先頭に追加する
        if is_front {
            match self.front.take() {
                // リストが空なら、front と rear の両方が node を指すようにする
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // node をリストの先頭に追加する
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // 先頭ノードを更新する
                }
            }
        }
        // 末尾に追加する
        else {
            match self.rear.take() {
                // リストが空なら、front と rear の両方が node を指すようにする
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // node をリストの末尾に追加する
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // 末尾ノードを更新する
                }
            }
        }
        self.que_size += 1; // 両端キューの要素数を更新する
    }

    /* 先頭に追加する */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* 末尾に追加する */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* 両端キューから要素を取り出す */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // 両端キューが空なら、そのまま None を返す
        if self.is_empty() {
            return None;
        };
        // 先頭から取り出す
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
                self.que_size -= 1; // 両端キューの要素数を更新する
                old_front.borrow().val
            })
        }
        // 末尾から取り出す
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
                self.que_size -= 1; // 両端キューの要素数を更新する
                old_rear.borrow().val
            })
        }
    }

    /* 先頭から取り出す */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* 末尾から取り出す */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* 先頭ノードを参照する */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 末尾ノードを参照する */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* 表示用の Vec を返す */
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

/* 実行例 */
fn main() {
    /* 両端キューを初期化する */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("両端キュー deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 要素を参照する */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\n先頭要素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\n末尾要素 peek_last = {}", peek_last);

    /* 要素を両端キューに追加する */
    deque.push_last(4);
    print!("\n末尾に 4 を追加した後の deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\n先頭に 1 を追加した後の deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 両端キューから要素を取り出す */
    let pop_last = deque.pop_last().unwrap();
    print!("\n末尾から取り出した要素 = {}、末尾から取り出した後の deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\n先頭から取り出した要素 = {}、先頭から取り出した後の deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 両端キューの要素数を取得する */
    let size = deque.size();
    print!("\n両端キューの要素数 size = {}", size);

    /* 両端キューが空かどうかを判定する */
    let is_empty = deque.is_empty();
    print!("\n両端キューは空か = {}", is_empty);
}
