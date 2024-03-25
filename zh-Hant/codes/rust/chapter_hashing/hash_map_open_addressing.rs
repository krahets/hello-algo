/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* 開放定址雜湊表 */
struct HashMapOpenAddressing {
    size: usize,                // 鍵值對數量
    capacity: usize,            // 雜湊表容量
    load_thres: f64,            // 觸發擴容的負載因子閾值
    extend_ratio: usize,        // 擴容倍數
    buckets: Vec<Option<Pair>>, // 桶陣列
    TOMBSTONE: Option<Pair>,    // 刪除標記
}

impl HashMapOpenAddressing {
    /* 建構子 */
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

    /* 雜湊函式 */
    fn hash_func(&self, key: i32) -> usize {
        (key % self.capacity as i32) as usize
    }

    /* 負載因子 */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* 搜尋 key 對應的桶索引 */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // 線性探查，當遇到空桶時跳出
        while self.buckets[index].is_some() {
            // 若遇到 key，返回對應的桶索引
            if self.buckets[index].as_ref().unwrap().key == key {
                // 若之前遇到了刪除標記，則將建值對移動至該索引
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // 返回移動後的桶索引
                }
                return index; // 返回桶索引
            }
            // 記錄遇到的首個刪除標記
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // 計算桶索引，越過尾部則返回頭部
            index = (index + 1) % self.capacity;
        }
        // 若 key 不存在，則返回新增點的索引
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* 查詢操作 */
    fn get(&mut self, key: i32) -> Option<&str> {
        // 搜尋 key 對應的桶索引
        let index = self.find_bucket(key);
        // 若找到鍵值對，則返回對應 val
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // 若鍵值對不存在，則返回 null
        None
    }

    /* 新增操作 */
    fn put(&mut self, key: i32, val: String) {
        // 當負載因子超過閾值時，執行擴容
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // 搜尋 key 對應的桶索引
        let index = self.find_bucket(key);
        // 若找到鍵值對，則覆蓋 val 並返回
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // 若鍵值對不存在，則新增該鍵值對
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* 刪除操作 */
    fn remove(&mut self, key: i32) {
        // 搜尋 key 對應的桶索引
        let index = self.find_bucket(key);
        // 若找到鍵值對，則用刪除標記覆蓋它
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* 擴容雜湊表 */
    fn extend(&mut self) {
        // 暫存原雜湊表
        let buckets_tmp = self.buckets.clone();
        // 初始化擴容後的新雜湊表
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // 將鍵值對從原雜湊表搬運至新雜湊表
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* 列印雜湊表 */
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
    /* 初始化雜湊表 */
    let mut hashmap = HashMapOpenAddressing::new();

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    hashmap.put(12836, "小哈".to_string());
    hashmap.put(15937, "小囉".to_string());
    hashmap.put(16750, "小算".to_string());
    hashmap.put(13276, "小法".to_string());
    hashmap.put(10583, "小鴨".to_string());

    println!("\n新增完成後，雜湊表為\nKey -> Value");
    hashmap.print();

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 val
    let name = hashmap.get(13276).unwrap();
    println!("\n輸入學號 13276 ，查詢到姓名 {}", name);

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, val)
    hashmap.remove(16750);
    println!("\n刪除 16750 後，雜湊表為\nKey -> Value");
    hashmap.print();
}
