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
    double loadThres = 2.0 / 3.0; // Load factor threshold for resizing
    int extendRatio = 2; // Growth factor
    Pair[] buckets; // Bucket array
    Pair TOMBSTONE = new(-1, "-1"); // Deletion marker

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
                // If a deletion marker was found earlier, move the pair to that index
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Return the new bucket index
                }
                return index; // Return the bucket index
            }
            // Record the first deletion marker encountered
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Compute the next bucket index, wrapping to the start at the end
            index = (index + 1) % capacity;
        }
        // If key is absent, return the index for insertion
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Look up a value */
    public string? Get(int key) {
        // Find the bucket index for key
        int index = FindBucket(key);
        // If the pair is found, return its val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Return null if the pair is absent
        return null;
    }

    /* Insert a key-value pair */
    public void Put(int key, string val) {
        // Expand the table when the load factor exceeds the threshold
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // Find the bucket index for key
        int index = FindBucket(key);
        // If the pair is found, overwrite val and return
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // If the pair is absent, insert it
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove a key-value pair */
    public void Remove(int key) {
        // Find the bucket index for key
        int index = FindBucket(key);
        // If the pair is found, replace it with a deletion marker
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Expand the hash table */
    void Extend() {
        // Save the original hash table
        Pair[] bucketsTmp = buckets;
        // Initialize the larger hash table
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Move the key-value pairs from the old table into the new one
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
        map.Remove(16750);
        Console.WriteLine("\nHash table after removing 16750:\nKey -> Value");
        map.Print();
    }
}
