/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* Queue implemented with a circular array */
struct ArrayQueue<T> {
    nums: Vec<T>,      // Array that stores the queue elements
    front: i32,        // Front index, identifying the first element
    que_size: i32,     // Queue size
    que_capacity: i32, // Queue capacity
}

impl<T: Copy + Default> ArrayQueue<T> {
    /* Constructor */
    fn new(capacity: i32) -> ArrayQueue<T> {
        ArrayQueue {
            nums: vec![T::default(); capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    /* Get the queue capacity */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* Get the queue size */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* Check whether the queue is empty */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Enqueue */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Queue is full");
            return;
        }
        // Calculate the rear index, one position past the last element
        // Use modulo to wrap rear to the beginning when it passes the end of the array
        let rear = (self.front + self.que_size) % self.que_capacity;
        // Add num to the rear
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* Dequeue */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // Advance the front index by one position, wrapping to the beginning if it passes the end
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* Access the front element */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("Index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* Return a vector */
    fn to_vector(&self) -> Vec<T> {
        let cap = self.que_capacity;
        let mut j = self.front;
        let mut arr = vec![T::default(); cap as usize];
        for i in 0..self.que_size {
            arr[i as usize] = self.nums[(j % cap) as usize];
            j += 1;
        }
        arr
    }
}

/* Driver code */
fn main() {
    /* Initialize the queue */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* Enqueue elements */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("Queue queue = {:?}", queue.to_vector());

    /* Access the front element */
    let peek = queue.peek();
    println!("Front element peek = {}", peek);

    /* Dequeue an element */
    let pop = queue.pop();
    println!(
        "Dequeued element pop = {:?}; after dequeueing, queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* Get the queue size */
    let size = queue.size();
    println!("Queue size = {}", size);

    /* Check whether the queue is empty */
    let is_empty = queue.is_empty();
    println!("Is the queue empty? {}", is_empty);

    /* Test the circular array */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("After enqueueing and dequeueing in round {:?}, queue = {:?}", i, queue.to_vector());
    }
}
