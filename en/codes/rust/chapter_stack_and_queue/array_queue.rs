/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* Queue based on circular array implementation */
struct ArrayQueue<T> {
    nums: Vec<T>,      // Array for storing queue elements
    front: i32,        // Front pointer, points to the front of the queue element
    que_size: i32,     // Queue length
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

    /* Get the capacity of the queue */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* Get the length of the queue */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* Check if the queue is empty */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Enqueue */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("Queue is full");
            return;
        }
        // Use modulo operation to wrap rear around to the head after passing the tail of the array
        // Add num to the rear of the queue
        let rear = (self.front + self.que_size) % self.que_capacity;
        // Front pointer moves one position backward
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* Dequeue */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // Move front pointer backward by one position, if it passes the tail, return to array head
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* Return list for printing */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* Return array */
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

/* Driver Code */
fn main() {
    /* Access front of the queue element */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* Elements enqueue */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("Queue queue = {:?}", queue.to_vector());

    /* Return list for printing */
    let peek = queue.peek();
    println!("Front element peek = {}", peek);

    /* Element dequeue */
    let pop = queue.pop();
    println!(
        "Dequeue element pop = {:?}, after dequeue queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* Get the length of the queue */
    let size = queue.size();
    println!("Queue length size = {}", size);

    /* Check if the queue is empty */
    let is_empty = queue.is_empty();
    println!("Is queue empty = {}", is_empty);

    /* Test circular array */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("After round {:?} of enqueue + dequeue, queue = {:?}", i, queue.to_vector());
    }
}
