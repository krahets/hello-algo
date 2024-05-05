/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* Queue class based on circular array */
struct ArrayQueue {
    nums: Vec<i32>,    // Array for storing queue elements
    front: i32,        // Front pointer, pointing to the front element
    que_size: i32,     // Queue length
    que_capacity: i32, // Queue capacity
}

impl ArrayQueue {
    /* Constructor */
    fn new(capacity: i32) -> ArrayQueue {
        ArrayQueue {
            nums: vec![0; capacity as usize],
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

    /* Determine if the queue is empty */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* Enqueue */
    fn push(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("Queue is full");
            return;
        }
        // Calculate rear pointer, pointing to rear index + 1
        // Use modulo operation to wrap the rear pointer from the end of the array back to the start
        let rear = (self.front + self.que_size) % self.que_capacity;
        // Add num to the rear
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* Dequeue */
    fn pop(&mut self) -> i32 {
        let num = self.peek();
        // Move front pointer one position backward, returning to the head of the array if it exceeds the tail
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* Access front element */
    fn peek(&self) -> i32 {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* Return array */
    fn to_vector(&self) -> Vec<i32> {
        let cap = self.que_capacity;
        let mut j = self.front;
        let mut arr = vec![0; self.que_size as usize];
        for i in 0..self.que_size {
            arr[i as usize] = self.nums[(j % cap) as usize];
            j += 1;
        }
        arr
    }
}

/* Driver Code */
fn main() {
    /* Initialize queue */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* Element enqueue */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("Queue queue = {:?}", queue.to_vector());

    /* Access front element */
    let peek = queue.peek();
    println!("Front element peek = {}", peek);

    /* Element dequeue */
    let pop = queue.pop();
    println!(
        "Dequeued element = {:?}, after dequeuing queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* Get the length of the queue */
    let size = queue.size();
    println!("Length of the queue size = {}", size);

    /* Determine if the queue is empty */
    let is_empty = queue.is_empty();
    println!("Is the queue empty = {}", is_empty);

    /* Test circular array */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("After the {:?}th round of enqueueing + dequeuing, queue = {:?}", i, queue.to_vector());
    }
}
