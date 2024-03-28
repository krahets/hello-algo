/**
 * File: array_hash_map.rs
 * Created Time: 2023-2-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

/* 鍵值對 */
#[derive(Debug, Clone, PartialEq)]
pub struct Pair {
    pub key: i32,
    pub val: String,
}
/* 基於陣列實現的雜湊表 */
pub struct ArrayHashMap {
    buckets: Vec<Option<Pair>>,
}

impl ArrayHashMap {
    pub fn new() -> ArrayHashMap {
        // 初始化陣列，包含 100 個桶
        Self {
            buckets: vec![None; 100],
        }
    }

    /* 雜湊函式 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % 100
    }

    /* 查詢操作 */
    pub fn get(&self, key: i32) -> Option<&String> {
        let index = self.hash_func(key);
        self.buckets[index].as_ref().map(|pair| &pair.val)
    }

    /* 新增操作 */
    pub fn put(&mut self, key: i32, val: &str) {
        let index = self.hash_func(key);
        self.buckets[index] = Some(Pair {
            key,
            val: val.to_string(),
        });
    }

    /* 刪除操作 */
    pub fn remove(&mut self, key: i32) {
        let index = self.hash_func(key);
        // 置為 None ，代表刪除
        self.buckets[index] = None;
    }

    /* 獲取所有鍵值對 */
    pub fn entry_set(&self) -> Vec<&Pair> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref())
            .collect()
    }

    /* 獲取所有鍵 */
    pub fn key_set(&self) -> Vec<&i32> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.key))
            .collect()
    }

    /* 獲取所有值 */
    pub fn value_set(&self) -> Vec<&String> {
        self.buckets
            .iter()
            .filter_map(|pair| pair.as_ref().map(|pair| &pair.val))
            .collect()
    }

    /* 列印雜湊表 */
    pub fn print(&self) {
        for pair in self.entry_set() {
            println!("{} -> {}", pair.key, pair.val);
        }
    }
}

fn main() {
    /* 初始化雜湊表 */
    let mut map = ArrayHashMap::new();
    /*新增操作 */
    // 在雜湊表中新增鍵值對（key, value）
    map.put(12836, "小哈");
    map.put(15937, "小囉");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鴨");
    println!("\n新增完成後，雜湊表為\nKey -> Value");
    map.print();

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 value
    let name = map.get(15937).unwrap();
    println!("\n輸入學號 15937 ，查詢到姓名 {}", name);

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, value)
    map.remove(10583);
    println!("\n刪除 10583 後，雜湊表為\nKey -> Value");
    map.print();

    /* 走訪雜湊表 */
    println!("\n走訪鍵值對 Key->Value");
    for pair in map.entry_set() {
        println!("{} -> {}", pair.key, pair.val);
    }

    println!("\n單獨走訪鍵 Key");
    for key in map.key_set() {
        println!("{}", key);
    }

    println!("\n單獨走訪值 Value");
    for val in map.value_set() {
        println!("{}", val);
    }
}
