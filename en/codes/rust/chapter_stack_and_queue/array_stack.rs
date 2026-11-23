/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Stack implemented with an array */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* Initialize the stack */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* Get the stack size */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* Check whether the stack is empty */
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

    /* Access the top element */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("Stack is empty")
        };
        self.stack.last()
    }

    /* Return a reference to the vector */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* Driver code */
fn main() {
    // Initialize the stack
    let mut stack = ArrayStack::<i32>::new();

    // Push elements onto the stack
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Stack stack = ");
    print_util::print_array(stack.to_array());

    //Access the top element
    let peek = stack.peek().unwrap();
    print!("\nTop element peek = {}", peek);

    // Pop an element from the stack
    let pop = stack.pop().unwrap();
    print!("\nPopped element pop = {pop}; after popping, stack = ");
    print_util::print_array(stack.to_array());

    // Get the stack size
    let size = stack.size();
    print!("\nStack size = {size}");

    // Check whether it is empty
    let is_empty = stack.is_empty();
    print!("\nIs the stack empty? {is_empty}");
}
