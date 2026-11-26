/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Пример использования */
pub fn main() {
    // Инициализировать стек
    // В Rust для реализации стека рекомендуется использовать Vec
    let mut stack: Vec<i32> = Vec::new();

    // Поместить элементы в стек
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Стек stack = ");
    print_util::print_array(&stack);

    // Посмотреть элемент на вершине стека
    let peek = stack.last().unwrap();
    print!("\nЭлемент на вершине стека peek = {peek}");

    // Снять элемент со стека
    let pop = stack.pop().unwrap();
    print!("\nСнятый элемент pop = {pop}, после снятия stack = ");
    print_util::print_array(&stack);

    // Получить размер стека
    let size = stack.len();
    print!("\nРазмер стека size = {size}");

    // Проверить, пуст ли стек
    let is_empty = stack.is_empty();
    print!("\nСтек пуст = {is_empty}");
}
