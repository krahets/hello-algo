/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

/* Stack class based on array */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* Initialize stack */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* Get the length of the stack */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* Determine if the stack is empty */
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

    /* Access stack top element */
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
    // Initialize stack
    let mut stack = ArrayStack::<i32>::new();

    // Element push
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Stack stack =");
    print_util::print_array(stack.to_array());

    //Access stack top element
    let peek = stack.peek().unwrap();
    print!("\nTop element of the stack peek = {}", peek);

    // Element pop
    let pop = stack.pop().unwrap();
    print!("\nPopped element = {pop}, after popping stack = ");
    print_util::print_array(stack.to_array());

    // Get the length of the stack
    let size = stack.size();
    print!("\nLength of the stack size = {size}");

    // Determine if it's empty
    let is_empty = stack.is_empty();
    print!("\nIs the stack empty = {is_empty}");
}
