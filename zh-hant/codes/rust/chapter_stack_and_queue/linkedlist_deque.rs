/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* 雙向鏈結串列的節點 */
pub struct ListNode<T> {
    pub val: T,                                 // 節點值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 指向下一個節點的智慧指標
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 指向上一個節點的智慧指標
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

/* 以雙向鏈結串列實作雙端佇列 */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // front 指向首節點
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // rear 指向尾節點
    que_size: usize,                         // 雙端佇列長度
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 取得雙端佇列長度 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 判斷雙端佇列是否為空 */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* 加入元素 */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 從隊首加入元素
        if is_front {
            match self.front.take() {
                // 若鏈結串列為空，讓 front 和 rear 都指向 node
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // 將 node 加到鏈結串列的開頭
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // 更新首節點
                }
            }
        }
        // 從隊尾加入元素
        else {
            match self.rear.take() {
                // 若鏈結串列為空，讓 front 和 rear 都指向 node
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // 將 node 加到鏈結串列的末端
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // 更新尾節點
                }
            }
        }
        self.que_size += 1; // 將雙端佇列長度加 1
    }

    /* 從隊首加入元素 */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* 從隊尾加入元素 */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* 取出元素 */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // 若佇列為空，直接回傳 None
        if self.is_empty() {
            return None;
        };
        // 從隊首取出元素
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // 更新首節點
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // 將雙端佇列長度減 1
                old_front.borrow().val
            })
        }
        // 從隊尾取出元素
        else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear); // 更新尾節點
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1; // 將雙端佇列長度減 1
                old_rear.borrow().val
            })
        }
    }

    /* 從隊首取出元素 */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* 從隊尾取出元素 */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* 取得隊首節點的參照 */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 取得隊尾節點的參照 */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* 回傳 Vec 以便輸出 */
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

/* 範例程式 */
fn main() {
    /* 初始化雙端佇列 */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("雙端佇列 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 讀取隊首與隊尾元素 */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\n隊首元素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\n隊尾元素 peek_last = {}", peek_last);

    /* 將元素加入雙端佇列 */
    deque.push_last(4);
    print!("\n將元素 4 加到隊尾後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\n將元素 1 加到隊首後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 從雙端佇列取出元素 */
    let pop_last = deque.pop_last().unwrap();
    print!("\n從隊尾取出的元素 = {}，取出後 deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\n從隊首取出的元素 = {}，取出後 deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 取得雙端佇列長度 */
    let size = deque.size();
    print!("\n雙端佇列長度 size = {}", size);

    /* 判斷雙端佇列是否為空 */
    let is_empty = deque.is_empty();
    print!("\n雙端佇列是否為空 = {}", is_empty);
}
