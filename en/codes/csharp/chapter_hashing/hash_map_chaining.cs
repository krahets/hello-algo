/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* Hash table with chaining */
class HashMapChaining {
    int size; // Number of key-value pairs
    int capacity; // Hash table capacity
    double loadThres; // Load factor threshold for resizing
    int extendRatio; // Growth factor
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

    /* Look up a value */
    public string? Get(int key) {
        int index = HashFunc(key);
        // Scan the bucket and return the corresponding val if key is found
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Return null if key is absent
        return null;
    }

    /* Insert a key-value pair */
    public void Put(int key, string val) {
        // Expand the table when the load factor exceeds the threshold
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // Scan the bucket. If the specified key is found, update its val and return
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // If key is absent, append the pair to the end of the list
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* Remove a key-value pair */
    public void Remove(int key) {
        int index = HashFunc(key);
        // Scan the bucket and remove the pair
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* Expand the hash table */
    void Extend() {
        // Save the original hash table
        List<List<Pair>> bucketsTmp = buckets;
        // Initialize the larger hash table
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // Move the key-value pairs from the old table into the new one
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

        /* Insert a key-value pair */
        // Insert the pair (key, value) into the hash table
        map.Put(12836, "Xiao Ha");
        map.Put(15937, "Xiao Luo");
        map.Put(16750, "Xiao Suan");
        map.Put(13276, "Xiao Fa");
        map.Put(10583, "Xiao Ya");
        Console.WriteLine("\nHash table after insertion:\nKey -> Value");
        map.Print();

        /* Look up a value */
        // Look up key in the hash table to get value
        string? name = map.Get(13276);
        Console.WriteLine("\nName for student ID 13276: " + name);

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.Remove(12836);
        Console.WriteLine("\nHash table after removing 12836:\nKey -> Value");
        map.Print();
    }
}