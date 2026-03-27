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

    /* Получить длину стека */
    fn size(&self) -> usize {
        self.stack.len()
    }

    /* Проверить, пуст ли стек */
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

    /* Получить верхний элемент стека */
    fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            panic!("Стек пуст")
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
    // Инициализировать стек
    let mut stack = ArrayStack::<i32>::new();

    // Поместить элемент в стек
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("Стек stack = ");
    print_util::print_array(stack.to_array());

    // Получить верхний элемент стека
    let peek = stack.peek().unwrap();
    print!("\nвершина стекаэлемент peek = {}", peek);

    // Извлечь элемент из стека
    let pop = stack.pop().unwrap();
    print!("\nЭлемент, извлеченный из стека, pop = {pop}, stack после извлечения = ");
    print_util::print_array(stack.to_array());

    // Получить длину стека
    let size = stack.size();
    print!("\nДлина стека size = {size}");

    // Проверить, пуста ли структура
    let is_empty = stack.is_empty();
    print!("\nстекпуст ли = {is_empty}");
}
