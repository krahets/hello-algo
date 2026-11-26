/*
 * File: deque.rs
 * Created Time: 2023-02-05
 * Author: codingonion (coderonion@gmail.com), xBLACKICEx (xBLACKICEx@outlook.com)
 */

use hello_algo_rust::include::print_util;
use std::collections::VecDeque;

/* Пример использования */
pub fn main() {
    // Инициализировать дек
    let mut deque: VecDeque<i32> = VecDeque::new();
    deque.push_back(3);
    deque.push_back(2);
    deque.push_back(5);
    print!("Дек deque = ");
    print_util::print_queue(&deque);

    // Посмотреть первый и последний элементы
    let peek_first = deque.front().unwrap();
    print!("\nПервый элемент дека peekFirst = {peek_first}");
    let peek_last = deque.back().unwrap();
    print!("\nПоследний элемент дека peekLast = {peek_last}");

    /* Добавить элементы в дек */
    deque.push_back(4);
    print!("\nПосле добавления 4 в конец дека deque = ");
    print_util::print_queue(&deque);
    deque.push_front(1);
    print!("\nПосле добавления 1 в начало дека deque = ");
    print_util::print_queue(&deque);

    // Извлечь элементы из дека
    let pop_last = deque.pop_back().unwrap();
    print!("\nИзвлечённый последний элемент = {pop_last}, после извлечения deque = ");
    print_util::print_queue(&deque);
    let pop_first = deque.pop_front().unwrap();
    print!("\nИзвлечённый первый элемент = {pop_first}, после извлечения deque = ");
    print_util::print_queue(&deque);

    // Получить длину дека
    let size = deque.len();
    print!("\nДлина дека size = {size}");

    // Проверить, пуст ли дек
    let is_empty = deque.is_empty();
    print!("\nДек пуст = {is_empty}");
}
