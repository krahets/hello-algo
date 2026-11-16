/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver code */
pub fn main() {
    // [region]{init_stack}
    // Initialize the stack
    // In Rust, Vec is the recommended type for implementing a stack
    let mut stack: Vec<i32> = Vec::new();
    // [endregion]{init_stack}

    // [region]{push}
    // Push elements onto the stack
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    print!("Stack stack = ");
    print_util::print_array(&stack);

    // [region]{peek}
    // Access the top element
    let peek = stack.last().unwrap();
    // [endregion]{peek}
    print!("\nTop element peek = {peek}");

    // [region]{pop}
    // Pop an element from the stack
    let pop = stack.pop().unwrap();
    // [endregion]{pop}
    print!("\nPopped element pop = {pop}; after popping, stack = ");
    print_util::print_array(&stack);

    // [region]{size}
    // Get the stack size
    let size = stack.len();
    // [endregion]{size}
    print!("\nStack size = {size}");

    // [region]{is_empty}
    // Check whether the stack is empty
    let is_empty = stack.is_empty();
    // [endregion]{is_empty}
    print!("\nIs the stack empty? {is_empty}");
}
