/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone)]
/* 鍵值對 */
struct Pair {
    key: i32,
    val: String,
}

/* 鏈式位址雜湊表 */
struct HashMapChaining {
    size: i32,
    capacity: i32,
    load_thres: f32,
    extend_ratio: i32,
    buckets: Vec<Vec<Pair>>,
}

impl HashMapChaining {
    /* 建構子 */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![vec![]; 4],
        }
    }

    /* 雜湊函式 */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % self.capacity as usize
    }

    /* 負載因子 */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* 刪除操作 */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);
        let bucket = &mut self.buckets[index];

        // 走訪桶，從中刪除鍵值對
        for i in 0..bucket.len() {
            if bucket[i].key == key {
                let pair = bucket.remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // 若未找到 key ，則返回 None
        None
    }

    /* 擴容雜湊表 */
    fn extend(&mut self) {
        // 暫存原雜湊表
        let buckets_tmp = std::mem::replace(&mut self.buckets, vec![]);

        // 初始化擴容後的新雜湊表
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // 將鍵值對從原雜湊表搬運至新雜湊表
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* 列印雜湊表 */
    fn print(&self) {
        for bucket in &self.buckets {
            let mut res = Vec::new();
            for pair in bucket {
                res.push(format!("{} -> {}", pair.key, pair.val));
            }
            println!("{:?}", res);
        }
    }

    /* 新增操作 */
    fn put(&mut self, key: i32, val: String) {
        // 當負載因子超過閾值時，執行擴容
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);
        let bucket = &mut self.buckets[index];

        // 走訪桶，若遇到指定 key ，則更新對應 val 並返回
        for pair in bucket {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }
        let bucket = &mut self.buckets[index];

        // 若無該 key ，則將鍵值對新增至尾部
        let pair = Pair { key, val };
        bucket.push(pair);
        self.size += 1;
    }

    /* 查詢操作 */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);
        let bucket = &self.buckets[index];

        // 走訪桶，若找到 key ，則返回對應 val
        for pair in bucket {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // 若未找到 key ，則返回 None
        None
    }
}

/* Driver Code */
pub fn main() {
    /* 初始化雜湊表 */
    let mut map = HashMapChaining::new();

    /* 新增操作 */
    // 在雜湊表中新增鍵值對 (key, value)
    map.put(12836, "小哈".to_string());
    map.put(15937, "小囉".to_string());
    map.put(16750, "小算".to_string());
    map.put(13276, "小法".to_string());
    map.put(10583, "小鴨".to_string());
    println!("\n新增完成後，雜湊表為\nKey -> Value");
    map.print();

    /* 查詢操作 */
    // 向雜湊表中輸入鍵 key ，得到值 value
    println!(
        "\n輸入學號 13276,查詢到姓名 {}",
        match map.get(13276) {
            Some(value) => value,
            None => "Not a valid Key",
        }
    );

    /* 刪除操作 */
    // 在雜湊表中刪除鍵值對 (key, value)
    map.remove(12836);
    println!("\n刪除 12836 後，雜湊表為\nKey -> Value");
    map.print();
}
