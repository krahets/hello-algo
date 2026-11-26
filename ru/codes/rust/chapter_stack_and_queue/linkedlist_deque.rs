/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* Узел двусвязного списка */
pub struct ListNode<T> {
    pub val: T,                                 // Значение узла
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // Умный указатель на следующий узел
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // Умный указатель на предыдущий узел
}

impl<T> ListNode<T> {
    pub fn new(val: T) -> Rc<RefCell<ListNode<T>>> {
        Rc::new(RefCell::new(ListNode {
            val,
            next: None,
            prev: None,
        }))
    }
}

/* Двусторонняя очередь (дек) на основе двусвязного списка */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Первый узел front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Последний узел rear
    que_size: usize,                         // Длина дека
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* Получить длину дека */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* Проверить, пуст ли дек */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* Добавить элемент в дек */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // Добавить элемент в начало дека
        if is_front {
            match self.front.take() {
                // Если связный список пуст, установить front и rear так, чтобы они указывали на node
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // Добавить node в начало связного списка
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // Обновить ссылку на первый узел
                }
            }
        }
        // Добавить элемент в конец дека
        else {
            match self.rear.take() {
                // Если связный список пуст, установить front и rear так, чтобы они указывали на node
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // Добавить node в конец связного списка
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // Обновить ссылку на последний узел
                }
            }
        }
        self.que_size += 1; // Обновить длину дека
    }

    /* Добавить элемент в начало дека */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* Добавить элемент в конец дека */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* Извлечь элемент из дека */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // Если дек пуст, сразу вернуть None
        if self.is_empty() {
            return None;
        };
        // Извлечь элемент из начала дека
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // Обновить ссылку на первый узел
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // Обновить длину дека
                old_front.borrow().val
            })
        }
        // Извлечь элемент из конца дека
        else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear); // Обновить ссылку на последний узел
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1; // Обновить длину дека
                old_rear.borrow().val
            })
        }
    }

    /* Извлечь элемент из начала дека */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* Извлечь элемент из конца дека */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* Посмотреть первый элемент дека */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Посмотреть последний элемент дека */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* Вернуть динамический массив для вывода */
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
    /* Инициализировать дек */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Дек deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Посмотреть первый и последний элементы */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\nПервый элемент дека peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\nПоследний элемент дека peek_last = {}", peek_last);

    /* Добавить элементы в дек */
    deque.push_last(4);
    print!("\nПосле добавления 4 в конец дека deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\nПосле добавления 1 в начало дека deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Извлечь элементы из дека */
    let pop_last = deque.pop_last().unwrap();
    print!("\nИзвлечённый последний элемент = {}, после извлечения deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\nИзвлечённый первый элемент = {}, после извлечения deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Получить длину дека */
    let size = deque.size();
    print!("\nДлина дека size = {}", size);

    /* Проверить, пуст ли дек */
    let is_empty = deque.is_empty();
    print!("\nДек пуст = {}", is_empty);
}
