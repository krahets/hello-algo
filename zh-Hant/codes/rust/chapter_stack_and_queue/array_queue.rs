/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 基於環形陣列實現的佇列 */
struct ArrayQueue {
    nums: Vec<i32>,    // 用於儲存佇列元素的陣列
    front: i32,        // 佇列首指標，指向佇列首元素
    que_size: i32,     // 佇列長度
    que_capacity: i32, // 佇列容量
}

impl ArrayQueue {
    /* 建構子 */
    fn new(capacity: i32) -> ArrayQueue {
        ArrayQueue {
            nums: vec![0; capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    /* 獲取佇列的容量 */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* 獲取佇列的長度 */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* 判斷佇列是否為空 */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 入列 */
    fn push(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("佇列已滿");
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        // 透過取餘操作實現 rear 越過陣列尾部後回到頭部
        let rear = (self.front + self.que_size) % self.que_capacity;
        // 將 num 新增至佇列尾
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* 出列 */
    fn pop(&mut self) -> i32 {
        let num = self.peek();
        // 佇列首指標向後移動一位，若越過尾部，則返回到陣列頭部
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* 訪問佇列首元素 */
    fn peek(&self) -> i32 {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* 返回陣列 */
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
    /* 初始化佇列 */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* 元素入列 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("佇列 queue = {:?}", queue.to_vector());

    /* 訪問佇列首元素 */
    let peek = queue.peek();
    println!("佇列首元素 peek = {}", peek);

    /* 元素出列 */
    let pop = queue.pop();
    println!(
        "出列元素 pop = {:?},出列後 queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* 獲取佇列的長度 */
    let size = queue.size();
    println!("佇列長度 size = {}", size);

    /* 判斷佇列是否為空 */
    let is_empty = queue.is_empty();
    println!("佇列是否為空 = {}", is_empty);

    /* 測試環形陣列 */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {:?} 輪入列 + 出列後 queue = {:?}", i, queue.to_vector());
    }
}
