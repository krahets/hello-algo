/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */


struct ArrayQueue {
    nums: Vec<i32>,
    front: i32,
    que_size: i32,
    que_capacity: i32,
}

impl ArrayQueue {
    fn new(capacity: i32) -> ArrayQueue {
        ArrayQueue {
            nums: vec![0; capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    fn size(&self) -> i32 {
        self.que_size
    }

    fn push(&mut self, num: i32) {
        if self.que_size == self.que_capacity {
            return;
        }
        let rear = (self.front + self.que_size) % self.que_capacity;
        // self.nums.insert(rear as usize, num);
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    fn pop(&mut self) -> i32 {
        let num = self.peek();
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    fn peek(&self) -> i32 {
        self.nums[self.front as usize]
    }

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

    fn is_empty(&self) -> bool {
        self.size() == 0
    }
}

fn main() {
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("队列 queue = {:?}", queue.to_vector());

    let peek = queue.peek();
    println!("队首元素 peek = {}", peek);

    let pop = queue.pop();
    println!(
        "出队元素 pop = {:?},出队后 queue = {:?}",
        pop,
        queue.to_vector()
    );

    let size = queue.size();
    println!("队列长度 size = {}", size);

    let is_empty = queue.is_empty();
    println!("队列是否为空 = {}", is_empty);

    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {:?} 轮入队 + 出队后 queue = {:?}", i, queue.to_vector());
    }
}
