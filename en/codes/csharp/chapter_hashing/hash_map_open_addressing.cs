/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* Hash table with open addressing */
class HashMapOpenAddressing {
    int size; // Number of key-value pairs
    int capacity = 4; // Hash table capacity
    double loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
    int extendRatio = 2; // Expansion multiplier
    Pair[] buckets; // Bucket array
    Pair TOMBSTONE = new(-1, "-1"); // Removal marker

    /* Constructor */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* Hash function */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* Load factor */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* Search for bucket index corresponding to key */
    int FindBucket(int key) {
        int index = HashFunc(key);
        int firstTombstone = -1;
        // Linear probing, break when encountering an empty bucket
        while (buckets[index] != null) {
            // If key is encountered, return the corresponding bucket index
            if (buckets[index].key == key) {
                // If a removal marker was encountered before, move the key-value pair to that index
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Return the moved bucket index
                }
                return index; // Return bucket index
            }
            // Record the first removal marker encountered
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Calculate bucket index, wrap around to the head if past the tail
            index = (index + 1) % capacity;
        }
        // If key does not exist, return the index for insertion
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Query operation */
    public string? Get(int key) {
        // Search for bucket index corresponding to key
        int index = FindBucket(key);
        // If key-value pair is found, return corresponding val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // If key-value pair does not exist, return null
        return null;
    }

    /* Add operation */
    public void Put(int key, string val) {
        // When load factor exceeds threshold, perform expansion
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // Search for bucket index corresponding to key
        int index = FindBucket(key);
        // If key-value pair is found, overwrite val and return
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // If key-value pair does not exist, add the key-value pair
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove operation */
    public void Remove(int key) {
        // Search for bucket index corresponding to key
        int index = FindBucket(key);
        // If key-value pair is found, overwrite it with removal marker
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Expand hash table */
    void Extend() {
        // Temporarily store the original hash table
        Pair[] bucketsTmp = buckets;
        // Initialize expanded new hash table
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Move key-value pairs from original hash table to new hash table
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
    public void Print() {
        foreach (Pair pair in buckets) {
            if (pair == null) {
                Console.WriteLine("null");
            } else if (pair == TOMBSTONE) {
                Console.WriteLine("TOMBSTONE");
            } else {
                Console.WriteLine(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    [Test]
    public void Test() {
        /* Initialize hash table */
        HashMapOpenAddressing map = new();

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
        map.Remove(16750);
        Console.WriteLine("\nAfter removing 16750, hash table is\nKey -> Value");
        map.Print();
    }
}
