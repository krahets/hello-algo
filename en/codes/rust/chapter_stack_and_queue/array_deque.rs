/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* Double-ended queue based on circular array implementation */
struct ArrayDeque<T> {
    nums: Vec<T>,    // Array for storing double-ended queue elements
    front: usize,    // Front pointer, points to the front of the queue element
    que_size: usize, // Double-ended queue length
}

impl<T: Copy + Default> ArrayDeque<T> {
    /* Constructor */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![T::default(); capacity],
            front: 0,
            que_size: 0,
        }
    }

    /* Get the capacity of the double-ended queue */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* Get the length of the double-ended queue */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* Check if the double-ended queue is empty */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Calculate circular array index */
    fn index(&self, i: i32) -> usize {
        // Use modulo operation to wrap the array head and tail together
        // When i passes the tail of the array, return to the head
        // When i passes the head of the array, return to the tail
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* Front of the queue enqueue */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Double-ended queue is full");
            return;
        }
        // Use modulo operation to wrap front around to the tail after passing the head of the array
        // Add num to the front of the queue
        self.front = self.index(self.front as i32 - 1);
        // Add num to front of queue
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* Rear of the queue enqueue */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Double-ended queue is full");
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // Front pointer moves one position backward
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* Rear of the queue dequeue */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // Move front pointer backward by one position
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* Access rear of the queue element */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* Return list for printing */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("Deque is empty")
        };
        self.nums[self.front]
    }

    /* Driver Code */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("Deque is empty")
        };
        // Initialize double-ended queue
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* Return array for printing */
    fn to_array(&self) -> Vec<T> {
        // Elements enqueue
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* Driver Code */
fn main() {
    /* Get the length of the double-ended queue */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Double-ended queue deque = ");
    print_util::print_array(&deque.to_array());

    /* Update element */
    let peek_first = deque.peek_first();
    print!("\nFront element peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nRear element peek_last = {}", peek_last);

    /* Elements enqueue */
    deque.push_last(4);
    print!("\nAfter element 4 enqueues at rear, deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\nAfter element 1 enqueues at front, deque = ");
    print_util::print_array(&deque.to_array());

    /* Element dequeue */
    let pop_last = deque.pop_last();
    print!("\nDequeue rear element = {}, after dequeue deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\nDequeue front element = {}, after dequeue deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* Get the length of the double-ended queue */
    let size = deque.size();
    print!("\nDeque length size = {}", size);

    /* Check if the double-ended queue is empty */
    let is_empty = deque.is_empty();
    print!("\nIs deque empty = {}", is_empty);
}
