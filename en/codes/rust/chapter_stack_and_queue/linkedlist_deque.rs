/*
 * File: linkedlist_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

use std::cell::RefCell;
use std::rc::Rc;

/* Double-linked list node */
pub struct ListNode<T> {
    pub val: T,                                 // Node value
    pub next: Option<Rc<RefCell<ListNode<T>>>>, // Pointer to successor node
    pub prev: Option<Rc<RefCell<ListNode<T>>>>, // Pointer to predecessor node
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

/* Double-ended queue class based on double-linked list */
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

    /* Determine if the double-ended queue is empty */
    pub fn is_empty(&self) -> bool {
        return self.size() == 0;
    }

    /* Enqueue operation */
    pub fn push(&mut self, num: T, is_front: bool) {
        let node = ListNode::new(num);
        // Front enqueue operation
        if is_front {
            match self.front.take() {
                // If the list is empty, make front and rear both point to node
                None => {
                    self.rear = Some(node.clone());
                    self.front = Some(node);
                }
                // Add node to the head of the list
                Some(old_front) => {
                    old_front.borrow_mut().prev = Some(node.clone());
                    node.borrow_mut().next = Some(old_front);
                    self.front = Some(node); // Update head node
                }
            }
        }
        // Rear enqueue operation
        else {
            match self.rear.take() {
                // If the list is empty, make front and rear both point to node
                None => {
                    self.front = Some(node.clone());
                    self.rear = Some(node);
                }
                // Add node to the tail of the list
                Some(old_rear) => {
                    old_rear.borrow_mut().next = Some(node.clone());
                    node.borrow_mut().prev = Some(old_rear);
                    self.rear = Some(node); // Update tail node
                }
            }
        }
        self.que_size += 1; // Update queue length
    }

    /* Front enqueue */
    pub fn push_first(&mut self, num: T) {
        self.push(num, true);
    }

    /* Rear enqueue */
    pub fn push_last(&mut self, num: T) {
        self.push(num, false);
    }

    /* Dequeue operation */
    pub fn pop(&mut self, is_front: bool) -> Option<T> {
        // If the queue is empty, return None
        if self.is_empty() {
            return None;
        };
        // Front dequeue operation
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
                Rc::try_unwrap(old_front).ok().unwrap().into_inner().val
            })
        }
        // Rear dequeue operation
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
                Rc::try_unwrap(old_rear).ok().unwrap().into_inner().val
            })
        }
    }

    /* Front dequeue */
    pub fn pop_first(&mut self) -> Option<T> {
        return self.pop(true);
    }

    /* Rear dequeue */
    pub fn pop_last(&mut self) -> Option<T> {
        return self.pop(false);
    }

    /* Access front element */
    pub fn peek_first(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.front.as_ref()
    }

    /* Access rear element */
    pub fn peek_last(&self) -> Option<&Rc<RefCell<ListNode<T>>>> {
        self.rear.as_ref()
    }

    /* Return array for printing */
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
    /* Initialize double-ended queue */
    let mut deque = LinkedListDeque::new();
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Double-ended queue deque =");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Access element */
    let peek_first = deque.peek_first().unwrap().borrow().val;
    print!("\nFront element peek_first = {}", peek_first);
    let peek_last = deque.peek_last().unwrap().borrow().val;
    print!("\nBack element peek_last = {}", peek_last);

    /* Element enqueue */
    deque.push_last(4);
    print!("\nElement 4 enqueued at the tail, deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));
    deque.push_first(1);
    print!("\nElement 1 enqueued at the head, deque = ");
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Element dequeue */
    let pop_last = deque.pop_last().unwrap();
    print!("\nDeque tail element = {}, after dequeuing from the tail", pop_last);
    print_util::print_array(&deque.to_array(deque.peek_first()));
    let pop_first = deque.pop_first().unwrap();
    print!("\nDeque front element = {}, after dequeuing from the front", pop_first);
    print_util::print_array(&deque.to_array(deque.peek_first()));

    /* Get the length of the double-ended queue */
    let size = deque.size();
    print!("\nLength of the double-ended queue size = {}", size);

    /* Determine if the double-ended queue is empty */
    let is_empty = deque.is_empty();
    print!("\nIs the double-ended queue empty = {}", is_empty);
}
