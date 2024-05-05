/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use list_node::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* Stack class based on linked list */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // Use the head node as the top of the stack
    stk_size: usize,                              // Length of the stack
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

    /* Determine if the stack is empty */
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

    /* Access stack top element */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* Convert the List to Array and return */
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
    /* Initialize stack */
    let mut stack = LinkedListStack::new();

    /* Element push */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Stack stack =");
    print_util::print_array(&stack.to_array(stack.peek()));

    /* Access stack top element */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\nTop element of the stack peek = {}", peek);

    /* Element pop */
    let pop = stack.pop().unwrap();
    print!("\nPopped element = {}, after popping stack = ", pop);
    print_util::print_array(&stack.to_array(stack.peek()));

    /* Get the length of the stack */
    let size = stack.size();
    print!("\nLength of the stack size = {}", size);

    /* Determine if it's empty */
    let is_empty = stack.is_empty();
    print!("\nIs the stack empty = {}", is_empty);
}
