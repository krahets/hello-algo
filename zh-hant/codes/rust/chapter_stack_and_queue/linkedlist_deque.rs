/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* 雙向鏈結串列節點 */
pub struct ListNode<T> {
    pub val: T,                                 // 節點值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 後繼節點指標
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前驅節點指標
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

/* 基於雙向鏈結串列實現的雙向佇列 */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 頭節點 front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 尾節點 rear
    que_size: usize,                         // 雙向佇列的長度
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* 獲取雙向佇列的長度 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 判斷雙向佇列是否為空 */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* 入列操作 */
    pub fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 佇列首入列操作
        if is_front {
            match self.front.take() {
                // 若鏈結串列為空，則令 front 和 rear 都指向 node
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // 將 node 新增至鏈結串列頭部
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // 更新頭節點
                }
            }
        }
        // 佇列尾入列操作
        else {
            match self.rear.take() {
                // 若鏈結串列為空，則令 front 和 rear 都指向 node
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // 將 node 新增至鏈結串列尾部
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // 更新尾節點
                }
            }
        }
        self.que_size += 1; // 更新佇列長度
    }

    /* 佇列首入列 */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* 佇列尾入列 */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* 出列操作 */
    pub fn pop(&mut self, is_front: bool) -> Option<T> {
        // 若佇列為空，直接返回 None
        if self.is_empty() {
            return None;
        };
        // 佇列首出列操作
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // 更新頭節點
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // 更新佇列長度
                old_front.borrow().val
            })
        }
        // 佇列尾出列操作
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
                self.que_size -= 1; // 更新佇列長度
                old_rear.borrow().val
            })
        }
    }

    /* 佇列首出列 */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* 佇列尾出列 */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* 訪問佇列首元素 */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 訪問佇列尾元素 */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* 返回陣列用於列印 */
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
    /* 初始化雙向佇列 */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("雙向佇列 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 訪問元素 */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\n佇列首元素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\n佇列尾元素 peek_last = {}", peek_last);

    /* 元素入列 */
    deque.push_last(4);
    print!("\n元素 4 佇列尾入列後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\n元素 1 佇列首入列後 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 元素出列 */
    let pop_last = deque.pop_last().unwrap();
    print!("\n佇列尾出列元素 = {}，佇列尾出列後 deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\n佇列首出列元素 = {}，佇列首出列後 deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 獲取雙向佇列的長度 */
    let size = deque.size();
    print!("\n雙向佇列長度 size = {}", size);

    /* 判斷雙向佇列是否為空 */
    let is_empty = deque.is_empty();
    print!("\n雙向佇列是否為空 = {}", is_empty);
}
