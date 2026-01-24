/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::linked_list::{LinkedList, ListNode};
use std::cell::RefCell;
use std::fmt;
use std::rc::Rc;

/* 基于链表实现的队列 */
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // 头节点 front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // 尾节点 rear
    size: usize,                             // 队列的长度
}

impl<T> LinkedListQueue<T> {
    #[allow(clippy::new_without_default)]
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            size: 0,
        }
    }

    /* 获取队列的长度 */
    pub fn size(&self) -> usize {
        self.size
    }

    /* 判断队列是否为空 */
    pub fn is_empty(&self) -> bool {
        self.size == 0
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
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
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

impl<T> fmt::Display for LinkedListQueue<T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.front.display_as_array())
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
    println!("队列 queue = {queue}");

    /* 访问队首元素 */
    let peek = queue.peek().unwrap().borrow().val;
    println!("队首元素 peek = {peek}");

    /* 元素出队 */
    let pop = queue.pop().unwrap();
    println!("出队元素 pop = {pop}，出队后 queue = {queue}");

    /* 获取队列的长度 */
    let size = queue.size();
    println!("队列长度 size = {size}");

    /* 判断队列是否为空 */
    let is_empty = queue.is_empty();
    println!("队列是否为空 = {is_empty}");
}
