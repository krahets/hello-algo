/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* Open addressing hash table */
struct HashMapOpenAddressing {
    size: usize,                // Number of key-value pairs
    capacity: usize,            // Hash table capacity
    load_thres: f64,            // Load factor threshold for triggering expansion
    extend_ratio: usize,        // Expansion multiplier
    buckets: Vec<Option<Pair>>, // Bucket array
    TOMBSTONE: Option<Pair>,    // Removal mark
}

impl HashMapOpenAddressing {
    /* Constructor */
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

    /* Hash function */
    fn hash_func(&self, key: i32) -> usize {
        (key % self.capacity as i32) as usize
    }

    /* Load factor */
    fn load_factor(&self) -> f64 {
        self.size as f64 / self.capacity as f64
    }

    /* Search for the bucket index corresponding to key */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // Linear probing, break when encountering an empty bucket
        while self.buckets[index].is_some() {
            // If key encountered, return the corresponding bucket index
            if self.buckets[index].as_ref().unwrap().key == key {
                // If a removal marker was previously encountered, move the key-value pair to that index
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // Return the moved bucket index
                }
                return index; // Return bucket index
            }
            // Record the first encountered removal mark
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // Calculate the bucket index, return to the head if exceeding the tail
            index = (index + 1) % self.capacity;
        }
        // If the key does not exist, return the index of the insertion point
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* Query operation */
    fn get(&mut self, key: i32) -> Option<&str> {
        // Search for the bucket index corresponding to key
        let index = self.find_bucket(key);
        // If the key-value pair is found, return the corresponding val
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // If the key-value pair does not exist, return null
        None
    }

    /* Add operation */
    fn put(&mut self, key: i32, val: String) {
        // When the load factor exceeds the threshold, perform expansion
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // Search for the bucket index corresponding to key
        let index = self.find_bucket(key);
        // If the key-value pair is found, overwrite val and return
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // If the key-value pair does not exist, add the key-value pair
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* Remove operation */
    fn remove(&mut self, key: i32) {
        // Search for the bucket index corresponding to key
        let index = self.find_bucket(key);
        // If the key-value pair is found, cover it with a removal mark
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* Extend hash table */
    fn extend(&mut self) {
        // Temporarily store the original hash table
        let buckets_tmp = self.buckets.clone();
        // Initialize the extended new hash table
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // Move key-value pairs from the original hash table to the new hash table
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* Print hash table */
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
    /* Initialize hash table */
    let mut hashmap = HashMapOpenAddressing::new();

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    hashmap.put(12836, "Ha".to_string());
    hashmap.put(15937, "Luo".to_string());
    hashmap.put(16750, "Suan".to_string());
    hashmap.put(13276, "Fa".to_string());
    hashmap.put(10583, "Ya".to_string());

    println!("\nAfter adding, the hash table is\nKey -> Value");
    hashmap.print();

    /* Query operation */
    // Enter key to the hash table, get value val
    let name = hashmap.get(13276).unwrap();
    println!("\nInput student ID 13276, found name {}", name);

    /* Remove operation */
    // Remove key-value pair (key, val) from the hash table
    hashmap.remove(16750);
    println!("\nAfter removing 16750, the hash table is\nKey -> Value");
    hashmap.print();
}
