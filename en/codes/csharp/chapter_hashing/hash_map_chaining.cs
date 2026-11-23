/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* Hash table with separate chaining */
class HashMapChaining {
    int size; // Number of key-value pairs
    int capacity; // Hash table capacity
    double loadThres; // Load factor threshold that triggers capacity growth
    int extendRatio; // Capacity growth factor
    List<List<Pair>> buckets; // Bucket array

    /* Constructor */
    public HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
    }

    /* Hash function */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* Load factor */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* Lookup operation */
    public string? Get(int key) {
        int index = HashFunc(key);
        // Traverse the bucket; if key is found, return its corresponding val
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Return null if key is not found
        return null;
    }

    /* Insert operation */
    public void Put(int key, string val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // Traverse the bucket; if the specified key is found, update its val and return
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // If key is absent, append the key-value pair at the end
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* Remove operation */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Traverse the bucket and remove the key-value pair
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* Grow the hash table capacity */
    void Extend() {
        // Keep a reference to the original hash table
        List<List<Pair>> bucketsTmp = buckets;
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // Move the key-value pairs from the original hash table to the new one
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
    public void Print() {
        foreach (List<Pair> bucket in buckets) {
            List<string> res = [];
            foreach (Pair pair in bucket) {
                res.Add(pair.key + " -> " + pair.val);
            }
            foreach (string kv in res) {
                Console.WriteLine(kv);
            }
        }
    }
}

public class hash_map_chaining {
    [Test]
    public void Test() {
        /* Initialize the hash table */
        HashMapChaining map = new();

        /* Insert operation */
        // Insert the key-value pair (key, value) into the hash table
        map.Put(12836, "小哈");
        map.Put(15937, "小啰");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鸭");
        Console.WriteLine("\nHash table after insertion:\nKey -> Value");
        map.Print();

        /* Lookup operation */
        // Look up key in the hash table to obtain value
        string? name = map.Get(13276);
        Console.WriteLine("\nLook up student ID 13276 to obtain the name " + name);

        /* Remove operation */
        // Remove the key-value pair (key, value) from the hash table
        map.Remove(12836);
        Console.WriteLine("\nHash table after removing 12836:\nKey -> Value");
        map.Print();
    }
}