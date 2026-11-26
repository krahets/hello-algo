/*
 * File: array_queue.rs
 * Created Time: 2023-02-06
 * Author: WSL0809 (wslzzy@outlook.com)
 */

/* 以環狀陣列實作佇列 */
struct ArrayQueue<T> {
    nums: Vec<T>,      // 存放佇列元素的陣列
    front: i32,        // 隊首索引，記錄隊首元素在陣列中的位置
    que_size: i32,     // 佇列長度
    que_capacity: i32, // 佇列容量
}

impl<T: Copy + Default> ArrayQueue<T> {
    /* 建立新實例 */
    fn new(capacity: i32) -> ArrayQueue<T> {
        ArrayQueue {
            nums: vec![T::default(); capacity as usize],
            front: 0,
            que_size: 0,
            que_capacity: capacity,
        }
    }

    /* 取得佇列容量 */
    fn capacity(&self) -> i32 {
        self.que_capacity
    }

    /* 取得佇列長度 */
    fn size(&self) -> i32 {
        self.que_size
    }

    /* 判斷佇列是否為空 */
    fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 入隊 */
    fn push(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("佇列已滿");
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        // 取餘數，讓 rear 超過陣列末端時繞回開頭
        let rear = (self.front + self.que_size) % self.que_capacity;
        // 將 num 加到隊尾
        self.nums[rear as usize] = num;
        self.que_size += 1;
    }

    /* 出隊 */
    fn pop(&mut self) -> T {
        let num = self.peek();
        // 將隊首索引往後移一格，若超過陣列末端就繞回開頭
        self.front = (self.front + 1) % self.que_capacity;
        self.que_size -= 1;
        num
    }

    /* 讀取隊首元素 */
    fn peek(&self) -> T {
        if self.is_empty() {
            panic!("index out of bounds");
        }
        self.nums[self.front as usize]
    }

    /* 回傳 Vec */
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

/* 範例程式 */
fn main() {
    /* 初始化佇列 */
    let capacity = 10;
    let mut queue = ArrayQueue::new(capacity);

    /* 將元素加入佇列 */
    queue.push(1);
    queue.push(3);
    queue.push(2);
    queue.push(5);
    queue.push(4);
    println!("佇列 queue = {:?}", queue.to_vector());

    /* 讀取隊首元素 */
    let peek = queue.peek();
    println!("隊首元素 peek = {}", peek);

    /* 從佇列取出元素 */
    let pop = queue.pop();
    println!(
        "出隊元素 pop = {:?}，出隊後 queue = {:?}",
        pop,
        queue.to_vector()
    );

    /* 取得佇列長度 */
    let size = queue.size();
    println!("佇列長度 size = {}", size);

    /* 判斷佇列是否為空 */
    let is_empty = queue.is_empty();
    println!("佇列是否為空 = {}", is_empty);

    /* 測試環狀陣列 */
    for i in 0..10 {
        queue.push(i);
        queue.pop();
        println!("第 {:?} 輪入隊 + 出隊後 queue = {:?}", i, queue.to_vector());
    }
}
