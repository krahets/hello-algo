/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver code */
pub fn main() {
    // Initialize the stack
    // In Rust, Vec is the recommended choice for a stack
    let mut stack: Vec<i32> = Vec::new();

    // Push elements onto the stack
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("stack = ");
    print_util::print_array(&stack);

    // Peek at the top element
    let peek = stack.last().unwrap();
    print!("\nTop element (peek) = {peek}");

    // Pop the top element
    let pop = stack.pop().unwrap();
    print!("\nPopped element (pop) = {pop}, stack after the pop = ");
    print_util::print_array(&stack);

    // Get the stack size
    let size = stack.len();
    print!("\nStack size = {size}");

    // Check whether the stack is empty
    let is_empty = stack.is_empty();
    print!("\nStack is empty = {is_empty}");
}
