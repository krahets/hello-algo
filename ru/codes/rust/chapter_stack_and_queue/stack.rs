/*
 * File: stack.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Driver Code */
pub fn main() {
    // [region]{init_stack}
    // Инициализировать стек
    // В Rust рекомендуется использовать Vec как стек
    let mut stack: Vec<i32> = Vec::new();
    // [endregion]{init_stack}

    // [region]{push}
    // Помещение элемента в стек
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    // [endregion]{push}
    print!("Стек stack = ");
    print_util::print_array(&stack);

    // [region]{peek}
    // Доступ к верхнему элементу стека
    let peek = stack.last().unwrap();
    // [endregion]{peek}
    print!("\nВерхний элемент peek = {peek}");

    // [region]{pop}
    // Извлечение элемента из стека
    let pop = stack.pop().unwrap();
    // [endregion]{pop}
    print!("\nИзвлеченный элемент pop = {pop}, stack после извлечения = ");
    print_util::print_array(&stack);

    // [region]{size}
    // Получение длины стека
    let size = stack.len();
    // [endregion]{size}
    print!("\nДлина стека size = {size}");

    // [region]{is_empty}
    // Проверка, пуст ли стек
    let is_empty = stack.is_empty();
    // [endregion]{is_empty}
    print!("\nПуст ли стек = {is_empty}");
}
