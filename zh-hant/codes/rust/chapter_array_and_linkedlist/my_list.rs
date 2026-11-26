/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 列表類別 */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // 陣列（用來儲存列表元素）
    capacity: usize,     // 列表容量
    size: usize,         // 列表長度（目前的元素數量）
    extend_ratio: usize, // 每次擴充列表容量的倍數
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* 建構方法 */
    pub fn new(capacity: usize) -> Self {
        let mut vec = vec![0; capacity];
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* 取得列表長度（目前的元素數量）*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* 取得列表容量 */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* 存取元素 */
    pub fn get(&self, index: usize) -> i32 {
        // 若索引超出範圍，就拋出例外，以下同理
        if index >= self.size {
            panic!("索引超出範圍")
        };
        return self.arr[index];
    }

    /* 更新元素 */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("索引超出範圍")
        };
        self.arr[index] = num;
    }

    /* 在尾端加入元素 */
    pub fn add(&mut self, num: i32) {
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // 更新元素數量
        self.size += 1;
    }

    /* 在中間插入元素 */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("索引超出範圍")
        };
        // 若加入元素後數量將超過容量，就觸發擴充機制
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // 將索引 index 起的所有元素往後移一格
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // 更新元素數量
        self.size += 1;
    }

    /* 刪除元素 */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("索引超出範圍")
        };
        let num = self.arr[index];
        // 將索引 index 之後的所有元素往前移一格
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // 更新元素數量
        self.size -= 1;
        // 回傳刪除的元素
        return num;
    }

    /* 擴充列表容量 */
    pub fn extend_capacity(&mut self) {
        // 建立長度為原陣列 extend_ratio 倍的新陣列，並將原陣列的內容複製過去
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // 更新列表容量
        self.capacity = new_capacity;
    }

    /* 將列表轉為陣列 */
    pub fn to_array(&self) -> Vec<i32> {
        // 僅轉換列表有效長度範圍內的元素
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* 範例主程式 */
fn main() {
    /* 初始化列表 */
    let mut nums = MyList::new(10);
    /* 在尾端加入元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("列表 nums = ");
    print_util::print_array(&nums.to_array());
    print!(" ，容量 = {}，長度 = {}", nums.capacity(), nums.size());

    /* 在中間插入元素 */
    nums.insert(3, 6);
    print!("\n在索引 3 處插入數字 6，得到 nums = ");
    print_util::print_array(&nums.to_array());

    /* 刪除元素 */
    nums.remove(3);
    print!("\n刪除索引 3 處的元素，得到 nums = ");
    print_util::print_array(&nums.to_array());

    /* 存取元素 */
    let num = nums.get(1);
    println!("\n存取索引 1 處的元素，得到 num = {num}");

    /* 更新元素 */
    nums.set(1, 0);
    print!("將索引 1 處的元素更新為 0，得到 nums = ");
    print_util::print_array(&nums.to_array());

    /* 測試容量擴充機制 */
    for i in 0..10 {
        // 當 i = 5，列表長度將超過容量，此時會觸發擴充機制
        nums.add(i);
    }
    print!("\n擴充後的列表 nums = ");
    print_util::print_array(&nums.to_array());
    print!(" ，容量 = {}，長度 = {}", nums.capacity(), nums.size());
}
