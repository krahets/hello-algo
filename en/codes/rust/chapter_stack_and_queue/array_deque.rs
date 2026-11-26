/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* Deque backed by a circular array */
struct ArrayDeque<T> {
    nums: Vec<T>,    // Array that stores the deque elements
    front: usize,    // Index of the front element
    que_size: usize, // Deque size
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

    /* Get the deque capacity */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* Get the deque size */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* Check whether the deque is empty */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Compute the circular array index */
    fn index(&self, i: i32) -> usize {
        // Use the remainder to wrap indices around the array
        // When i goes past the end, wrap it back to the start
        // When i goes before the start, wrap it around to the end
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* Add an element at the front */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Deque is full");
            return;
        }
        // Move the front index one slot to the left
        // Use the remainder to wrap front to the end if it goes before the start
        self.front = self.index(self.front as i32 - 1);
        // Add num at the front
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* Add an element at the rear */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Deque is full");
            return;
        }
        // Compute the index one slot past the rear element
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // Add num at the rear
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* Remove and return the front element */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // Advance the front index by one
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* Remove and return the rear element */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* Peek at the front element */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("Deque is empty")
        };
        self.nums[self.front]
    }

    /* Peek at the rear element */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("Deque is empty")
        };
        // Compute the index of the rear element
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* Return a vector for printing */
    fn to_array(&self) -> Vec<T> {
        // Copy only the elements currently in the deque
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* Driver code */
fn main() {
    /* Initialize the deque */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("deque = ");
    print_util::print_array(&deque.to_array());

    /* Peek at the front and rear elements */
    let peek_first = deque.peek_first();
    print!("\nFront element (peek_first) = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nRear element (peek_last) = {}", peek_last);

    /* Add elements to the deque */
    deque.push_last(4);
    print!("\nAfter adding 4 at the rear, deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\nAfter adding 1 at the front, deque = ");
    print_util::print_array(&deque.to_array());

    /* Remove elements from both ends */
    let pop_last = deque.pop_last();
    print!("\nRemoved from the rear = {}, deque after removal = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\nRemoved from the front = {}, deque after removal = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* Get the deque size */
    let size = deque.size();
    print!("\nDeque size = {}", size);

    /* Check whether the deque is empty */
    let is_empty = deque.is_empty();
    print!("\nDeque is empty = {}", is_empty);
}
