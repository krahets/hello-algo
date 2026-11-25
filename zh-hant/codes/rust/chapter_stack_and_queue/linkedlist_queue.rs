/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 以鏈結串列實作佇列 */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // front 指向首節點
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // rear 指向尾節點
    que_size: usize,                         // 佇列長度
}

impl<T: Copy> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 取得佇列長度 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 判斷佇列是否為空 */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* 入隊 */
    pub fn push(&mut self, num: T) {
        // 建立存有 num 的新節點，準備接到隊尾
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // 若佇列非空，將新節點接在尾節點之後
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // 若佇列為空，讓隊首與隊尾都指向新節點
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.que_size += 1;
    }

    /* 出隊 */
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

    /* 取得隊首節點的參照 */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 將鏈結串列轉成 Vec 並回傳 */
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
    /* 初始化佇列 */
    let mut queue = LinkedListQueue::new();

    /* 將元素加入佇列 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("佇列 queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* 讀取隊首元素 */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\n隊首元素 peek = {}", peek);

    /* 從佇列取出元素 */
    let pop = queue.pop().unwrap();
    print!("\n出隊元素 pop = {}，出隊後 queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* 取得佇列長度 */
    let size = queue.size();
    print!("\n佇列長度 size = {}", size);

    /* 判斷佇列是否為空 */
    let is_empty = queue.is_empty();
    print!("\n佇列是否為空 = {}", is_empty);
}
