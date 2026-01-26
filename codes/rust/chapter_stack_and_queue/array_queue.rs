/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use std::fmt;

/* 基于环形数组实现的队列 */
pub struct ArrayQueue<T> {
    nums: Vec<T>, // 用于存储队列元素的数组
    front: usize, // 队首指针，指向队首元素
    size: usize,  // 队列长度
}

impl<T> ArrayQueue<T> {
    /* 构造方法 */
    pub fn new(capacity: usize) -> ArrayQueue<T>
    where
        T: Default,
    {
        Self {
            nums: (0..capacity).map(|_| T::default()).collect(),
            front: 0,
            size: 0,
        }
    }

    /* 获取队列的容量 */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 获取队列的长度 */
    pub fn size(&self) -> usize {
        self.size
    }

    /* 判断队列是否为空 */
    pub fn is_empty(&self) -> bool {
        self.size == 0
    }

    /* 入队 */
    pub fn push(&mut self, num: T) {
        if self.size == self.capacity() {
            panic!("队列已满");
        }
        // 计算队尾指针，指向队尾索引 + 1
        // 通过取余操作实现 rear 越过数组尾部后回到头部
        let rear = (self.front + self.size) % self.capacity();
        // 将 num 添加至队尾
        self.nums[rear] = num;
        self.size += 1;
    }

    /* 出队 */
    pub fn pop(&mut self) -> Option<T>
    where
        T: Clone,
    {
        if self.is_empty() {
            return None;
        }
        let num = self.nums[self.front].clone();
        // 队首指针向后移动一位，若越过尾部，则返回到数组头部
        self.front = (self.front + 1) % self.capacity();
        self.size -= 1;
        Some(num)
    }

    /* 访问队首元素 */
    pub fn peek(&self) -> Option<&T> {
        if self.is_empty() {
            return None;
        }
        Some(&self.nums[self.front])
    }

    /* 返回数组 */
    pub fn to_array(&self) -> Vec<T>
    where
        T: Clone,
    {
        let mut res = Vec::with_capacity(self.size);
        for index in self.front..(self.front + self.size) {
            // 考虑存在不变式 `self.size <= self.capacity()`，
            // 且 `self.size == 0` 时不会进入该循环，除零错误不会发生。
            let index = index % self.capacity();
            let num = self.nums[index].clone();
            res.push(num);
        }
        res
    }
}

impl<T> fmt::Display for ArrayQueue<T>
where
    T: fmt::Display,
{
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        if self.is_empty() {
            return write!(f, "[]");
        }
        write!(f, "[{}", self.nums[self.front])?;
        for index in (self.front + 1)..(self.front + self.size) {
            let index = index % self.capacity();
            write!(f, ", {}", self.nums[index])?;
        }
        write!(f, "]")
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
    println!("队列 queue = {queue}");

    /* 访问队首元素 */
    let peek = queue.peek().unwrap();
    println!("队首元素 peek = {peek}");

    /* 元素出队 */
    let pop = queue.pop().unwrap();
    println!("出队元素 pop = {pop}，出队后 queue = {queue}");

    /* 获取队列的长度 */
    let size = queue.size();
    println!("队列长度 size = {size}");

    /* 判断队列是否为空 */
    let is_empty = queue.is_empty();
    println!("队列是否为空 = {}", is_empty);

    /* 测试环形数组 */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {i} 轮入队 + 出队后 queue = {queue}");
    }
}
