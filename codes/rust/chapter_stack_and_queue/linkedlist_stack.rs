/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* 基于链表实现的栈 */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // 将头节点作为栈顶
    stk_size: usize,                              // 栈的长度
}

impl<T: Copy> LinkedListStack<T> {
    pub fn new() -> Self {
        Self {
            stack_peek: None,
            stk_size: 0,
        }
    }

    /* 获取栈的长度 */
    pub fn size(&self) -> usize {
        return self.stk_size;
    }

    /* 判断栈是否为空 */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* 入栈 */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.stack_peek.take();
        self.stack_peek = Some(node);
        self.stk_size += 1;
    }

    /* 出栈 */
    pub fn pop(&mut self) -> Option<T> {
        self.stack_peek.take().map(|old_head| {
            match old_head.borrow_mut().next.take() {
                Some(new_head) => {
                    self.stack_peek = Some(new_head);
                }
                None => {
                    self.stack_peek = None;
                }
            }
            self.stk_size -= 1;
            Rc::try_unwrap(old_head).ok().unwrap().into_inner().val
        })
    }

    /* 访问栈顶元素 */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* 将 List 转化为 Array 并返回 */
    pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
        if let Some(node) = head {
            let mut nums = self.to_array(node.borrow().next.as_ref());
            nums.push(node.borrow().val);
            return nums;
        }
        return Vec::new();
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
    print_util::print_array(&stack.to_array(stack.peek()));

    /* 访问栈顶元素 */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\n栈顶元素 peek = {}", peek);

    /* 元素出栈 */
    let pop = stack.pop().unwrap();
    print!("\n出栈元素 pop = {}，出栈后 stack = ", pop);
    print_util::print_array(&stack.to_array(stack.peek()));

    /* 获取栈的长度 */
    let size = stack.size();
    print!("\n栈的长度 size = {}", size);

    /* 判断是否为空 */
    let is_empty = stack.is_empty();
    print!("\n栈是否为空 = {}", is_empty);
}
