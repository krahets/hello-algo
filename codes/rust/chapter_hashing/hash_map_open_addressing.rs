/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone, PartialEq)]
/* 键值对 */
struct Pair {
    key: i32,
    val: String,
}

/* 开放寻址哈希表 */
struct HashMapOpenAddressing {
    size: usize,
    capacity: usize,
    load_thres: f32,
    extend_ratio: usize,
    buckets: Vec<Option<Pair>>,
    removed: Pair,
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
            removed: Pair {
                key: -1,
                val: "-1".to_string(),
            },
        }
    }

    /* 哈希函数 */
    fn hash_func(&self, key: i32) -> usize {
        (key % self.capacity as i32) as usize
    }

    /* 负载因子 */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* 查询操作 */
    fn get(&self, key: i32) -> Option<&str> {
        let mut index = self.hash_func(key);
        let capacity = self.capacity;
        // 线性探测，从 index 开始向后遍历
        for _ in 0..capacity {
            // 计算桶索引，越过尾部返回头部
            let j = (index + 1) % capacity;
            match &self.buckets[j] {
                // 若遇到空桶，说明无此 key ，则返回 None
                None => return None,
                // 若遇到指定 key ，则返回对应 val
                Some(pair) if pair.key == key && pair != &self.removed => return Some(&pair.val),
                _ => index = j,
            }
        }

        None
    }

    /* 添加操作 */
    fn put(&mut self, key: i32, val: String) {
        // 当负载因子超过阈值时，执行扩容
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let mut index = self.hash_func(key);
        let capacity = self.capacity;

        // 线性探测，从 index 开始向后遍历
        for _ in 0..capacity {
            //计算桶索引，越过尾部返回头部
            let j = (index + 1) % capacity;
            // 若遇到空桶、或带有删除标记的桶，则将键值对放入该桶
            match &mut self.buckets[j] {
                bucket @ &mut None | bucket @ &mut Some(Pair { key: -1, .. }) => {
                    *bucket = Some(Pair { key, val });
                    self.size += 1;
                    return;
                }
                // 若遇到指定 key ，则更新对应 val
                Some(pair) if pair.key == key => {
                    pair.val = val;
                    return;
                }
                _ => index = j,
            }
        }
    }

    /* 删除操作 */
    fn remove(&mut self, key: i32) {
        let mut index = self.hash_func(key);
        let capacity = self.capacity;

        // 遍历桶，从中删除键值对
        for _ in 0..capacity {
            let j = (index + 1) % capacity;
            match &mut self.buckets[j] {
                // 若遇到空桶，说明无此 key ，则直接返回
                None => return,
                // 若遇到指定 key ，则标记删除并返回
                Some(pair) if pair.key == key => {
                    *pair = Pair {
                        key: -1,
                        val: "-1".to_string(),
                    };
                    self.size -= 1;
                    return;
                }
                _ => index = j,
            }
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
            if let Some(pair) = pair {
                self.put(pair.key, pair.val);
            }
        }
    }
    /* 打印哈希表 */
    fn print(&self) {
        for pair in &self.buckets {
            match pair {
                Some(pair) => println!("{} -> {}", pair.key, pair.val),
                None => println!("None"),
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

    println!("\n添加完成后,哈希表为\nKey -> Value");
    hashmap.print();

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = hashmap.get(13276).unwrap();
    println!("\n输入学号 13276 ,查询到姓名 {}", name);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    hashmap.remove(16750);
    println!("\n删除 16750 后,哈希表为\nKey -> Value");
    hashmap.print();
}
