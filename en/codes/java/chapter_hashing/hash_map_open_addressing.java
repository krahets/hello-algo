/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* Hash table with open addressing */
class HashMapOpenAddressing {
    private int size; // Number of key-value pairs
    private int capacity = 4; // Hash table capacity
    private final double loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
    private final int extendRatio = 2; // Expansion multiplier
    private Pair[] buckets; // Bucket array
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // Removal marker

    /* Constructor */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* Hash function */
    private int hashFunc(int key) {
        return key % capacity;
    }

    /* Load factor */
    private double loadFactor() {
        return (double) size / capacity;
    }

    /* Search for bucket index corresponding to key */
    private int findBucket(int key) {
        int index = hashFunc(key);
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
    public String get(int key) {
        // Search for bucket index corresponding to key
        int index = findBucket(key);
        // If key-value pair is found, return corresponding val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // If key-value pair does not exist, return null
        return null;
    }

    /* Add operation */
    public void put(int key, String val) {
        // When load factor exceeds threshold, perform expansion
        if (loadFactor() > loadThres) {
            extend();
        }
        // Search for bucket index corresponding to key
        int index = findBucket(key);
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
    public void remove(int key) {
        // Search for bucket index corresponding to key
        int index = findBucket(key);
        // If key-value pair is found, overwrite it with removal marker
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Expand hash table */
    private void extend() {
        // Temporarily store the original hash table
        Pair[] bucketsTmp = buckets;
        // Initialize expanded new hash table
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Move key-value pairs from original hash table to new hash table
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* Print hash table */
    public void print() {
        for (Pair pair : buckets) {
            if (pair == null) {
                System.out.println("null");
            } else if (pair == TOMBSTONE) {
                System.out.println("TOMBSTONE");
            } else {
                System.out.println(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    public static void main(String[] args) {
        // Initialize hash table
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // Add operation
        // Add key-value pair (key, val) to the hash table
        hashmap.put(12836, "Xiao Ha");
        hashmap.put(15937, "Xiao Luo");
        hashmap.put(16750, "Xiao Suan");
        hashmap.put(13276, "Xiao Fa");
        hashmap.put(10583, "Xiao Ya");
        System.out.println("\nAfter adding is complete, hash table is\nKey -> Value");
        hashmap.print();

        // Query operation
        // Input key into hash table to get value val
        String name = hashmap.get(13276);
        System.out.println("\nInput student ID 13276, query name " + name);

        // Remove operation
        // Remove key-value pair (key, val) from hash table
        hashmap.remove(16750);
        System.out.println("\nAfter removing 16750, hash table is\nKey -> Value");
        hashmap.print();
    }
}
