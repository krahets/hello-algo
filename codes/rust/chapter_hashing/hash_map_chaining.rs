/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

use std::mem;

/* 键值对 */
#[derive(Clone)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}

/* 链式地址哈希表 */
pub struct HashMapChaining {
    size: usize,
    capacity: usize,
    buckets: Vec<Vec<Pair>>,
}

impl HashMapChaining {
    const LOAD_THRES: f64 = 2.0 / 3.0;
    const EXTEND_RATIO: usize = 2;

    /* 构造方法 */
    #[allow(clippy::new_without_default)]
    pub fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            buckets: vec![vec![]; 4],
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

    /* 查询操作 */
    pub fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // 遍历桶，若找到 key，则返回对应 val
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // 若未找到 key，则返回 None
        None
    }

    /* 添加操作 */
    pub fn put(&mut self, key: i32, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if self.load_factor() > Self::LOAD_THRES {
            self.extend();
        }

        let index = self.hash_func(key);

        // 遍历桶，若遇到指定 key ，则更新对应 val 并返回
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // 若无该 key ，则将键值对添加至尾部
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* 删除操作 */
    pub fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // 遍历桶，从中删除键值对
        for (i, pair) in self.buckets[index].iter_mut().enumerate() {
            if pair.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // 若未找到 key ，则返回 None
        None
    }

    /* 扩容哈希表 */
    fn extend(&mut self) {
        // 暂存原哈希表
        let buckets = mem::take(&mut self.buckets);

        // 初始化扩容后的新哈希表
        self.capacity *= Self::EXTEND_RATIO;
        self.buckets = vec![Vec::new(); self.capacity];
        self.size = 0;

        // 将键值对从原哈希表搬运至新哈希表
        for bucket in buckets {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* 打印哈希表 */
    pub fn print(&self) {
        for bucket in &self.buckets {
            let capacity = bucket.len();
            let mut res = Vec::with_capacity(capacity);
            for pair in bucket {
                res.push(format!("{} -> {}", pair.key, pair.val));
            }
            println!("{res:?}");
        }
    }
}

/* Driver Code */
fn main() {
    /* 初始化哈希表 */
    let mut map = HashMapChaining::new();

    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, "小哈".to_string());
    map.put(15937, "小啰".to_string());
    map.put(16750, "小算".to_string());
    map.put(13276, "小法".to_string());
    map.put(10583, "小鸭".to_string());
    println!("添加完成后，哈希表为\nKey -> Value");
    map.print();

    println!();

    /* 查询操作 */
    // 向哈希表中输入键 key，得到值 value
    println!(
        "输入学号 13276，查询到姓名 {}",
        map.get(13276).unwrap_or("Not a valid Key")
    );

    println!();

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(12836);
    println!("删除 12836 后，哈希表为\nKey -> Value");
    map.print();
}
