/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::{print_util, ListNode};

use std::cell::RefCell;
use std::rc::Rc;

/* Queue implemented with a linked list */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Head node front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Tail node rear
    que_size: usize,                         // Queue size
}

impl<T: Copy> LinkedListQueue<T> {
    pub fn new() -> Self {
        Self {
            front: None,
            rear: None,
            que_size: 0,
        }
    }

    /* Get the queue size */
    pub fn size(&self) -> usize {
        return self.que_size;
    }

    /* Check whether the queue is empty */
    pub fn is_empty(&self) -> bool {
        return self.que_size == 0;
    }

    /* Enqueue */
    pub fn push(&mut self, num: T) {
        // Add num after the tail node
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // If the queue is not empty, add this node after the tail node
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // If the queue is empty, make both the head and tail point to this node
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

    /* Access the front element */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Convert the linked list to a vector and return it */
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
    /* Initialize the queue */
    let mut queue = LinkedListQueue::new();

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("Queue queue = ");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Access the front element */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\nFront element peek = {}", peek);

    /* Dequeue an element */
    let pop = queue.pop().unwrap();
    print!("\nDequeued element pop = {}; after dequeueing, queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Get the queue size */
    let size = queue.size();
    print!("\nQueue size = {}", size);

    /* Check whether the queue is empty */
    let is_empty = queue.is_empty();
    print!("\nIs the queue empty? {}", is_empty);
}
