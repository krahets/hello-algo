/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use std::fmt;

/* 基于环形数组实现的双向队列 */
pub struct ArrayDeque<T> {
    nums: Vec<T>, // 用于存储双向队列元素的数组
    front: usize, // 队首指针，指向队首元素
    size: usize,  // 双向队列长度
}

impl<T> ArrayDeque<T> {
    /* 构造方法 */
    pub fn new(capacity: usize) -> Self
    where
        T: Default,
    {
        Self {
            nums: (0..capacity).map(|_| T::default()).collect(),
            front: 0,
            size: 0,
        }
    }

    /* 获取双向队列的容量 */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 获取双向队列的长度 */
    pub fn size(&self) -> usize {
        self.size
    }

    /* 判断双向队列是否为空 */
    pub fn is_empty(&self) -> bool {
        self.size == 0
    }

    /* 队首入队 */
    pub fn push_first(&mut self, num: T) {
        if self.size == self.capacity() {
            panic!("双向队列已满");
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        self.front = (self.capacity() + self.front - 1) % self.capacity();
        // 将 num 添加至队首
        self.nums[self.front] = num;
        self.size += 1;
    }

    /* 队尾入队 */
    pub fn push_last(&mut self, num: T) {
        if self.size == self.capacity() {
            panic!("双向队列已满");
        }
        // 计算队尾指针，指向队尾索引 + 1
        let rear = (self.front + self.size) % self.capacity();
        // 将 num 添加至队尾
        self.nums[rear] = num;
        self.size += 1;
    }

    /* 队首出队 */
    pub fn pop_first(&mut self) -> Option<T>
    where
        T: Clone,
    {
        if self.is_empty() {
            return None;
        };
        let num = self.nums[self.front].clone();
        // 队首指针向后移动一位
        self.front = (self.front + 1) % self.capacity();
        self.size -= 1;
        Some(num)
    }

    /* 队尾出队 */
    pub fn pop_last(&mut self) -> Option<T>
    where
        T: Clone,
    {
        if self.is_empty() {
            return None;
        };
        let last = (self.front + self.size - 1) % self.capacity();
        let num = self.nums[last].clone();
        self.size -= 1;
        Some(num)
    }

    /* 访问队首元素 */
    pub fn peek_first(&self) -> Option<&T> {
        if self.is_empty() {
            return None;
        };
        Some(&self.nums[self.front])
    }

    /* 访问队尾元素 */
    pub fn peek_last(&self) -> Option<&T> {
        if self.is_empty() {
            return None;
        };
        // 计算尾元素索引
        let last = (self.front + self.size - 1) % self.capacity();
        Some(&self.nums[last])
    }

    /* 返回数组用于打印 */
    pub fn to_array(&self) -> Vec<T>
    where
        T: Clone,
    {
        // 仅转换有效长度范围内的列表元素
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

impl<T> fmt::Display for ArrayDeque<T>
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
    /* 初始化双向队列 */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    println!("双向队列 deque = {deque}");

    /* 访问元素 */
    let peek_first = deque.peek_first().unwrap();
    println!("队首元素 peek_first = {peek_first}");
    let peek_last = deque.peek_last().unwrap();
    println!("队尾元素 peek_last = {peek_last}");

    /* 元素入队 */
    deque.push_last(4);
    println!("元素 4 队尾入队后 deque = {deque}");
    deque.push_first(1);
    println!("元素 1 队首入队后 deque = {deque}");

    /* 元素出队 */
    let pop_last = deque.pop_last().unwrap();
    println!("队尾出队元素 = {pop_last}，队尾出队后 deque = {deque}");
    let pop_first = deque.pop_first().unwrap();
    println!("队首出队元素 = {pop_first}，队首出队后 deque = {deque}");

    /* 获取双向队列的长度 */
    let size = deque.size();
    println!("双向队列长度 size = {size}");

    /* 判断双向队列是否为空 */
    let is_empty = deque.is_empty();
    println!("双向队列是否为空 = {is_empty}");
}
