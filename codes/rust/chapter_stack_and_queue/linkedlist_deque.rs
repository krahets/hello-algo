/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* 双向链表节点 */
pub struct ListNode<T> {
    val: T,                                 // 节点值
    next: Option<Rc<RefCell<ListNode<T>>>>, // 后继节点指针
    prev: Option<Rc<RefCell<ListNode<T>>>>, // 前驱节点指针
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

/* 基于双向链表实现的双向队列 */
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 头节点
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 尾节点
    size: usize,                             // 双向队列的长度
}

impl<T> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            size: 0,
        }
    }

    /* 获取双向队列的长度 */
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* 判断双向队列是否为空 */
    pub fn is_empty(&self) -> bool {
        return self.size == 0;
    }

    /* 入队操作 */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 队首入队操作
        if is_front {
            match self.front.take() {
                // 若链表为空，则令 front 和 rear 都指向 node
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // 将 node 添加至链表头部
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    // 更新头节点
                    self.front = Some(node);
                }
            }
        }
        // 队尾入队操作
        else {
            match self.rear.take() {
                // 若链表为空，则令 front 和 rear 都指向 node
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // 将 node 添加至链表尾部
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    // 更新尾节点
                    self.rear = Some(node);
                }
            }
        }
        // 更新队列长度
        self.size += 1;
    }

    /* 队首入队 */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* 队尾入队 */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* 出队操作 */
    fn pop(&mut self, is_front: bool) -> Option<T>
    where
        T: Clone,
    {
        // 若队列为空，直接返回 None
        if self.is_empty() {
            return None;
        }
        // 队首出队操作
        if is_front {
            let old_front = self.front.take()?;
            match old_front.borrow_mut().next.take() {
                Some(new_front) => {
                    new_front.borrow_mut().prev = None;
                    // 更新头节点
                    self.front = Some(new_front);
                }
                None => {
                    self.rear = None;
                }
            }
            // 更新队列长度
            self.size -= 1;
            let val = old_front.borrow().val.clone();
            Some(val)
        }
        // 队尾出队操作
        else {
            let old_rear = self.rear.take()?;
            match old_rear.borrow_mut().prev.take() {
                Some(new_rear) => {
                    new_rear.borrow_mut().next = None;
                    // 更新尾节点
                    self.rear = Some(new_rear);
                }
                None => {
                    self.front = None;
                }
            }
            // 更新队列长度
            self.size -= 1;
            let val = old_rear.borrow().val.clone();
            Some(val)
        }
    }

    /* 队首出队 */
    pub fn pop_first(&mut self) -> Option<T>
    where
        T: Clone,
    {
        self.pop(true)
    }

    /* 队尾出队 */
    pub fn pop_last(&mut self) -> Option<T>
    where
        T: Clone,
    {
        self.pop(false)
    }

    /* 访问队首元素 */
    pub fn peek_first(&self) -> &Option<Rc<RefCell<ListNode<T>>>> {
        &self.front
    }

    /* 访问队尾元素 */
    pub fn peek_last(&self) -> &Option<Rc<RefCell<ListNode<T>>>> {
        &self.rear
    }

    /* 返回数组用于打印 */
    pub fn to_array(&self) -> Vec<T>
    where
        T: Clone,
    {
        let mut res = Vec::with_capacity(self.size);
        let mut next = self.front.clone();
        while let Some(node) = next {
            let borrow = node.borrow();
            let val = borrow.val.clone();
            res.push(val);
            next = borrow.next.clone();
        }
        res
    }
}

/* Driver Code */
fn main() {
    /* 初始化双向队列 */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("双向队列 deque = ");
    print_util::print_array(&deque.to_array());

    /* 访问元素 */
    let peek_first = deque.peek_first().as_ref().unwrap().borrow().val;
    print!("\n队首元素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().as_ref().unwrap().borrow().val;
    print!("\n队尾元素 peek_last = {}", peek_last);

    /* 元素入队 */
    deque.push_last(4);
    print!("\n元素 4 队尾入队后 deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n元素 1 队首入队后 deque = ");
    print_util::print_array(&deque.to_array());

    /* 元素出队 */
    let pop_last = deque.pop_last().unwrap();
    print!("\n队尾出队元素 = {}，队尾出队后 deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first().unwrap();
    print!("\n队首出队元素 = {}，队首出队后 deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 获取双向队列的长度 */
    let size = deque.size();
    print!("\n双向队列长度 size = {}", size);

    /* 判断双向队列是否为空 */
    let is_empty = deque.is_empty();
    print!("\n双向队列是否为空 = {}", is_empty);
}
