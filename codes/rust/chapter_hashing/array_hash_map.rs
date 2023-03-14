/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

#[derive(Debug, Clone)]
/* 键值对 int->String */
pub struct Entry {
    pub key: i32,
    pub val: String,
}

/* 基于数组简易实现的哈希表 */
pub struct ArrayHashMap { buckets: Vec<Option<Entry>> }

impl ArrayHashMap {
    pub fn new() -> ArrayHashMap {
        // 初始化数组，包含 100 个桶
        Self { buckets: vec![None; 100] }
    }

    /* 哈希函数 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* 查询操作 */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|entry| &entry.val)
    }

    /* 添加操作 */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Entry {
            key,
            val: val.to_string(),
        });
    }

    /* 删除操作 */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        self.buckets[index] = None;
    }

    /* 获取所有键值对 */
    pub fn entry_set(&self) -> Vec<&Entry> {
        self.buckets.iter().filter_map(|entry| entry.as_ref()).collect()
    }

    /* 获取所有键 */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets.iter().filter_map(|entry| entry.as_ref().map(|entry| &entry.key)).collect()
    }

    /* 获取所有值 */
    pub fn value_set(&self) -> Vec<&String> {
        self.buckets.iter().filter_map(|entry| entry.as_ref().map(|entry| &entry.val)).collect()
    }

    /* 打印哈希表 */
    pub fn print(&self) {
        for entry in self.entry_set() {
            println!("{} -> {}", entry.key, entry.val);
        }
    }
}

fn main() {
    /* 初始化哈希表 */
    let mut map = ArrayHashMap::new();
    /*添加操作 */
    // 在哈希表中添加键值对（key, value）
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    println!("\n添加完成后，哈希表为\nKey -> Value");
    map.print();

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map.get(15937).unwrap();
    println!("\n输入学号 15937 ，查询到姓名 {}", name);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583);
    println!("\n删除 10583 后，哈希表为\nKey -> Value");
    map.print();

    /* 遍历哈希表 */
    println!("\n遍历键值对 Key->Value");
    for entry in map.entry_set() {
        println!("{} -> {}", entry.key, entry.val);
    }

    println!("\n单独遍历键 Key");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\n单独遍历值 Value");
    for val in map.value_set() {
        println!("{}", val);
    }
}