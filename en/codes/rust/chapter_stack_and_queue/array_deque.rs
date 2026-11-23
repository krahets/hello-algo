/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* Deque implemented with a circular array */
struct ArrayDeque<T> {
    nums: Vec<T>,    // Array for storing deque elements
    front: usize,    // Front index, identifying the first element
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

    /* Calculate an index in the circular array */
    fn index(&self, i: i32) -> usize {
        // Use modulo to connect the end of the array to its beginning
        // When i passes the end of the array, wrap around to the beginning
        // When i passes the beginning of the array, wrap around to the end
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* Enqueue at the front */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Deque is full");
            return;
        }
        // Move the front index one position to the left
        // Use modulo to wrap front to the end when it passes the beginning of the array
        self.front = self.index(self.front as i32 - 1);
        // Add num to the front
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* Enqueue at the rear */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Deque is full");
            return;
        }
        // Calculate the rear index, one position past the last element
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // Add num to the rear
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* Dequeue from the front */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // Advance the front index by one position
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* Dequeue from the rear */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* Access the front element */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("Deque is empty")
        };
        self.nums[self.front]
    }

    /* Access the rear element */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("Deque is empty")
        };
        // Calculate the index of the last element
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* Return a vector for printing */
    fn to_array(&self) -> Vec<T> {
        // Convert only the list elements within the occupied range
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
    print!("Deque deque = ");
    print_util::print_array(&deque.to_array());

    /* Access an element */
    let peek_first = deque.peek_first();
    print!("\nFront element peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\nRear element peek_last = {}", peek_last);

    /* Enqueue elements */
    deque.push_last(4);
    print!("\nAfter enqueuing element 4 at the rear, deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\nAfter enqueuing element 1 at the front, deque = ");
    print_util::print_array(&deque.to_array());

    /* Dequeue an element */
    let pop_last = deque.pop_last();
    print!("\nElement removed from the rear = {}; after removal, deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\nElement removed from the front = {}; after removal, deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* Get the deque size */
    let size = deque.size();
    print!("\nDeque size = {}", size);

    /* Check whether the deque is empty */
    let is_empty = deque.is_empty();
    print!("\nIs the deque empty? {}", is_empty);
}
