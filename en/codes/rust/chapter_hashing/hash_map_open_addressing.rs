/*
 * File: hash_map_open_addressing.rs
 * Created Time: 2023-07-16
 * Author: WSL0809 (wslzzy@outlook.com), night-cruise (2586447362@qq.com)
 */
#![allow(non_snake_case)]
#![allow(unused)]

mod array_hash_map;

use array_hash_map::Pair;

/* Hash table with open addressing */
struct HashMapOpenAddressing {
    size: usize,                // Number of key-value pairs
    capacity: usize,            // Hash table capacity
    load_thres: f64,            // Load factor threshold that triggers capacity growth
    extend_ratio: usize,        // Capacity growth factor
    buckets: Vec<Option<Pair>>, // Bucket array
    TOMBSTONE: Option<Pair>,    // Tombstone marker
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

    /* Find the bucket index for key */
    fn find_bucket(&mut self, key: i32) -> usize {
        let mut index = self.hash_func(key);
        let mut first_tombstone = -1;
        // Probe linearly until an empty bucket is reached
        while self.buckets[index].is_some() {
            // If key is found, return the corresponding bucket index
            if self.buckets[index].as_ref().unwrap().key == key {
                // If a tombstone was encountered earlier, move the key-value pair to that index
                if first_tombstone != -1 {
                    self.buckets[first_tombstone as usize] = self.buckets[index].take();
                    self.buckets[index] = self.TOMBSTONE.clone();
                    return first_tombstone as usize; // Return the bucket index after the move
                }
                return index; // Return the bucket index
            }
            // Record the first tombstone encountered
            if first_tombstone == -1 && self.buckets[index] == self.TOMBSTONE {
                first_tombstone = index as i32;
            }
            // Calculate the bucket index, wrapping to the beginning after the end
            index = (index + 1) % self.capacity;
        }
        // If key is absent, return the index for insertion
        if first_tombstone == -1 {
            index
        } else {
            first_tombstone as usize
        }
    }

    /* Lookup operation */
    fn get(&mut self, key: i32) -> Option<&str> {
        // Find the bucket index for key
        let index = self.find_bucket(key);
        // If the key-value pair is found, return its val
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            return self.buckets[index].as_ref().map(|pair| &pair.val as &str);
        }
        // If the key-value pair does not exist, return None
        None
    }

    /* Insert operation */
    fn put(&mut self, key: i32, val: String) {
        // Grow the capacity when the load factor exceeds the threshold
        if self.load_factor() > self.load_thres {
            self.extend();
        }
        // Find the bucket index for key
        let index = self.find_bucket(key);
        // If the key-value pair is found, overwrite val and return
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index].as_mut().unwrap().val = val;
            return;
        }
        // If the key-value pair is absent, insert it
        self.buckets[index] = Some(Pair { key, val });
        self.size += 1;
    }

    /* Remove operation */
    fn remove(&mut self, key: i32) {
        // Find the bucket index for key
        let index = self.find_bucket(key);
        // If the key-value pair is found, replace it with a tombstone
        if self.buckets[index].is_some() && self.buckets[index] != self.TOMBSTONE {
            self.buckets[index] = self.TOMBSTONE.clone();
            self.size -= 1;
        }
    }

    /* Grow the hash table capacity */
    fn extend(&mut self) {
        // Temporarily save a copy of the original buckets
        let buckets_tmp = self.buckets.clone();
        // Initialize a new hash table with the expanded capacity
        self.capacity *= self.extend_ratio;
        self.buckets = vec![None; self.capacity];
        self.size = 0;

        // Move the key-value pairs from the original hash table to the new one
        for pair in buckets_tmp {
            if pair.is_none() || pair == self.TOMBSTONE {
                continue;
            }
            let pair = pair.unwrap();

            self.put(pair.key, pair.val);
        }
    }
    /* Print the hash table */
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

/* Driver code */
fn main() {
    /* Initialize the hash table */
    let mut hashmap = HashMapOpenAddressing::new();

    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    hashmap.put(12836, "小哈".to_string());
    hashmap.put(15937, "小啰".to_string());
    hashmap.put(16750, "小算".to_string());
    hashmap.put(13276, "小法".to_string());
    hashmap.put(10583, "小鸭".to_string());

    println!("\nHash table after insertion:\nKey -> Value");
    hashmap.print();

    /* Lookup operation */
    // Look up key in the hash table to obtain val
    let name = hashmap.get(13276).unwrap();
    println!("\nLooking up student ID 13276 gives name {}", name);

    /* Remove operation */
    // Remove the key-value pair (key, val) from the hash table
    hashmap.remove(16750);
    println!("\nHash table after removing 16750:\nKey -> Value");
    hashmap.print();
}
