/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver Code */
pub fn main() {
    // Инициализировать стек
    // В Rust рекомендуется использовать Vec как стек
    let mut stack: Vec<i32> = Vec::new();

    // Помещение элемента в стек
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Стек stack = ");
    print_util::print_array(&stack);

    // Доступ к верхнему элементу стека
    let peek = stack.last().unwrap();
    print!("\nВерхний элемент peek = {peek}");

    // Извлечение элемента из стека
    let pop = stack.pop().unwrap();
    print!("\nИзвлеченный элемент pop = {pop}, stack после извлечения = ");
    print_util::print_array(&stack);

    // Получение длины стека
    let size = stack.len();
    print!("\nДлина стека size = {size}");

    // Проверка, пуст ли стек
    let is_empty = stack.is_empty();
    print!("\nПуст ли стек = {is_empty}");
}
