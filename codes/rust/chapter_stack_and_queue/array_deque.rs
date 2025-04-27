/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* 基于环形数组实现的双向队列 */
struct ArrayDeque {
    nums: Vec<i32>,  // 用于存储双向队列元素的数组
    front: usize,    // 队首指针，指向队首元素
    que_size: usize, // 双向队列长度
}

impl ArrayDeque {
    /* 构造方法 */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![0; capacity],
            front: 0,
            que_size: 0,
        }
    }

    /* 获取双向队列的容量 */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 获取双向队列的长度 */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* 判断双向队列是否为空 */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 计算环形数组索引 */
    fn index(&self, i: i32) -> usize {
        // 通过取余操作实现数组首尾相连
        // 当 i 越过数组尾部后，回到头部
        // 当 i 越过数组头部后，回到尾部
        return ((i + self.capacity() as i32) % self.capacity() as i32) as usize;
    }

    /* 队首入队 */
    pub fn push_first(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("双向队列已满");
            return;
        }
        // 队首指针向左移动一位
        // 通过取余操作实现 front 越过数组头部后回到尾部
        self.front = self.index(self.front as i32 - 1);
        // 将 num 添加至队首
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* 队尾入队 */
    pub fn push_last(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("双向队列已满");
            return;
        }
        // 计算队尾指针，指向队尾索引 + 1
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // 将 num 添加至队尾
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* 队首出队 */
    fn pop_first(&mut self) -> i32 {
        let num = self.peek_first();
        // 队首指针向后移动一位
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* 队尾出队 */
    fn pop_last(&mut self) -> i32 {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* 访问队首元素 */
    fn peek_first(&self) -> i32 {
        if self.is_empty() {
            panic!("双向队列为空")
        };
        self.nums[self.front]
    }

    /* 访问队尾元素 */
    fn peek_last(&self) -> i32 {
        if self.is_empty() {
            panic!("双向队列为空")
        };
        // 计算尾元素索引
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* 返回数组用于打印 */
    fn to_array(&self) -> Vec<i32> {
        // 仅转换有效长度范围内的列表元素
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
    /* 初始化双向队列 */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("双向队列 deque = ");
    print_util::print_array(&deque.to_array());

    /* 访问元素 */
    let peek_first = deque.peek_first();
    print!("\n队首元素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\n队尾元素 peek_last = {}", peek_last);

    /* 元素入队 */
    deque.push_last(4);
    print!("\n元素 4 队尾入队后 deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n元素 1 队首入队后 deque = ");
    print_util::print_array(&deque.to_array());

    /* 元素出队 */
    let pop_last = deque.pop_last();
    print!("\n队尾出队元素 = {}，队尾出队后 deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\n队首出队元素 = {}，队首出队后 deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 获取双向队列的长度 */
    let size = deque.size();
    print!("\n双向队列长度 size = {}", size);

    /* 判断双向队列是否为空 */
    let is_empty = deque.is_empty();
    print!("\n双向队列是否为空 = {}", is_empty);
}
