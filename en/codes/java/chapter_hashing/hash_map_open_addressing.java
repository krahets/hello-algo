/**
 * File: hash_map_open_addressing.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

/* Open addressing hash table */
class HashMapOpenAddressing {
    private int size; // Number of key-value pairs
    private int capacity = 4; // Hash table capacity
    private final double loadThres = 2.0 / 3.0; // Load factor threshold for triggering expansion
    private final int extendRatio = 2; // Expansion multiplier
    private Pair[] buckets; // Bucket array
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // Removal mark

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

    /* Search for the bucket index corresponding to key */
    private int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Linear probing, break when encountering an empty bucket
        while (buckets[index] != null) {
            // If the key is encountered, return the corresponding bucket index
            if (buckets[index].key == key) {
                // If a removal mark was encountered earlier, move the key-value pair to that index
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // Return the moved bucket index
                }
                return index; // Return bucket index
            }
            // Record the first encountered removal mark
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // Calculate the bucket index, return to the head if exceeding the tail
            index = (index + 1) % capacity;
        }
        // If the key does not exist, return the index of the insertion point
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* Query operation */
    public String get(int key) {
        // Search for the bucket index corresponding to key
        int index = findBucket(key);
        // If the key-value pair is found, return the corresponding val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // If the key-value pair does not exist, return null
        return null;
    }

    /* Add operation */
    public void put(int key, String val) {
        // When the load factor exceeds the threshold, perform expansion
        if (loadFactor() > loadThres) {
            extend();
        }
        // Search for the bucket index corresponding to key
        int index = findBucket(key);
        // If the key-value pair is found, overwrite val and return
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // If the key-value pair does not exist, add the key-value pair
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove operation */
    public void remove(int key) {
        // Search for the bucket index corresponding to key
        int index = findBucket(key);
        // If the key-value pair is found, cover it with a removal mark
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Extend hash table */
    private void extend() {
        // Temporarily store the original hash table
        Pair[] bucketsTmp = buckets;
        // Initialize the extended new hash table
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Move key-value pairs from the original hash table to the new hash table
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
        hashmap.put(12836, "Ha");
        hashmap.put(15937, "Luo");
        hashmap.put(16750, "Suan");
        hashmap.put(13276, "Fa");
        hashmap.put(10583, "Ya");
        System.out.println("\nAfter adding, the hash table is\nKey -> Value");
        hashmap.print();

        // Query operation
        // Enter key to the hash table, get value val
        String name = hashmap.get(13276);
        System.out.println("\nEnter student ID 13276, found name " + name);

        // Remove operation
        // Remove key-value pair (key, val) from the hash table
        hashmap.remove(16750);
        System.out.println("\nAfter removing 16750, the hash table is\nKey -> Value");
        hashmap.print();
    }
}
