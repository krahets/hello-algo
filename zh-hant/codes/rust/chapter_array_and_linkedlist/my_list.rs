/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use hello_algo_rust::include::print_util;

/* 串列類別 */
#[allow(dead_code)]
struct MyList {
    arr: Vec<i32>,       // 陣列（儲存串列元素）
    capacity: usize,     // 串列容量
    size: usize,         // 串列長度（當前元素數量）
    extend_ratio: usize, // 每次串列擴容的倍數
}

#[allow(unused, unused_comparisons)]
impl MyList {
    /* 建構子 */
    pub fn new(capacity: usize) -> Self {
        let mut vec = Vec::new();
        vec.resize(capacity, 0);
        Self {
            arr: vec,
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* 獲取串列長度（當前元素數量）*/
    pub fn size(&self) -> usize {
        return self.size;
    }

    /* 獲取串列容量 */
    pub fn capacity(&self) -> usize {
        return self.capacity;
    }

    /* 訪問元素 */
    pub fn get(&self, index: usize) -> i32 {
        // 索引如果越界，則丟擲異常，下同
        if index >= self.size {
            panic!("索引越界")
        };
        return self.arr[index];
    }

    /* 更新元素 */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("索引越界")
        };
        self.arr[index] = num;
    }

    /* 在尾部新增元素 */
    pub fn add(&mut self, num: i32) {
        // 元素數量超出容量時，觸發擴容機制
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
            panic!("索引越界")
        };
        // 元素數量超出容量時，觸發擴容機制
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // 將索引 index 以及之後的元素都向後移動一位
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
            panic!("索引越界")
        };
        let num = self.arr[index];
        // 將將索引 index 之後的元素都向前移動一位
        for j in (index..self.size - 1) {
            self.arr[j] = self.arr[j + 1];
        }
        // 更新元素數量
        self.size -= 1;
        // 返回被刪除的元素
        return num;
    }

    /* 串列擴容 */
    pub fn extend_capacity(&mut self) {
        // 新建一個長度為原陣列 extend_ratio 倍的新陣列，並將原陣列複製到新陣列
        let new_capacity = self.capacity * self.extend_ratio;
        self.arr.resize(new_capacity, 0);
        // 更新串列容量
        self.capacity = new_capacity;
    }

    /* 將串列轉換為陣列 */
    pub fn to_array(&mut self) -> Vec<i32> {
        // 僅轉換有效長度範圍內的串列元素
        let mut arr = Vec::new();
        for i in 0..self.size {
            arr.push(self.get(i));
        }
        arr
    }
}

/* Driver Code */
fn main() {
    /* 初始化串列 */
    let mut nums = MyList::new(10);
    /* 在尾部新增元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    print!("串列 nums = ");
    print_util::print_array(&nums.to_array());
    print!(" ，容量 = {} ，長度 = {}", nums.capacity(), nums.size());

    /* 在中間插入元素 */
    nums.insert(3, 6);
    print!("\n在索引 3 處插入數字 6 ，得到 nums = ");
    print_util::print_array(&nums.to_array());

    /* 刪除元素 */
    nums.remove(3);
    print!("\n刪除索引 3 處的元素，得到 nums = ");
    print_util::print_array(&nums.to_array());

    /* 訪問元素 */
    let num = nums.get(1);
    println!("\n訪問索引 1 處的元素，得到 num = {num}");

    /* 更新元素 */
    nums.set(1, 0);
    print!("將索引 1 處的元素更新為 0 ，得到 nums = ");
    print_util::print_array(&nums.to_array());

    /* 測試擴容機制 */
    for i in 0..10 {
        // 在 i = 5 時，串列長度將超出串列容量，此時觸發擴容機制
        nums.add(i);
    }
    print!("\n擴容後的串列 nums = ");
    print_util::print_array(&nums.to_array());
    print!(" ，容量 = {} ，長度 = {}", nums.capacity(), nums.size());
}
