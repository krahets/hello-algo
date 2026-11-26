/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* Stack backed by a linked list */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // Use the head node as the top of the stack
    stk_size: usize,                              // Stack size
}

impl<T: Copy> LinkedListStack<T> {
    pub fn new() -> Self {
        Self {
            stack_peek: None,
            stk_size: 0,
        }
    }

    /* Get the stack size */
    pub fn size(&self) -> usize {
        return self.stk_size;
    }

    /* Check whether the stack is empty */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* Push an element onto the stack */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.stack_peek.take();
        self.stack_peek = Some(node);
        self.stk_size += 1;
    }

    /* Remove and return the top element */
    pub fn pop(&mut self) -> Option<T> {
        self.stack_peek.take().map(|old_head| {
            self.stack_peek = old_head.borrow_mut().next.take();
            self.stk_size -= 1;

            old_head.borrow().val
        })
    }

    /* Get a reference to the top node */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* Return the linked list elements as a vector */
    pub fn to_array(&self) -> Vec<T> {
        fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            if let Some(node) = head {
                let mut nums = _to_array(node.borrow().next.as_ref());
                nums.push(node.borrow().val);
                return nums;
            }
            return Vec::new();
        }

        _to_array(self.peek())
    }
}

/* Driver code */
fn main() {
    /* Initialize the stack */
    let mut stack = LinkedListStack::new();

    /* Push elements onto the stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("stack = ");
    print_util::print_array(&stack.to_array());

    /* Peek at the top element */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\nTop element (peek) = {}", peek);

    /* Pop the top element */
    let pop = stack.pop().unwrap();
    print!("\nPopped element (pop) = {}, stack after the pop = ", pop);
    print_util::print_array(&stack.to_array());

    /* Get the stack size */
    let size = stack.size();
    print!("\nStack size = {}", size);

    /* Check whether the stack is empty */
    let is_empty = stack.is_empty();
    print!("\nStack is empty = {}", is_empty);
}
