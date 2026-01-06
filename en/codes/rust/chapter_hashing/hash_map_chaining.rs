/*
 * File: hash_map_chaining.rs
 * Created Time: 2023-07-07
 * Author: WSL0809 (wslzzy@outlook.com)
 */

#[derive(Clone)]
/* Key-value pair */
struct Pair {
    key: i32,
    val: String,
}

/* Hash table with separate chaining */
struct HashMapChaining {
    size: usize,
    capacity: usize,
    load_thres: f32,
    extend_ratio: usize,
    buckets: Vec<Vec<Pair>>,
}

impl HashMapChaining {
    /* Constructor */
    fn new() -> Self {
        Self {
            size: 0,
            capacity: 4,
            load_thres: 2.0 / 3.0,
            extend_ratio: 2,
            buckets: vec![vec![]; 4],
        }
    }

    /* Hash function */
    fn hash_func(&self, key: i32) -> usize {
        key as usize % self.capacity
    }

    /* Load factor */
    fn load_factor(&self) -> f32 {
        self.size as f32 / self.capacity as f32
    }

    /* Remove operation */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // Traverse bucket and remove key-value pair from it
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // If key is not found, return None
        None
    }

    /* Expand hash table */
    fn extend(&mut self) {
        // Temporarily store the original hash table
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // Initialize expanded new hash table
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // Move key-value pairs from original hash table to new hash table
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
    fn print(&self) {
        for bucket in &self.buckets {
            let mut res = Vec::new();
            for pair in bucket {
                res.push(format!("{} -> {}", pair.key, pair.val));
            }
            println!("{:?}", res);
        }
    }

    /* Add operation */
    fn put(&mut self, key: i32, val: String) {
        // When load factor exceeds threshold, perform expansion
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // Traverse bucket, if specified key is encountered, update corresponding val and return
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // If key does not exist, append key-value pair to the end
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* Query operation */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // Traverse bucket, if key is found, return corresponding val
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // If key is not found, return None
        None
    }
}

/* Driver Code */
pub fn main() {
    /* Initialize hash table */
    let mut map = HashMapChaining::new();

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    map.put(12836, "Xiao Ha".to_string());
    map.put(15937, "Xiao Luo".to_string());
    map.put(16750, "Xiao Suan".to_string());
    map.put(13276, "Xiao Fa".to_string());
    map.put(10583, "Xiao Ya".to_string());
    println!("\nAfter adding is complete, hash table is\nKey -> Value");
    map.print();

    /* Query operation */
    // Input key into hash table to get value
    println!(
        "\nInput student ID 13276, found name {}",
        match map.get(13276) {
            Some(value) => value,
            None => "Not a valid Key",
        }
    );

    /* Remove operation */
    // Remove key-value pair (key, value) from hash table
    map.remove(12836);
    println!("\nAfter removing 12836, hash table is\nKey -> Value");
    map.print();
}
