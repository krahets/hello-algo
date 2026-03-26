/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Driver Code */
pub fn main() {
    // Инициализировать двустороннюю очередь
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("двусторонняя очередь deque =");
    print_util::print_queue(&deque);

    // Получить доступ к элементу
    let peek_first = deque.front().unwrap();
    print!("\nэлемент в голове очереди peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\nэлемент в хвосте очереди peekLast = {peek_last}");

    /* Поместить элемент в очередь */
    deque.push_back(4);
    print!("\nПосле помещения элемента 4 в хвост очереди deque =");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\nПосле помещения элемента 1 в голову очереди deque =");
    print_util::print_queue(&deque);

    // Извлечь элемент из очереди
    let pop_last = deque.pop_back().unwrap();
    print!("\nЭлемент, извлеченный из хвоста очереди, = {pop_last}, deque после извлечения из хвоста =");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\nЭлемент, извлеченный из головы очереди, = {pop_first}, deque после извлечения из головы =");
    print_util::print_queue(&deque);

    // Получить длину двусторонней очереди
    let size = deque.len();
    print!("\nДлина двусторонней очереди size = {size}");

    // Проверить, пуста ли двусторонняя очередь
    let is_empty = deque.is_empty();
    print!("\nдвусторонняя очередьпуст ли = {is_empty}");
}
