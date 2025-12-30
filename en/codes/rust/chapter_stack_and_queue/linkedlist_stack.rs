/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* Stack based on linked list implementation */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // Use head node as stack top
    stk_size: usize,                              // Stack length
}

impl<T: Copy> LinkedListStack<T> {
    pub fn new() -> Self {
        Self {
            stack_peek: None,
            stk_size: 0,
        }
    }

    /* Get the length of the stack */
    pub fn size(&self) -> usize {
        return self.stk_size;
    }

    /* Check if the stack is empty */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* Push */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.stack_peek.take();
        self.stack_peek = Some(node);
        self.stk_size += 1;
    }

    /* Pop */
    pub fn pop(&mut self) -> Option<T> {
        self.stack_peek.take().map(|old_head| {
            self.stack_peek = old_head.borrow_mut().next.take();
            self.stk_size -= 1;

            old_head.borrow().val
        })
    }

    /* Return list for printing */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* Convert List to Array and return */
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

/* Driver Code */
fn main() {
    /* Access top of the stack element */
    let mut stack = LinkedListStack::new();

    /* Elements push onto stack */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Stack stack = ");
    print_util::print_array(&stack.to_array());

    /* Return list for printing */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\nTop element peek = {}", peek);

    /* Element pop from stack */
    let pop = stack.pop().unwrap();
    print!("\nPop element pop = {}, after pop stack = ", pop);
    print_util::print_array(&stack.to_array());

    /* Get the length of the stack */
    let size = stack.size();
    print!("\nStack length size = {}", size);

    /* Check if empty */
    let is_empty = stack.is_empty();
    print!("\nIs stack empty = {}", is_empty);
}
