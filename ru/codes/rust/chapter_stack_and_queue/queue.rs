/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // Инициализация очереди
    let mut queue: VecDeque<i32> = VecDeque::new();

    // Добавление элемента в очередь
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("Очередь queue = ");
    print_util::print_queue(&queue);

    // Доступ к элементу в начале очереди
    let peek = queue.front().unwrap();
    println!("\nПервый элемент peek = {peek}");

    // Извлечение элемента из очереди
    let pop = queue.pop_front().unwrap();
    print!("Извлеченный элемент pop = {pop}, queue после извлечения = ");
    print_util::print_queue(&queue);

    // Получение длины очереди
    let size = queue.len();
    print!("\nДлина очереди size = {size}");

    // Проверка, пуста ли очередь
    let is_empty = queue.is_empty();
    print!("\nПуста ли очередь = {is_empty}");
}
