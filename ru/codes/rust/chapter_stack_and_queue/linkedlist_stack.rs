/*
 * File: linkedlist_stack.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* Стек на основе связного списка */
#[allow(dead_code)]
pub struct LinkedListStack<T> {
    stack_peek: Option<Rc<RefCell<ListNode<T>>>>, // Считать головной узел вершиной стека
    stk_size: usize,                              // Длина стека
}

impl<T: Copy> LinkedListStack<T> {
    pub fn new() -> Self {
        Self {
            stack_peek: None,
            stk_size: 0,
        }
    }

    /* Получить длину стека */
    pub fn size(&self) -> usize {
        return self.stk_size;
    }

    /* Проверить, пуст ли стек */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* Поместить в стек */
    pub fn push(&mut self, num: T) {
        let node = ListNode::new(num);
        node.borrow_mut().next = self.stack_peek.take();
        self.stack_peek = Some(node);
        self.stk_size += 1;
    }

    /* Извлечь из стека */
    pub fn pop(&mut self) -> Option<T> {
        self.stack_peek.take().map(|old_head| {
            self.stack_peek = old_head.borrow_mut().next.take();
            self.stk_size -= 1;

            old_head.borrow().val
        })
    }

    /* Получить верхний элемент стека */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.stack_peek.as_ref()
    }

    /* Преобразовать List в Array и вернуть его */
    pub fn to_array(&self) -> Vec<T> {
        fn _to_array<T: Sized + Copy>(head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
            if let Some(node) = head {
                let mut nums = _to_array(node.borrow().next.as_ref());
                nums.push(node.borrow().val);
                return nums;
            }
            return Vec::new();
        }

        _to_array(self.peek())
    }
}

/* Driver Code */
fn main() {
    /* Инициализировать стек */
    let mut stack = LinkedListStack::new();

    /* Поместить элемент в стек */
    stack.push(1);
    stack.push(3);
    stack.push(2);
    stack.push(5);
    stack.push(4);
    print!("стек stack =");
    print_util::print_array(&stack.to_array());

    /* Получить верхний элемент стека */
    let peek = stack.peek().unwrap().borrow().val;
    print!("\nвершина стекаэлемент peek = {}", peek);

    /* Извлечь элемент из стека */
    let pop = stack.pop().unwrap();
    print!("\nизвлечение из стекаэлемент pop = {}, извлечение из стекапосле stack =", pop);
    print_util::print_array(&stack.to_array());

    /* Получить длину стека */
    let size = stack.size();
    print!("\nДлина стека size = {}", size);

    /* Проверить, пуста ли структура */
    let is_empty = stack.is_empty();
    print!("\nстекпуст ли = {}", is_empty);
}
