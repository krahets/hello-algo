/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */

use std::mem;

/* 开放寻址哈希表 */
pub struct HashMapOpenAddressing {
    size: usize,          // 键值对数量
    capacity: usize,      // 哈希表容量
    load_thres: f64,      // 触发扩容的负载因子阈值
    extend_ratio: usize,  // 扩容倍数
    buckets: Vec<Bucket>, // 桶数组
}

#[derive(Clone, PartialEq)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}

#[derive(Clone, PartialEq)]
enum Bucket {
    Empty,          // 空桶
    Tombstone,      // 删除标记
    Occupied(Pair), // 占用
}

impl HashMapOpenAddressing {
    /* 构造方法 */
    pub fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![Bucket::Empty; 4],
        }
    }

    /* 哈希函数 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % self.capacity
    }

    /* 负载因子 */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* 搜索 key 对应的桶索引 */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = None;
        // 线性探测，当遇到空桶时跳出
        while self.buckets[index] != Bucket::Empty {
            // 若遇到 key，返回对应的桶索引
            if let Bucket::Occupied(pair) = &self.buckets[index]
                && pair.key == key
            {
                // 若之前遇到了删除标记，则将键值对移动至该索引
                if let Some(first_tombstone) = first_tombstone {
                    let bucket = mem::replace(&mut self.buckets[index], Bucket::Tombstone);
                    self.buckets[first_tombstone] = bucket;
                    return first_tombstone; // 返回移动后的桶索引
                }
                return index; // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if first_tombstone.is_none() && self.buckets[index] == Bucket::Tombstone {
                first_tombstone = Some(index);
            }
            // 计算桶索引，越过尾部则返回头部
            index = (index + 1) % self.capacity;
        }
        // 若 key 不存在，则返回添加点的索引
        first_tombstone.unwrap_or(index)
    }

    /* 查询操作 */
    pub fn get(&mut self, key: i32) -> Option<&str> {
        // 搜索 key 对应的桶索引
        let index = self.find_bucket(key);
        // 若找到键值对，则返回对应 val
        if let Bucket::Occupied(pair) = &self.buckets[index] {
            return Some(&pair.val);
        }
        // 若键值对不存在，则返回 null
        None
    }

    /* 添加操作 */
    pub fn put(&mut self, key: i32, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // 搜索 key 对应的桶索引
        let index = self.find_bucket(key);
        // 若找到键值对，则覆盖 val 并返回
        if let Bucket::Occupied(pair) = &mut self.buckets[index] {
            pair.val = val;
            return;
        }
        // 若键值对不存在，则添加该键值对
        let pair = Pair { key, val };
        self.buckets[index] = Bucket::Occupied(pair);
        self.size += 1;
    }

    /* 删除操作 */
    pub fn remove(&mut self, key: i32) {
        // 搜索 key 对应的桶索引
        let index = self.find_bucket(key);
        // 若找到键值对，则用删除标记覆盖它
        if let Bucket::Occupied(_) = &mut self.buckets[index] {
            self.buckets[index] = Bucket::Tombstone;
            self.size -= 1;
        }
    }

    /* 扩容哈希表 */
    fn extend(&mut self) {
        // 暂存原哈希表
        let buckets = self.buckets.clone();
        // 初始化扩容后的新哈希表
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Bucket::Empty; self.capacity];
        self.size = 0;

        // 将键值对从原哈希表搬运至新哈希表
        for bucket in buckets {
            if let Bucket::Occupied(pair) = bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* 打印哈希表 */
    pub fn print(&self) {
        for bucket in &self.buckets {
            match bucket {
                Bucket::Empty => {
                    println!("Empty");
                }
                Bucket::Tombstone => {
                    println!("Tombstone");
                }
                Bucket::Occupied(pair) => {
                    println!("{} -> {}", pair.key, pair.val);
                }
            }
        }
    }
}

/* Driver Code */
fn main() {
    /* 初始化哈希表 */
    let mut hashmap = HashMapOpenAddressing::new();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    hashmap.put(12836, "小哈".to_string());
    hashmap.put(15937, "小啰".to_string());
    hashmap.put(16750, "小算".to_string());
    hashmap.put(13276, "小法".to_string());
    hashmap.put(10583, "小鸭".to_string());

    println!("添加完成后，哈希表为\nKey -> Value");
    hashmap.print();

    println!();

    /* 查询操作 */
    // 向哈希表中输入键 key，得到值 val
    let name = hashmap.get(13276).unwrap();
    println!("输入学号 13276 ，查询到姓名 {name}");

    println!();

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, val)
    hashmap.remove(16750);
    println!("删除 16750 后，哈希表为\nKey -> Value");
    hashmap.print();
}
