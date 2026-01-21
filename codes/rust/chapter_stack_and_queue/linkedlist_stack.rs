/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;
use hello_algo_rust::linked_list::ListNode;
use std::cell::RefCell;
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
    print!("栈 stack = ");
    print_util::print_array(&stack.to_array());

    /* 访问栈顶元素 */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\n栈顶元素 peek = {}", peek);

    /* 元素出栈 */
    let pop = stack.pop().unwrap();
    print!("\n出栈元素 pop = {}，出栈后 stack = ", pop);
    print_util::print_array(&stack.to_array());

    /* 获取栈的长度 */
    let size = stack.size();
    print!("\n栈的长度 size = {}", size);

    /* 判断是否为空 */
    let is_empty = stack.is_empty();
    print!("\n栈是否为空 = {}", is_empty);
}
