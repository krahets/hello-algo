/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 基于环形数组实现的队列 */
struct ArrayQueue {
    nums: Vec<i32>,    // 用于存储队列元素的数组
    front: i32,        // 队首指针，指向队首元素
    que_size: i32,     // 队列长度
    que_capacity: i32, // 队列容量
}

impl ArrayQueue {
    /* 构造方法 */
    fn new(capacity: i32) -> ArrayQueue {
        ArrayQueue {
            nums: vec![0; capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    /* 获取队列的容量 */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* 获取队列的长度 */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* 判断队列是否为空 */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 入队 */
    fn push(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("队列已满");
            return;
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作实现 rear 越过数组尾部后回到头部
        let rear = (self.front + self.que_size) % self.que_capacity;
        // 将 num 添加至队尾
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* 出队 */
    fn pop(&mut self) -> i32 {
        let num = self.peek();
        // 队首指针向后移动一位，若越过尾部，则返回到数组头部
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* 访问队首元素 */
    fn peek(&self) -> i32 {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* 返回数组 */
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
    /* 初始化队列 */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* 元素入队 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("队列 queue = {:?}", queue.to_vector());

    /* 访问队首元素 */
    let peek = queue.peek();
    println!("队首元素 peek = {}", peek);

    /* 元素出队 */
    let pop = queue.pop();
    println!(
        "出队元素 pop = {:?},出队后 queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* 获取队列的长度 */
    let size = queue.size();
    println!("队列长度 size = {}", size);

    /* 判断队列是否为空 */
    let is_empty = queue.is_empty();
    println!("队列是否为空 = {}", is_empty);

    /* 测试环形数组 */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {:?} 轮入队 + 出队后 queue = {:?}", i, queue.to_vector());
    }
}
