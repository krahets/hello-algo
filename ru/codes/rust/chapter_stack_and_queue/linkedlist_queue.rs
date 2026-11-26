/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* Очередь на основе связного списка */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Первый узел front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Последний узел rear
    que_size: usize,                         // Длина очереди
}

impl<T: Copy> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* Получить длину очереди */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* Проверить, пуста ли очередь */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* Добавить элемент в очередь */
    pub fn push(&mut self, num: T) {
        // Добавить узел со значением num после последнего узла
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // Если очередь непуста, добавить новый узел после последнего
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // Если очередь пуста, установить ссылки на первый и последний узлы так, чтобы обе указывали на новый узел
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.que_size += 1;
    }

    /* Извлечь элемент из очереди */
    pub fn pop(&mut self) -> Option<T> {
        self.front.take().map(|old_front| {
            match old_front.borrow_mut().next.take() {
                Some(new_front) => {
                    self.front = Some(new_front);
                }
                None => {
                    self.rear.take();
                }
            }
            self.que_size -= 1;
            old_front.borrow().val
        })
    }

    /* Посмотреть первый элемент очереди */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Преобразовать связный список в динамический массив и вернуть его */
    pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
        let mut res: Vec<T> = Vec::new();

        fn recur<T: Copy>(cur: Option<&Rc<RefCell<ListNode<T>>>>, res: &mut Vec<T>) {
            if let Some(cur) = cur {
                res.push(cur.borrow().val);
                recur(cur.borrow().next.as_ref(), res);
            }
        }

        recur(head, &mut res);

        res
    }
}

/* Пример использования */
fn main() {
    /* Инициализировать очередь */
    let mut queue = LinkedListQueue::new();

    /* Добавить элементы в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("Очередь queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Посмотреть первый элемент очереди */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\nПервый элемент очереди peek = {}", peek);

    /* Извлечь элемент из очереди */
    let pop = queue.pop().unwrap();
    print!("\nИзвлечённый элемент pop = {}, после извлечения queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Получить длину очереди */
    let size = queue.size();
    print!("\nДлина очереди size = {}", size);

    /* Проверить, пуста ли очередь */
    let is_empty = queue.is_empty();
    print!("\nОчередь пуста = {}", is_empty);
}
