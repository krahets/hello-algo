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

/* Hash table with chaining */
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

    /* Remove a key-value pair */
    fn remove(&mut self, key: i32) -> Option<String> {
        let index = self.hash_func(key);

        // Scan the bucket and remove the pair
        for (i, p) in self.buckets[index].iter_mut().enumerate() {
            if p.key == key {
                let pair = self.buckets[index].remove(i);
                self.size -= 1;
                return Some(pair.val);
            }
        }

        // Return None if key is absent
        None
    }

    /* Expand the hash table */
    fn extend(&mut self) {
        // Save the original hash table
        let buckets_tmp = std::mem::take(&mut self.buckets);

        // Initialize the larger hash table
        self.capacity *= self.extend_ratio;
        self.buckets = vec![Vec::new(); self.capacity as usize];
        self.size = 0;

        // Move the key-value pairs from the old table into the new one
        for bucket in buckets_tmp {
            for pair in bucket {
                self.put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
    fn print(&self) {
        for bucket in &self.buckets {
            let mut res = Vec::new();
            for pair in bucket {
                res.push(format!("{} -> {}", pair.key, pair.val));
            }
            println!("{:?}", res);
        }
    }

    /* Insert a key-value pair */
    fn put(&mut self, key: i32, val: String) {
        // Expand the table when the load factor exceeds the threshold
        if self.load_factor() > self.load_thres {
            self.extend();
        }

        let index = self.hash_func(key);

        // Scan the bucket. If the specified key is found, update its val and return
        for pair in self.buckets[index].iter_mut() {
            if pair.key == key {
                pair.val = val;
                return;
            }
        }

        // If key is absent, append the pair to the end of the list
        let pair = Pair { key, val };
        self.buckets[index].push(pair);
        self.size += 1;
    }

    /* Look up a value */
    fn get(&self, key: i32) -> Option<&str> {
        let index = self.hash_func(key);

        // Scan the bucket and return the corresponding val if key is found
        for pair in self.buckets[index].iter() {
            if pair.key == key {
                return Some(&pair.val);
            }
        }

        // Return None if key is absent
        None
    }
}

/* Driver code */
pub fn main() {
    /* Initialize the hash table */
    let mut map = HashMapChaining::new();

    /* Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    map.put(12836, "Xiao Ha".to_string());
    map.put(15937, "Xiao Luo".to_string());
    map.put(16750, "Xiao Suan".to_string());
    map.put(13276, "Xiao Fa".to_string());
    map.put(10583, "Xiao Ya".to_string());
    println!("\nHash table after insertion:\nKey -> Value");
    map.print();

    /* Look up a value */
    // Look up key in the hash table to get value
    println!(
        "\nName for student ID 13276: {}",
        match map.get(13276) {
            Some(value) => value,
            None => "Not a valid Key",
        }
    );

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.remove(12836);
    println!("\nHash table after removing 12836:\nKey -> Value");
    map.print();
}
