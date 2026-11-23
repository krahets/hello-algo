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
    double loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
    int extendRatio = 2; // Capacity growth factor
    Pair[] buckets; // Bucket array
    Pair TOMBSTONE = new(-1, "-1"); // Tombstone marker

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

    /* Find the bucket index for key */
    int FindBucket(int key) {
        int index = HashFunc(key);
        int firstTombstone = -1;
        // Probe linearly until an empty bucket is reached
        while (buckets[index] != null) {
            // If key is found, return its bucket index
            if (buckets[index].key == key) {
                // If a tombstone was encountered earlier, move the key-value pair to that index
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Return the bucket index after the move
                }
                return index; // Return the bucket index
            }
            // Record the first tombstone encountered
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Calculate the bucket index, wrapping to the beginning after the end
            index = (index + 1) % capacity;
        }
        // If key is absent, return the index for insertion
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Lookup operation */
    public string? Get(int key) {
        // Find the bucket index for key
        int index = FindBucket(key);
        // If the key-value pair is found, return its val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Return null if the key-value pair is absent
        return null;
    }

    /* Insert operation */
    public void Put(int key, string val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // Find the bucket index for key
        int index = FindBucket(key);
        // If the key-value pair is found, overwrite val and return
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // If the key-value pair is absent, insert it
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove operation */
    public void Remove(int key) {
        // Find the bucket index for key
        int index = FindBucket(key);
        // If the key-value pair is found, replace it with a tombstone
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Grow the hash table capacity */
    void Extend() {
        // Keep a reference to the original hash table
        Pair[] bucketsTmp = buckets;
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Move the key-value pairs from the original hash table to the new one
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
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
        /* Initialize the hash table */
        HashMapOpenAddressing map = new();

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
        map.Remove(16750);
        Console.WriteLine("\nHash table after removing 16750:\nKey -> Value");
        map.Print();
    }
}
