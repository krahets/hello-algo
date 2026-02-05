/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{ListNode, print_util};

use std::cell::RefCell;
use std::rc::Rc;

/* 基于链表实现的队列 */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 头节点 front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 尾节点 rear
    size: usize,                             // 队列的长度
}

impl<T> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            size: 0,
        }
    }

    /* 获取队列的长度 */
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* 判断队列是否为空 */
    pub fn is_empty(&self) -> bool {
        return self.size == 0;
    }

    /* 入队 */
    pub fn push(&mut self, num: T) {
        // 在尾节点后添加 num
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // 如果队列不为空，则将该节点添加到尾节点后
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // 如果队列为空，则令头、尾节点都指向该节点
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.size += 1;
    }

    /* 出队 */
    pub fn pop(&mut self) -> Option<T>
    where
        T: Clone,
    {
        let old_front = self.front.take()?;
        match old_front.borrow_mut().next.take() {
            Some(new_front) => {
                self.front = Some(new_front);
            }
            None => {
                self.rear = None;
            }
        }
        self.size -= 1;
        let val = old_front.borrow().val.clone();
        Some(val)
    }

    /* 访问队首元素 */
    pub fn peek(&self) -> &Option<Rc<RefCell<ListNode<T>>>> {
        &self.front
    }

    /* 将链表转化为 Array 并返回 */
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
    /* 初始化队列 */
    let mut queue = LinkedListQueue::new();

    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("队列 queue = ");
    print_util::print_array(&queue.to_array());

    /* 访问队首元素 */
    let peek = queue.peek().as_ref().unwrap().borrow().val;
    print!("\n队首元素 peek = {}", peek);

    /* 元素出队 */
    let pop = queue.pop().unwrap();
    print!("\n出队元素 pop = {}，出队后 queue = ", pop);
    print_util::print_array(&queue.to_array());

    /* 获取队列的长度 */
    let size = queue.size();
    print!("\n队列长度 size = {}", size);

    /* 判断队列是否为空 */
    let is_empty = queue.is_empty();
    print!("\n队列是否为空 = {}", is_empty);
}
