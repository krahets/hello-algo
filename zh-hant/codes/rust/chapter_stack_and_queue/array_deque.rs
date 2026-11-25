/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* 以環狀陣列實作雙端佇列 */
struct ArrayDeque<T> {
    nums: Vec<T>,    // 存放雙端佇列元素的陣列
    front: usize,    // 隊首索引，記錄隊首元素在陣列中的位置
    que_size: usize, // 雙端佇列長度
}

impl<T: Copy + Default> ArrayDeque<T> {
    /* 建立新實例 */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![T::default(); capacity],
            front: 0,
            que_size: 0,
        }
    }

    /* 取得雙端佇列容量 */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 取得雙端佇列長度 */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* 判斷雙端佇列是否為空 */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 計算環狀陣列的索引 */
    fn index(&self, i: i32) -> usize {
        // 取餘數，讓陣列的首尾相接
        // 當 i 超過陣列末端時，繞回開頭
        // 當 i 越過陣列開頭時，繞回末端
        ((i + self.capacity() as i32) % self.capacity() as i32) as usize
    }

    /* 從隊首加入元素 */
    pub fn push_first(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("雙端佇列已滿");
            return;
        }
        // 將隊首索引往左移一格
        // 取餘數，讓 front 越過陣列開頭時繞回末端
        self.front = self.index(self.front as i32 - 1);
        // 將 num 加到隊首
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* 從隊尾加入元素 */
    pub fn push_last(&mut self, num: T) {
        if self.que_size == self.capacity() {
            println!("雙端佇列已滿");
            return;
        }
        // 計算下一次從隊尾寫入的位置 rear（隊尾索引 + 1）
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // 將 num 加到隊尾
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* 從隊首取出元素 */
    fn pop_first(&mut self) -> T {
        let num = self.peek_first();
        // 將隊首索引往後移一格
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* 從隊尾取出元素 */
    fn pop_last(&mut self) -> T {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* 讀取隊首元素 */
    fn peek_first(&self) -> T {
        if self.is_empty() {
            panic!("雙端佇列為空")
        };
        self.nums[self.front]
    }

    /* 讀取隊尾元素 */
    fn peek_last(&self) -> T {
        if self.is_empty() {
            panic!("雙端佇列為空")
        };
        // 計算隊尾元素的索引
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* 回傳 Vec 以便輸出 */
    fn to_array(&self) -> Vec<T> {
        // 只轉換雙端佇列中實際存放的元素
        let mut res = vec![T::default(); self.que_size];
        let mut j = self.front;
        for i in 0..self.que_size {
            res[i] = self.nums[self.index(j as i32)];
            j += 1;
        }
        res
    }
}

/* 範例程式 */
fn main() {
    /* 初始化雙端佇列 */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("雙端佇列 deque = ");
    print_util::print_array(&deque.to_array());

    /* 讀取隊首與隊尾元素 */
    let peek_first = deque.peek_first();
    print!("\n隊首元素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\n隊尾元素 peek_last = {}", peek_last);

    /* 將元素加入雙端佇列 */
    deque.push_last(4);
    print!("\n將元素 4 加到隊尾後 deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n將元素 1 加到隊首後 deque = ");
    print_util::print_array(&deque.to_array());

    /* 從雙端佇列取出元素 */
    let pop_last = deque.pop_last();
    print!("\n從隊尾取出的元素 = {}，取出後 deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\n從隊首取出的元素 = {}，取出後 deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 取得雙端佇列長度 */
    let size = deque.size();
    print!("\n雙端佇列長度 size = {}", size);

    /* 判斷雙端佇列是否為空 */
    let is_empty = deque.is_empty();
    print!("\n雙端佇列是否為空 = {}", is_empty);
}
