/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

use std::cell::RefCell;
use std::rc::Rc;

/* Doubly linked list node */
pub struct ListNode<T> {
    pub val: T,                                 // Node value
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // Pointer to the next node
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // Pointer to the previous node
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

/* Deque implemented with a doubly linked list */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Head node front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Tail node rear
    que_size: usize,                         // Deque size
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* Get the deque size */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* Check whether the deque is empty */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* Enqueue operation */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // Enqueue at the front
        if is_front {
            match self.front.take() {
                // If the linked list is empty, make both front and rear point to node
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // Add node to the head of the linked list
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // Update the head node
                }
            }
        }
        // Enqueue at the rear
        else {
            match self.rear.take() {
                // If the linked list is empty, make both front and rear point to node
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // Add node to the tail of the linked list
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // Update the tail node
                }
            }
        }
        self.que_size += 1; // Update the deque size
    }

    /* Enqueue at the front */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* Enqueue at the rear */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* Dequeue operation */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // If the deque is empty, return None immediately
        if self.is_empty() {
            return None;
        };
        // Dequeue from the front
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // Update the head node
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // Update the deque size
                old_front.borrow().val
            })
        }
        // Dequeue from the rear
        else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear); // Update the tail node
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1; // Update the deque size
                old_rear.borrow().val
            })
        }
    }

    /* Dequeue from the front */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* Dequeue from the rear */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* Access the front element */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Access the rear element */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* Return a vector for printing */
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

/* Driver code */
fn main() {
    /* Initialize the deque */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Deque deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Access an element */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\nFront element peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\nRear element peek_last = {}", peek_last);

    /* Enqueue elements */
    deque.push_last(4);
    print!("\nAfter enqueuing element 4 at the rear, deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\nAfter enqueuing element 1 at the front, deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Dequeue an element */
    let pop_last = deque.pop_last().unwrap();
    print!("\nElement removed from the rear = {}; after removal, deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\nElement removed from the front = {}; after removal, deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Get the deque size */
    let size = deque.size();
    print!("\nDeque size = {}", size);

    /* Check whether the deque is empty */
    let is_empty = deque.is_empty();
    print!("\nIs the deque empty? {}", is_empty);
}
