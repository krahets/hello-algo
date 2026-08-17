/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver Code */
pub fn main() {
    // Access top of the stack element
    // In Rust, it's recommended to use Vec as a stack
    let mut stack: Vec<i32> = Vec::new();

    // Elements push onto stack
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Stack stack = ");
    print_util::print_array(&stack);

    // Return list for printing
    let peek = stack.last().unwrap();
    print!("\nTop element peek = {peek}");

    // Element pop from stack
    let pop = stack.pop().unwrap();
    print!("\nPop element pop = {pop}, after pop stack = ");
    print_util::print_array(&stack);

    // Get the length of the stack
    let size = stack.len();
    print!("\nStack length size = {size}");

    // Check if the stack is empty
    let is_empty = stack.is_empty();
    print!("\nIs stack empty = {is_empty}");
}
