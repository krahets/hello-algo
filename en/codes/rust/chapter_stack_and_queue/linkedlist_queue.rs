/*
 * File: linkedlist_queue.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use list_node::ListNode;
use std::cell::RefCell;
use std::rc::Rc;

/* Queue class based on linked list */
#[allow(dead_code)]
pub struct LinkedListQueue<T> {
    front: Option<Rc<RefCell<ListNode<T>>>>, // Head node front
    rear: Option<Rc<RefCell<ListNode<T>>>>,  // Tail node rear
    que_size: usize,                         // Length of the queue
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

    /* Determine if the queue is empty */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* Enqueue */
    pub fn push(&mut self, num: T) {
        // Add num behind the tail node
        let new_rear = ListNode::new(num);
        match self.rear.take() {
            // If the queue is not empty, add that node behind the tail node
            Some(old_rear) => {
                old_rear.borrow_mut().next = Some(new_rear.clone());
                self.rear = Some(new_rear);
            }
            // If the queue is empty, make the head and tail nodes both point to that node
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
            Rc::try_unwrap(old_front).ok().unwrap().into_inner().val
        })
    }

    /* Access front element */
    pub fn peek(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Convert the linked list to Array and return */
    pub fn to_array(&self, head: Option<&Rc<RefCell<ListNode<T>>>>) -> Vec<T> {
        if let Some(node) = head {
            let mut nums = self.to_array(node.borrow().next.as_ref());
            nums.insert(0, node.borrow().val);
            return nums;
        }
        return Vec::new();
    }
}

/* Driver Code */
fn main() {
    /* Initialize queue */
    let mut queue = LinkedListQueue::new();

    /* Element enqueue */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    print!("Queue queue =");
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Access front element */
    let peek = queue.peek().unwrap().borrow().val;
    print!("\nFront element peek = {}", peek);

    /* Element dequeue */
    let pop = queue.pop().unwrap();
    print!("\nDequeued element = {}, after dequeuing queue = ", pop);
    print_util::print_array(&queue.to_array(queue.peek()));

    /* Get the length of the queue */
    let size = queue.size();
    print!("\nLength of the queue size = {}", size);

    /* Determine if the queue is empty */
    let is_empty = queue.is_empty();
    print!("\nIs the queue empty = {}", is_empty);
}
