/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::linked_list::{Display, ListNode};
use std::cell::RefCell;
use std::fmt;
use std::rc::Rc;

/* 基于链表实现的栈 */
pub struct LinkedListStack<T> {
    peek: Option<Rc<RefCell<ListNode<T>>>>, // 将头节点作为栈顶
    size: usize,                            // 栈的长度
}

impl<T> LinkedListStack<T> {
    #[allow(clippy::new_without_default)]
    pub fn new() -> Self {
        Self {
            peek: None,
            size: 0,
        }
    }

    /* 获取栈的长度 */
    pub fn size(&self) -> usize {
        self.size
    }

    /* 判断栈是否为空 */
    pub fn is_empty(&self) -> bool {
        self.size == 0
    }

    /* 入栈 */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.peek.take();
        self.peek = Some(node);
        self.size += 1;
    }

    /* 出栈 */
    pub fn pop(&mut self) -> Option<T>
    where
        T: Clone,
    {
        let peek = self.peek.take()?;
        let val = peek.borrow().val.clone();
        self.peek = peek.borrow_mut().next.take();
        self.size -= 1;
        Some(val)
    }

    /* 访问栈顶元素 */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.peek.as_ref()
    }

    /* 将 List 转化为 Array 并返回 */
    pub fn to_array(&self) -> Vec<T>
    where
        T: Clone,
    {
        let mut res = Vec::with_capacity(self.size);
        let mut next = self.peek.clone();
        while let Some(node) = next {
            let borrow = node.borrow();
            let val = borrow.val.clone();
            res.push(val);
            next = borrow.next.clone();
        }
        res
    }
}

impl<T> fmt::Display for LinkedListStack<T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{}", self.peek.display_as_array())
    }
}

/* Driver Code */
fn main() {
    /* 初始化栈 */
    let mut stack = LinkedListStack::new();

    /* 元素入栈 */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    println!("栈 stack = {stack}");

    /* 访问栈顶元素 */
    let peek = stack.peek().unwrap().borrow().val;
    println!("栈顶元素 peek = {peek}");

    /* 元素出栈 */
    let pop = stack.pop().unwrap();
    println!("出栈元素 pop = {pop}，出栈后 stack = {stack}");

    /* 获取栈的长度 */
    let size = stack.size();
    println!("栈的长度 size = {size}");

    /* 判断是否为空 */
    let is_empty = stack.is_empty();
    println!("栈是否为空 = {is_empty}");
}
