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
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // Successor node pointer
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // Predecessor node pointer
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

/* Double-ended queue based on doubly linked list implementation */
#[allow(dead_code)]
pub struct LinkedListDeque<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Head node front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Tail node rear
    que_size: usize,                         // Length of the double-ended queue
}

impl<T: Copy> LinkedListDeque<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* Get the length of the double-ended queue */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* Check if the double-ended queue is empty */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* Enqueue operation */
    fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // Front of the queue enqueue operation
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
                    self.front = Some(node); // Update head node
                }
            }
        }
        // Rear of the queue enqueue operation
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
                    self.rear = Some(node); // Update tail node
                }
            }
        }
        self.que_size += 1; // Update queue length
    }

    /* Front of the queue enqueue */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* Rear of the queue enqueue */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* Dequeue operation */
    fn pop(&mut self, is_front: bool) -> Option<T> {
        // If queue is empty, return None directly
        if self.is_empty() {
            return None;
        };
        // Temporarily store head node value
        if is_front {
            self.front.take().map(|old_front| {
                match old_front.borrow_mut().next.take() {
                    Some(new_front) => {
                        new_front.borrow_mut().prev.take();
                        self.front = Some(new_front); // Update head node
                    }
                    None => {
                        self.rear.take();
                    }
                }
                self.que_size -= 1; // Update queue length
                old_front.borrow().val
            })
        }
        // Temporarily store tail node value
        else {
            self.rear.take().map(|old_rear| {
                match old_rear.borrow_mut().prev.take() {
                    Some(new_rear) => {
                        new_rear.borrow_mut().next.take();
                        self.rear = Some(new_rear); // Update tail node
                    }
                    None => {
                        self.front.take();
                    }
                }
                self.que_size -= 1; // Update queue length
                old_rear.borrow().val
            })
        }
    }

    /* Rear of the queue dequeue */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* Access rear of the queue element */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* Return list for printing */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Driver Code */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* Return array for printing */
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
    /* Get the length of the double-ended queue */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Double-ended queue deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Update element */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\nFront element peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\nRear element peek_last = {}", peek_last);

    /* Elements enqueue */
    deque.push_last(4);
    print!("\nAfter element 4 enqueues at rear, deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\nAfter element 1 enqueues at front, deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Element dequeue */
    let pop_last = deque.pop_last().unwrap();
    print!("\nDequeue rear element = {}, after dequeue deque = ", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\nDequeue front element = {}, after dequeue deque = ", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Get the length of the double-ended queue */
    let size = deque.size();
    print!("\nDeque length size = {}", size);

    /* Check if the double-ended queue is empty */
    let is_empty = deque.is_empty();
    print!("\nIs deque empty = {}", is_empty);
}
