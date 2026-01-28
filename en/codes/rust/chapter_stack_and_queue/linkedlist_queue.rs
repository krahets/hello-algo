/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* Queue based on linked list implementation */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Head node front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Tail node rear
    que_size: usize,                         // Queue length
}

impl<T: Copy> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* Get the length of the queue */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* Check if the queue is empty */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* Enqueue */
    pub fn push(&mut self, num: T) {
        // Add num after the tail node
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // If the queue is not empty, add the node after the tail node
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // If the queue is empty, make both front and rear point to the node
            None => {
                self.front = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
        }
        self.que_size += 1;
    }

    /* Dequeue */
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

    /* Return list for printing */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Convert linked list to Array and return */
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
    /* Access front of the queue element */
    let mut queue = LinkedListQueue::new();

    /* Elements enqueue */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("Queue queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Return list for printing */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\nFront element peek = {}", peek);

    /* Element dequeue */
    let pop = queue.pop().unwrap();
    print!("\nDequeue element pop = {}, after dequeue queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Get the length of the queue */
    let size = queue.size();
    print!("\nQueue length size = {}", size);

    /* Check if the queue is empty */
    let is_empty = queue.is_empty();
    print!("\nIs queue empty = {}", is_empty);
}
