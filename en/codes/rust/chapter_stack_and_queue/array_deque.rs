/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

include!("../include/include.rs");

/* Double-ended queue class based on circular array */
struct ArrayDeque {
    nums: Vec<i32>,  // Array used to store elements of the double-ended queue
    front: usize,    // Front pointer, pointing to the front element
    que_size: usize, // Length of the double-ended queue
}

impl ArrayDeque {
    /* Constructor */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![0; capacity],
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

    /* Determine if the double-ended queue is empty */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Calculate circular array index */
    fn index(&self, i: i32) -> usize {
        // Implement circular array by modulo operation
        // When i exceeds the tail of the array, return to the head
        // When i exceeds the head of the array, return to the tail
        return ((i + self.capacity() as i32) % self.capacity() as i32) as usize;
    }

    /* Front enqueue */
    pub fn push_first(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("Double-ended queue is full");
            return;
        }
        // Move the front pointer one position to the left
        // Implement front crossing the head of the array to return to the tail by modulo operation
        self.front = self.index(self.front as i32 - 1);
        // Add num to the front
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* Rear enqueue */
    pub fn push_last(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("Double-ended queue is full");
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // Add num to the rear
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* Front dequeue */
    fn pop_first(&mut self) -> i32 {
        let num = self.peek_first();
        // Move front pointer one position backward
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* Rear dequeue */
    fn pop_last(&mut self) -> i32 {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* Access front element */
    fn peek_first(&self) -> i32 {
        if self.is_empty() {
            panic!("Double-ended queue is empty")
        };
        self.nums[self.front]
    }

    /* Access rear element */
    fn peek_last(&self) -> i32 {
        if self.is_empty() {
            panic!("Double-ended queue is empty")
        };
        // Calculate rear element index
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* Return array for printing */
    fn to_array(&self) -> Vec<i32> {
        // Only convert elements within valid length range
        let mut res = vec![0; self.que_size];
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
    /* Initialize double-ended queue */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("Double-ended queue deque =");
    print_util::print_array(&deque.to_array());

    /* Access element */
    let peek_first = deque.peek_first();
    print!("\nFront element peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nBack element peek_last = {}", peek_last);

    /* Element enqueue */
    deque.push_last(4);
    print!("\nElement 4 enqueued at the tail, deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\nElement 1 enqueued at the head, deque = ");
    print_util::print_array(&deque.to_array());

    /* Element dequeue */
    let pop_last = deque.pop_last();
    print!("\nDeque tail element = {}, after dequeuing from the tail", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\nDeque front element = {}, after dequeuing from the front", pop_first);
    print_util::print_array(&deque.to_array());

    /* Get the length of the double-ended queue */
    let size = deque.size();
    print!("\nLength of the double-ended queue size = {}", size);

    /* Determine if the double-ended queue is empty */
    let is_empty = deque.is_empty();
    print!("\nIs the double-ended queue empty = {}", is_empty);
}
