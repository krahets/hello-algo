/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 基於鏈結串列實現的佇列 */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 頭節點 front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 尾節點 rear
    que_size: usize,                         // 佇列的長度
}

impl<T: Copy> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 獲取佇列的長度 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 判斷佇列是否為空 */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* 入列 */
    pub fn push(&mut self, num: T) {
        // 在尾節點後新增 num
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // 如果佇列不為空，則將該節點新增到尾節點後
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // 如果佇列為空，則令頭、尾節點都指向該節點
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.que_size += 1;
    }

    /* 出列 */
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

    /* 訪問佇列首元素 */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 將鏈結串列轉化為 Array 並返回 */
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
    /* 初始化佇列 */
    let mut queue = LinkedListQueue::new();

    /* 元素入列 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("佇列 queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* 訪問佇列首元素 */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\n佇列首元素 peek = {}", peek);

    /* 元素出列 */
    let pop = queue.pop().unwrap();
    print!("\n出列元素 pop = {}，出列後 queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* 獲取佇列的長度 */
    let size = queue.size();
    print!("\n佇列長度 size = {}", size);

    /* 判斷佇列是否為空 */
    let is_empty = queue.is_empty();
    print!("\n佇列是否為空 = {}", is_empty);
}
