/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Пример использования */
pub fn main() {
    // Инициализировать очередь
    let mut queue: VecDeque<i32> = VecDeque::new();

    // Добавить элементы в очередь
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    print!("Очередь queue = ");
    print_util::print_queue(&queue);

    // Посмотреть первый элемент очереди
    let peek = queue.front().unwrap();
    println!("\nПервый элемент очереди peek = {peek}");

    // Извлечь элемент из очереди
    let pop = queue.pop_front().unwrap();
    print!("Извлечённый элемент pop = {pop}, после извлечения queue = ");
    print_util::print_queue(&queue);

    // Получить длину очереди
    let size = queue.len();
    print!("\nДлина очереди size = {size}");

    // Проверить, пуста ли очередь
    let is_empty = queue.is_empty();
    print!("\nОчередь пуста = {is_empty}");
}
