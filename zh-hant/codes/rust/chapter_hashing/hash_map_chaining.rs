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

/* 鏈結法雜湊表 */
struct HashMapChaining {
    size: usize,
    capacity: usize,
    load_thres: f32,
    extend_ratio: usize,
    buckets: Vec<Vec<Pair>>,
}

impl HashMapChaining {
    /* 建構方法 */
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
        key as usize % self.capacity
    }

    /* 負載因子 */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* 刪除操作 */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // 走訪桶中的元素，從中刪除鍵值對
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // 若找不到 key，回傳 None
        None
    }

    /* 擴充雜湊表容量 */
    fn extend(&mut self) {
        // 暫存原本的雜湊表
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // 初始化擴充後的新雜湊表
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // 將鍵值對從原本的雜湊表移到新表
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* 印出雜湊表 */
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
        // 當負載因子超過門檻時，擴充容量
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // 走訪桶中的元素，若遇到指定的 key，就更新對應的 val 並結束操作
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // 若沒有這個 key，就將鍵值對加到尾端
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* 查詢操作 */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // 走訪桶中的元素，若找到 key，就回傳對應的 val
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // 若找不到 key，回傳 None
        None
    }
}

/* 主程式 */
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
    println!("\n新增後的雜湊表\nKey -> Value");
    map.print();

    /* 查詢操作 */
    // 輸入鍵 key，從雜湊表取得對應的值 value
    println!(
        "\n輸入學號 13276，查得姓名 {}",
        match map.get(13276) {
            Some(value) => value,
            None => "Not a valid Key",
        }
    );

    /* 刪除操作 */
    // 從雜湊表刪除鍵值對 (key, value)
    map.remove(12836);
    println!("\n刪除 12836 後的雜湊表\nKey -> Value");
    map.print();
}
