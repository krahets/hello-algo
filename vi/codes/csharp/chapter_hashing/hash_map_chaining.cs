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
    double loadThres; // Load factor threshold for triggering expansion
    int extendRatio; // Expansion multiplier
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

    /* Query operation */
    public string? Get(int key) {
        int index = HashFunc(key);
        // Traverse bucket, if key is found, return corresponding val
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // If key is not found, return null
        return null;
    }

    /* Add operation */
    public void Put(int key, string val) {
        // When load factor exceeds threshold, perform expansion
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // Traverse bucket, if specified key is encountered, update corresponding val and return
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // If key does not exist, append key-value pair to the end
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* Remove operation */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Traverse bucket and remove key-value pair from it
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* Expand hash table */
    void Extend() {
        // Temporarily store the original hash table
        List<List<Pair>> bucketsTmp = buckets;
        // Initialize expanded new hash table
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // Move key-value pairs from original hash table to new hash table
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
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
        /* Initialize hash table */
        HashMapChaining map = new();

        /* Add operation */
        // Add key-value pair (key, value) to the hash table
        map.Put(12836, "Xiao Ha");
        map.Put(15937, "Xiao Luo");
        map.Put(16750, "Xiao Suan");
        map.Put(13276, "Xiao Fa");
        map.Put(10583, "Xiao Ya");
        Console.WriteLine("\nAfter adding is complete, hash table is\nKey -> Value");
        map.Print();

        /* Query operation */
        // Input key into hash table to get value
        string? name = map.Get(13276);
        Console.WriteLine("\nInput student ID 13276, query name " + name);

        /* Remove operation */
        // Remove key-value pair (key, value) from hash table
        map.Remove(12836);
        Console.WriteLine("\nAfter removing 12836, hash table is\nKey -> Value");
        map.Print();
    }
}