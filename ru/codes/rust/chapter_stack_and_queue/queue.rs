/*
 * File: queue.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;

use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // [region]{init_queue}
    // Инициализация очереди
    // В Rust двусторонняя очередь VecDeque обычно используется как очередь
    let mut queue: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_queue}

    // [region]{push}
    // Добавление элемента в очередь
    queue.push_back(1);
    queue.push_back(3);
    queue.push_back(2);
    queue.push_back(5);
    queue.push_back(4);
    // [endregion]{push}
    print!("Очередь queue = ");
    print_util::print_queue(&queue);

    // [region]{peek}
    // Доступ к элементу в начале очереди
    let peek = queue.front().unwrap();
    // [endregion]{peek}
    println!("\nПервый элемент peek = {peek}");

    // [region]{pop}
    // Извлечение элемента из очереди
    let pop = queue.pop_front().unwrap();
    // [endregion]{pop}
    print!("Извлеченный элемент pop = {pop}, queue после извлечения = ");
    print_util::print_queue(&queue);

    // [region]{size}
    // Получение длины очереди
    let size = queue.len();
    // [endregion]{size}
    print!("\nДлина очереди size = {size}");

    // [region]{is_empty}
    // Проверка, пуста ли очередь
    let is_empty = queue.is_empty();
    // [endregion]{is_empty}
    print!("\nПуста ли очередь = {is_empty}");
}
