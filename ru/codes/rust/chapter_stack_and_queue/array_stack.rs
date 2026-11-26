/*
 * File: array_stack.rs
 * Created Time: 2023-02-05
 * Author: WSL0809 (wslzzy@outlook.com), codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* Стек на основе массива */
struct ArrayStack<T> {
    stack: Vec<T>,
}

impl<T> ArrayStack<T> {
    /* Инициализировать стек */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* Получить размер стека */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* Проверить, пуст ли стек */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* Поместить элемент в стек */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* Снять элемент со стека */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* Посмотреть элемент на вершине стека */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("Стек пуст")
        };
        self.stack.last()
    }

    /* Вернуть ссылку на вектор (&Vec) */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* Пример использования */
fn main() {
    // Инициализировать стек
    let mut stack = ArrayStack::<i32>::new();

    // Поместить элементы в стек
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Стек stack = ");
    print_util::print_array(stack.to_array());

    //Посмотреть элемент на вершине стека
    let peek = stack.peek().unwrap();
    print!("\nЭлемент на вершине стека peek = {}", peek);

    // Снять элемент со стека
    let pop = stack.pop().unwrap();
    print!("\nСнятый элемент pop = {pop}, после снятия stack = ");
    print_util::print_array(stack.to_array());

    // Получить размер стека
    let size = stack.size();
    print!("\nРазмер стека size = {size}");

    // Проверить, пуст ли стек
    let is_empty = stack.is_empty();
    print!("\nСтек пуст = {is_empty}");
}
