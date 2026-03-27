/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // Инициализация двусторонней очереди
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("Двусторонняя очередь deque = ");
    print_util::print_queue(&deque);

    // Доступ к элементу
    let peek_first = deque.front().unwrap();
    print!("\nПервый элемент peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\nПоследний элемент peekLast = {peek_last}");

    /* Добавление элемента в очередь */
    deque.push_back(4);
    print!("\nПосле добавления элемента 4 в хвост deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\nПосле добавления элемента 1 в голову deque = ");
    print_util::print_queue(&deque);

    // Извлечение элемента из очереди
    let pop_last = deque.pop_back().unwrap();
    print!("\nИзвлеченный из хвоста элемент = {pop_last}, deque после извлечения из хвоста = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\nИзвлеченный из головы элемент = {pop_first}, deque после извлечения из головы = ");
    print_util::print_queue(&deque);

    // Получение длины двусторонней очереди
    let size = deque.len();
    print!("\nДлина двусторонней очереди size = {size}");

    // Проверка, пуста ли двусторонняя очередь
    let is_empty = deque.is_empty();
    print!("\nПуста ли двусторонняя очередь = {is_empty}");
}
