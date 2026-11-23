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
    /* Инициализация стека */
    fn new() -> ArrayStack<T> {
        ArrayStack::<T> {
            stack: Vec::<T>::new(),
        }
    }

    /* Получение длины стека */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* Проверка, пуст ли стек */
    fn is_empty(&self) -> bool {
        self.size() == 0
    }

    /* Поместить в стек */
    fn push(&mut self, num: T) {
        self.stack.push(num);
    }

    /* Извлечь из стека */
    fn pop(&mut self) -> Option<T> {
        self.stack.pop()
    }

    /* Доступ к верхнему элементу стека */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("стек пуст")
        };
        self.stack.last()
    }

    /* Вернуть &Vec */
    fn to_array(&self) -> &Vec<T> {
        &self.stack
    }
}

/* Driver Code */
fn main() {
    // Инициализация стека
    let mut stack = ArrayStack::<i32>::new();

    // Помещение элемента в стек
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Стек stack = ");
    print_util::print_array(stack.to_array());

    // Доступ к верхнему элементу стека
    let peek = stack.peek().unwrap();
    print!("\nВерхний элемент peek = {}", peek);

    // Извлечение элемента из стека
    let pop = stack.pop().unwrap();
    print!("\nИзвлеченный элемент pop = {pop}, stack после извлечения = ");
    print_util::print_array(stack.to_array());

    // Получение длины стека
    let size = stack.size();
    print!("\nДлина стека size = {size}");

    // Проверка на пустоту
    let is_empty = stack.is_empty();
    print!("\nПуст ли стек = {is_empty}");
}
