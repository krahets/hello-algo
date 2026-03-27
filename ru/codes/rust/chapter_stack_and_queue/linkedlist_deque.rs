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
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // Указатель на узел-преемник
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // Указатель на узел-предшественник
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

/* Двусторонняя очередь на основе двусвязного списка */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Головной узел front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Хвостовой узел rear
    que_size: usize,                         // Длина двусторонней очереди
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* Получение длины двусторонней очереди */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* Проверка, пуста ли двусторонняя очередь */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* Операция добавления в очередь */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // Операция добавления в голову очереди
        if is_front {
            match self.front.take() {
                // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // Добавить node в голову списка
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // Обновить головной узел
                }
            }
        }
        // Операция добавления в хвост очереди
        else {
            match self.rear.take() {
                // Если связный список пуст, сделать так, чтобы и front, и rear указывали на node
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // Добавить node в хвост списка
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // Обновить хвостовой узел
                }
            }
        }
        self.que_size += 1; // Обновить длину очереди
    }

    /* Добавление в голову очереди */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* Добавление в хвост очереди */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* Операция извлечения из очереди */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // Если очередь пуста, сразу вернуть None
        if self.is_empty() {
            return None;
        };
        // Операция извлечения из головы очереди
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // Обновить головной узел
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // Обновить длину очереди
                old_front.borrow().val
            })
        }
        // Операция извлечения из хвоста очереди
        else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear); // Обновить хвостовой узел
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1; // Обновить длину очереди
                old_rear.borrow().val
            })
        }
    }

    /* Извлечение из головы очереди */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* Извлечение из хвоста очереди */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* Доступ к элементу в начале очереди */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Доступ к элементу в конце очереди */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* Вернуть массив для вывода */
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
    /* Инициализация двусторонней очереди */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Двусторонняя очередь deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Доступ к элементу */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\nПервый элемент peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\nПоследний элемент peek_last = {}", peek_last);

    /* Добавление элемента в очередь */
    deque.push_last(4);
    print!("\nПосле добавления элемента 4 в хвост deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\nПосле добавления элемента 1 в голову deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Извлечение элемента из очереди */
    let pop_last = deque.pop_last().unwrap();
    print!("\nИзвлеченный из хвоста элемент = {}, deque после извлечения из хвоста = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\nИзвлеченный из головы элемент = {}, deque после извлечения из головы = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Получение длины двусторонней очереди */
    let size = deque.size();
    print!("\nДлина двусторонней очереди size = {}", size);

    /* Проверка, пуста ли двусторонняя очередь */
    let is_empty = deque.is_empty();
    print!("\nПуста ли двусторонняя очередь = {}", is_empty);
}
