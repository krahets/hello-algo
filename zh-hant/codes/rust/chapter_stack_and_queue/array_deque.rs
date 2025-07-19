/*
 * File: array_deque.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */
use hello_algo_rust::include::print_util;
/* 基於環形陣列實現的雙向佇列 */
struct ArrayDeque {
    nums: Vec<i32>,  // 用於儲存雙向佇列元素的陣列
    front: usize,    // 佇列首指標，指向佇列首元素
    que_size: usize, // 雙向佇列長度
}

impl ArrayDeque {
    /* 建構子 */
    pub fn new(capacity: usize) -> Self {
        Self {
            nums: vec![0; capacity],
            front: 0,
            que_size: 0,
        }
    }

    /* 獲取雙向佇列的容量 */
    pub fn capacity(&self) -> usize {
        self.nums.len()
    }

    /* 獲取雙向佇列的長度 */
    pub fn size(&self) -> usize {
        self.que_size
    }

    /* 判斷雙向佇列是否為空 */
    pub fn is_empty(&self) -> bool {
        self.que_size == 0
    }

    /* 計算環形陣列索引 */
    fn index(&self, i: i32) -> usize {
        // 透過取餘操作實現陣列首尾相連
        // 當 i 越過陣列尾部後，回到頭部
        // 當 i 越過陣列頭部後，回到尾部
        return ((i + self.capacity() as i32) % self.capacity() as i32) as usize;
    }

    /* 佇列首入列 */
    pub fn push_first(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("雙向佇列已滿");
            return;
        }
        // 佇列首指標向左移動一位
        // 透過取餘操作實現 front 越過陣列頭部後回到尾部
        self.front = self.index(self.front as i32 - 1);
        // 將 num 新增至佇列首
        self.nums[self.front] = num;
        self.que_size += 1;
    }

    /* 佇列尾入列 */
    pub fn push_last(&mut self, num: i32) {
        if self.que_size == self.capacity() {
            println!("雙向佇列已滿");
            return;
        }
        // 計算佇列尾指標，指向佇列尾索引 + 1
        let rear = self.index(self.front as i32 + self.que_size as i32);
        // 將 num 新增至佇列尾
        self.nums[rear] = num;
        self.que_size += 1;
    }

    /* 佇列首出列 */
    fn pop_first(&mut self) -> i32 {
        let num = self.peek_first();
        // 佇列首指標向後移動一位
        self.front = self.index(self.front as i32 + 1);
        self.que_size -= 1;
        num
    }

    /* 佇列尾出列 */
    fn pop_last(&mut self) -> i32 {
        let num = self.peek_last();
        self.que_size -= 1;
        num
    }

    /* 訪問佇列首元素 */
    fn peek_first(&self) -> i32 {
        if self.is_empty() {
            panic!("雙向佇列為空")
        };
        self.nums[self.front]
    }

    /* 訪問佇列尾元素 */
    fn peek_last(&self) -> i32 {
        if self.is_empty() {
            panic!("雙向佇列為空")
        };
        // 計算尾元素索引
        let last = self.index(self.front as i32 + self.que_size as i32 - 1);
        self.nums[last]
    }

    /* 返回陣列用於列印 */
    fn to_array(&self) -> Vec<i32> {
        // 僅轉換有效長度範圍內的串列元素
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
    /* 初始化雙向佇列 */
    let mut deque = ArrayDeque::new(10);
    deque.push_last(3);
    deque.push_last(2);
    deque.push_last(5);
    print!("雙向佇列 deque = ");
    print_util::print_array(&deque.to_array());

    /* 訪問元素 */
    let peek_first = deque.peek_first();
    print!("\n佇列首元素 peek_first = {}", peek_first);
    let peek_last = deque.peek_last();
    print!("\n佇列尾元素 peek_last = {}", peek_last);

    /* 元素入列 */
    deque.push_last(4);
    print!("\n元素 4 佇列尾入列後 deque = ");
    print_util::print_array(&deque.to_array());
    deque.push_first(1);
    print!("\n元素 1 佇列首入列後 deque = ");
    print_util::print_array(&deque.to_array());

    /* 元素出列 */
    let pop_last = deque.pop_last();
    print!("\n佇列尾出列元素 = {}，佇列尾出列後 deque = ", pop_last);
    print_util::print_array(&deque.to_array());
    let pop_first = deque.pop_first();
    print!("\n佇列首出列元素 = {}，佇列首出列後 deque = ", pop_first);
    print_util::print_array(&deque.to_array());

    /* 獲取雙向佇列的長度 */
    let size = deque.size();
    print!("\n雙向佇列長度 size = {}", size);

    /* 判斷雙向佇列是否為空 */
    let is_empty = deque.is_empty();
    print!("\n雙向佇列是否為空 = {}", is_empty);
}
