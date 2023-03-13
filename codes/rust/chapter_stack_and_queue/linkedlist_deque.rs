/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: sjinzh (sjinzh@gmail.com)
 */

include!("../include/include.rs");

use std::rc::Rc;
use std::cell::RefCell;

/* 双向链表结点 */
pub struct ListNode<T> {
    pub val: T,                                 // 结点值
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // 后继结点引用（指针）
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // 前驱结点引用（指针）
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
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>,    // 头结点 front
    rear: Option<Rc<RefCell<ListNode<T>>>>,     // 尾结点 rear 
    que_size: usize,                            // 双向队列的长度
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0, 
        }
    }

    /* 获取双向队列的长度 */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* 判断双向队列是否为空 */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* 入队操作 */
    pub fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // 队首入队操作
        if is_front {
            // 将 node 添加至链表头部
            match self.front.take() {
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // 更新头结点
                }
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
            }
        // 队尾入队操作
        } else {
            // 将 node 添加至链表尾部
            match self.rear.take() {
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // 更新尾结点
                }
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
            }
        }
        self.que_size += 1;
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
    pub fn poll(&mut self, is_front: bool) -> Option<T> {
        if self.is_empty() {return None};
        // 队首出队操作
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front);   // 更新头结点
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1;
                Rc::try_unwrap(old_front).ok().unwrap().into_inner().val
            })
        // 队尾出队操作
        } else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear);     // 更新尾结点
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1;
                Rc::try_unwrap(old_rear).ok().unwrap().into_inner().val
            })
        }
    }

    /* 队首出队 */
    pub fn poll_first(&mut self) -> Option<T> {
        return self.poll(true);
    }

    /* 队尾出队 */
    pub fn poll_last(&mut self) -> Option<T> {
        return self.poll(false);
    }

    /* 访问队首元素 */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* 访问队尾元素 */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* 返回数组用于打印 */
    pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
        if let Some(node) = head {
            let mut nums = self.to_array(node.borrow().next.as_ref());
            nums.insert(0, node.borrow().val);
            return nums;
        }
        return Vec::new();
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
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 访问元素 */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\n队首元素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\n队尾元素 peek_last = {}", peek_last);

    /* 元素入队 */
    deque.push_last(4);
    print!("\n元素 4 队尾入队后 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\n元素 1 队首入队后 deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* 元素出队 */
    let poll_last = deque.poll_last().unwrap();
    print!("\n队尾出队元素 = {}，队尾出队后 deque = ", poll_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let poll_first = deque.poll_first().unwrap();
    print!("\n队首出队元素 = {}，队首出队后 deque = ", poll_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));   

    /* 获取双向队列的长度 */
    let size = deque.size();
    print!("\n双向队列长度 size = {}", size);

    /* 判断双向队列是否为空 */
    let is_empty = deque.is_empty();
    print!("\n双向队列是否为空 = {}", is_empty);
}