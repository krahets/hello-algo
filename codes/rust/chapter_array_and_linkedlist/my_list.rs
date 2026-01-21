/*
 * File: my_list.rs
 * Created Time: 2023-03-11
 * Author: codingonion (coderonion@gmail.com)
 */

use std::fmt;

/* 列表类 */
pub struct MyList {
    arr: Vec<i32>,       // 数组（存储列表元素）
    capacity: usize,     // 列表容量
    size: usize,         // 列表长度（当前元素数量）
    extend_ratio: usize, // 每次列表扩容的倍数
}

impl MyList {
    /* 构造方法 */
    pub fn new(capacity: usize) -> Self {
        Self {
            arr: vec![0; capacity],
            capacity,
            size: 0,
            extend_ratio: 2,
        }
    }

    /* 获取列表长度（当前元素数量）*/
    pub fn size(&self) -> usize {
        self.size
    }

    /* 获取列表容量 */
    pub fn capacity(&self) -> usize {
        self.capacity
    }

    /* 访问元素 */
    pub fn get(&self, index: usize) -> i32 {
        // 索引如果越界，则抛出异常，下同
        if index >= self.size {
            panic!("索引越界");
        }
        self.arr[index]
    }

    /* 更新元素 */
    pub fn set(&mut self, index: usize, num: i32) {
        if index >= self.size {
            panic!("索引越界");
        }
        self.arr[index] = num;
    }

    /* 在尾部添加元素 */
    pub fn add(&mut self, num: i32) {
        // 元素数量超出容量时，触发扩容机制
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        self.arr[self.size] = num;
        // 更新元素数量
        self.size += 1;
    }

    /* 在中间插入元素 */
    pub fn insert(&mut self, index: usize, num: i32) {
        if index >= self.size() {
            panic!("索引越界");
        }
        // 元素数量超出容量时，触发扩容机制
        if self.size == self.capacity() {
            self.extend_capacity();
        }
        // 将索引 index 以及之后的元素都向后移动一位
        for j in (index..self.size).rev() {
            self.arr[j + 1] = self.arr[j];
        }
        self.arr[index] = num;
        // 更新元素数量
        self.size += 1;
    }

    /* 删除元素 */
    pub fn remove(&mut self, index: usize) -> i32 {
        if index >= self.size() {
            panic!("索引越界");
        }
        let num = self.arr[index];
        // 将索引 index 之后的元素都向前移动一位
        for j in index..self.size - 1 {
            self.arr[j] = self.arr[j + 1];
        }
        // 更新元素数量
        self.size -= 1;
        // 返回被删除的元素
        num
    }

    /* 列表扩容 */
    pub fn extend_capacity(&mut self) {
        // 如果原数组容量为 0，新建一个长度为 4 的新数组，否则新建一个长度为原数组 extend_ratio 倍的新数组；
        // 将原数组复制到新数组
        let new_capacity = if self.capacity == 0 {
            4
        } else {
            self.capacity * self.extend_ratio
        };
        self.arr.resize(new_capacity, 0);
        // 更新列表容量
        self.capacity = new_capacity;
    }

    /* 将列表转换为数组 */
    pub fn to_array(&self) -> Vec<i32> {
        // 仅转换有效长度范围内的列表元素
        self.arr[0..self.size].to_vec()
    }
}

/* 实现列表的打印功能 */
impl fmt::Display for MyList {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        f.debug_list().entries(&self.arr[0..self.size]).finish()
    }
}

/* Driver Code */
fn main() {
    /* 初始化列表 */
    let mut nums = MyList::new(5);
    /* 在尾部添加元素 */
    nums.add(1);
    nums.add(3);
    nums.add(2);
    nums.add(5);
    nums.add(4);
    println!(
        "列表 nums = {} ，容量 = {} ，长度 = {}",
        nums,
        nums.capacity(),
        nums.size()
    );

    /* 在中间插入元素 */
    nums.insert(3, 6);
    println!("在索引 3 处插入数字 6 ，得到 nums = {nums}");

    /* 删除元素 */
    nums.remove(3);
    println!("删除索引 3 处的元素，得到 nums = {nums}");

    /* 访问元素 */
    let num = nums.get(1);
    println!("访问索引 1 处的元素，得到 num = {num}");

    /* 更新元素 */
    nums.set(1, 0);
    println!("将索引 1 处的元素更新为 0 ，得到 nums = {nums}");

    /* 测试扩容机制 */
    for i in 0..10 {
        // 在 i = 5 时，列表长度将超出列表容量，此时触发扩容机制
        nums.add(i);
    }
    println!(
        "扩容后的列表 nums = {} ，容量 = {} ，长度 = {}",
        nums,
        nums.capacity(),
        nums.size()
    );
}
