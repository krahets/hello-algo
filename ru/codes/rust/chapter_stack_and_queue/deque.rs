/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // [region]{init_deque}
    // Инициализация двусторонней очереди
    let mut deque: VecDeque<i32> = VecDeque::new();
    // [endregion]{init_deque}

    // [region]{push}
    /* Добавление элемента в очередь */
    deque.push_back(2); // Добавить в хвост
    deque.push_back(5);
    deque.push_back(4);
    deque.push_front(3); // Добавить в голову
    deque.push_front(1);
    // [endregion]{push}
    print!("Двусторонняя очередь deque = ");
    print_util::print_queue(&deque);

    // [region]{peek_first}
    // Доступ к элементу
    let peek_first = deque.front().unwrap(); // Элемент в голове
    // [endregion]{peek_first}
    print!("\nПервый элемент peekFirst = {peek_first}");
    // [region]{peek_last}
    let peek_last = deque.back().unwrap(); // Элемент в хвосте
    // [endregion]{peek_last}
    print!("\nПоследний элемент peekLast = {peek_last}");

    // [region]{pop_first}
    // Извлечение элемента из очереди
    let pop_first = deque.pop_front().unwrap(); // Извлечь элемент из головы
    // [endregion]{pop_first}
    print!("\nИзвлеченный из головы элемент = {pop_first}, deque после извлечения из головы = ");
    print_util::print_queue(&deque);
    // [region]{pop_last}
    let pop_last = deque.pop_back().unwrap(); // Извлечь элемент из хвоста
    // [endregion]{pop_last}
    print!("\nИзвлеченный из хвоста элемент = {pop_last}, deque после извлечения из хвоста = ");
    print_util::print_queue(&deque);

    // [region]{size}
    // Получение длины двусторонней очереди
    let size = deque.len();
    // [endregion]{size}
    print!("\nДлина двусторонней очереди size = {size}");

    // [region]{is_empty}
    // Проверка, пуста ли двусторонняя очередь
    let is_empty = deque.is_empty();
    // [endregion]{is_empty}
    print!("\nПуста ли двусторонняя очередь = {is_empty}");
}
