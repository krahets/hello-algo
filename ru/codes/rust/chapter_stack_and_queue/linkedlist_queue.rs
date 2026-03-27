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
    front: Option<Rc<RefCell<ListNode<T>>>>, // Головной узел front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Хвостовой узел rear
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

    /* Поместить в очередь */
    pub fn push(&mut self, num: T) {
        // Добавить num после хвостового узла
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // Если очередь не пуста, добавить этот узел после хвостового узла
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // Если очередь пуста, сделать так, чтобы головной и хвостовой узлы указывали на этот узел
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.que_size += 1;
    }

    /* Извлечь из очереди */
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

    /* Получить элемент в начале очереди */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Преобразовать связный список в Array и вернуть его */
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

/* Driver Code */
fn main() {
    /* Инициализировать очередь */
    let mut queue = LinkedListQueue::new();

    /* Поместить элемент в очередь */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("Очередь queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Получить элемент в начале очереди */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\nголова очередиэлемент peek = {}", peek);

    /* Извлечь элемент из очереди */
    let pop = queue.pop().unwrap();
    print!("\nЭлемент, извлеченный из очереди, pop = {}, queue после извлечения = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Получить длину очереди */
    let size = queue.size();
    print!("\nДлина очереди size = {}", size);

    /* Проверить, пуста ли очередь */
    let is_empty = queue.is_empty();
    print!("\nОчередь пуста: {}", is_empty);
}
