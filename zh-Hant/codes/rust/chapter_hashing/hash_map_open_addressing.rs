/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* 开放寻址哈希表 */
struct HashMapOpenAddressing {
    size: usize,                // 键值对数量
    capacity: usize,            // 哈希表容量
    load_thres: f64,            // 触发扩容的负载因子阈值
    extend_ratio: usize,        // 扩容倍数
    buckets: Vec<Option<Pair>>, // 桶数组
    TOMBSTONE: Option<Pair>,    // 删除标记
}

impl HashMapOpenAddressing {
    /* 构造方法 */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![None; 4],
            TOMBSTONE: Some(Pair {
                key: -1,
                val: "-1".to_string(),
            }),
        }
    }

    /* 哈希函数 */
    fn hash_func(&self, key: i32) -> usize {
        (key % self.capacity as i32) as usize
    }

    /* 负载因子 */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* 搜索 key 对应的桶索引 */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // 线性探测，当遇到空桶时跳出
        while self.buckets[index].is_some() {
            // 若遇到 key，返回对应的桶索引
            if self.buckets[index].as_ref().unwrap().key == key {
                // 若之前遇到了删除标记，则将建值对移动至该索引
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // 返回移动后的桶索引
                }
                return index; // 返回桶索引
            }
            // 记录遇到的首个删除标记
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // 计算桶索引，越过尾部则返回头部
            index = (index + 1) % self.capacity;
        }
        // 若 key 不存在，则返回添加点的索引
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* 查询操作 */
    fn get(&mut self, key: i32) -> Option<&str> {
        // 搜索 key 对应的桶索引
        let index = self.find_bucket(key);
        // 若找到键值对，则返回对应 val
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // 若键值对不存在，则返回 null
        None
    }

    /* 添加操作 */
    fn put(&mut self, key: i32, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // 搜索 key 对应的桶索引
        let index = self.find_bucket(key);
        // 若找到键值对，则覆盖 val 并返回
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // 若键值对不存在，则添加该键值对
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* 删除操作 */
    fn remove(&mut self, key: i32) {
        // 搜索 key 对应的桶索引
        let index = self.find_bucket(key);
        // 若找到键值对，则用删除标记覆盖它
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* 扩容哈希表 */
    fn extend(&mut self) {
        // 暂存原哈希表
        let buckets_tmp = self.buckets.clone();
        // 初始化扩容后的新哈希表
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // 将键值对从原哈希表搬运至新哈希表
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* 打印哈希表 */
    fn print(&self) {
        for pair in &self.buckets {
            if pair.is_none() {
                println!("null");
            } else if pair == &self.TOMBSTONE {
                println!("TOMBSTONE");
            } else {
                let pair = pair.as_ref().unwrap();
                println!("{} -> {}", pair.key, pair.val);
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

    println!("\n添加完成后，哈希表为\nKey -> Value");
    hashmap.print();

    /* 查询操作 */
    // 向哈希表中输入键 key ，得到值 val
    let name = hashmap.get(13276).unwrap();
    println!("\n输入学号 13276 ，查询到姓名 {}", name);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, val)
    hashmap.remove(16750);
    println!("\n删除 16750 后，哈希表为\nKey -> Value");
    hashmap.print();
}
