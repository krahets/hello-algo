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

    // Поместить элемент в стек
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("стек stack =");
    print_util::print_array(&stack);

    // Получить верхний элемент стека
    let peek = stack.last().unwrap();
    print!("\nвершина стекаэлемент peek = {peek}");

    // Извлечь элемент из стека
    let pop = stack.pop().unwrap();
    print!("\nизвлечение из стекаэлемент pop = {pop}, извлечение из стекапосле stack =");
    print_util::print_array(&stack);

    // Получить длину стека
    let size = stack.len();
    print!("\nДлина стека size = {size}");

    // Проверить, пуст ли стек
    let is_empty = stack.is_empty();
    print!("\nСтек пуст: {is_empty}");
}
