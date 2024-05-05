/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

/* Driver Code */
pub fn main() {
    // Initialize stack
    // In Rust, it's recommended to use Vec as a stack
    let mut stack: Vec<i32> = Vec::new();

    // Element push
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Stack stack =");
    print_util::print_array(&stack);

    // Access stack top element
    let peek = stack.last().unwrap();
    print!("\nTop element of the stack peek = {peek}");

    // Element pop
    let pop = stack.pop().unwrap();
    print!("\nPopped element = {pop}, after popping stack = ");
    print_util::print_array(&stack);

    // Get the length of the stack
    let size = stack.len();
    print!("\nLength of the stack size = {size}");

    // Determine if the stack is empty
    let is_empty = stack.is_empty();
    print!("\nIs the stack empty = {is_empty}");
}
