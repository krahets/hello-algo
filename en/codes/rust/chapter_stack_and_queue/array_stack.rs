/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Stack based on array implementation */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* Access top of the stack element */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* Get the length of the stack */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* Check if the stack is empty */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* Push */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* Pop */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* Return list for printing */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("Stack is empty")
        };
        self.stack.last()
    }

    /* Return &Vec */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* Driver Code */
fn main() {
    // Access top of the stack element
    let mut stack = ArrayStack::<i32>::new();

    // Elements push onto stack
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Stack stack = ");
    print_util::print_array(stack.to_array());

    // Return list for printing
    let peek = stack.peek().unwrap();
    print!("\nTop element peek = {}", peek);

    // Element pop from stack
    let pop = stack.pop().unwrap();
    print!("\nPop element pop = {pop}, after pop stack = ");
    print_util::print_array(stack.to_array());

    // Get the length of the stack
    let size = stack.size();
    print!("\nStack length size = {size}");

    // Check if empty
    let is_empty = stack.is_empty();
    print!("\nIs stack empty = {is_empty}");
}
