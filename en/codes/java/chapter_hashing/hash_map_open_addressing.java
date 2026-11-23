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
    private final double loadThres = 2.0 / 3.0; // Load factor threshold that triggers capacity growth
    private final int extendRatio = 2; // Capacity growth factor
    private Pair[] buckets; // Bucket array
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // Tombstone marker

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

    /* Find the bucket index for key */
    private int findBucket(int key) {
        int index = hashFunc(key);
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
    public String get(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, return its val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Return null if the key-value pair is absent
        return null;
    }

    /* Insert operation */
    public void put(int key, String val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        // Find the bucket index for key
        int index = findBucket(key);
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
    public void remove(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, replace it with a tombstone
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Grow the hash table capacity */
    private void extend() {
        // Keep a reference to the original hash table
        Pair[] bucketsTmp = buckets;
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (Pair pair : bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
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
        // Initialize the hash table
        HashMapOpenAddressing hashmap = new HashMapOpenAddressing();

        // Insert operation
        // Insert the key-value pair (key, val) into the hash table
        hashmap.put(12836, "小哈");
        hashmap.put(15937, "小啰");
        hashmap.put(16750, "小算");
        hashmap.put(13276, "小法");
        hashmap.put(10583, "小鸭");
        System.out.println("\nHash table after insertion:\nKey -> Value");
        hashmap.print();

        // Lookup operation
        // Look up key in the hash table to obtain val
        String name = hashmap.get(13276);
        System.out.println("\nLook up student ID 13276 to obtain the name " + name);

        // Remove operation
        // Remove the key-value pair (key, val) from the hash table
        hashmap.remove(16750);
        System.out.println("\nHash table after removing 16750:\nKey -> Value");
        hashmap.print();
    }
}
