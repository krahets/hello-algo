/**
 * File: hash_map_chaining.java
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

package chapter_hashing;

import java.util.ArrayList;
import java.util.List;

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
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
    }

    /* Hash function */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Load factor */
    double loadFactor() {
        return (double) size / capacity;
    }

    /* Look up a value */
    String get(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Scan the bucket and return the corresponding val if key is found
        for (Pair pair : bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // Return null if key is absent
        return null;
    }

    /* Insert a key-value pair */
    void put(int key, String val) {
        // Expand the table when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Scan the bucket. If the specified key is found, update its val and return
        for (Pair pair : bucket) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // If key is absent, append the pair to the end of the list
        Pair pair = new Pair(key, val);
        bucket.add(pair);
        size++;
    }

    /* Remove a key-value pair */
    void remove(int key) {
        int index = hashFunc(key);
        List<Pair> bucket = buckets.get(index);
        // Scan the bucket and remove the pair
        for (Pair pair : bucket) {
            if (pair.key == key) {
                bucket.remove(pair);
                size--;
                break;
            }
        }
    }

    /* Expand the hash table */
    void extend() {
        // Save the original hash table
        List<List<Pair>> bucketsTmp = buckets;
        // Initialize the larger hash table
        capacity *= extendRatio;
        buckets = new ArrayList<>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.add(new ArrayList<>());
        }
        size = 0;
        // Move the key-value pairs from the old table into the new one
        for (List<Pair> bucket : bucketsTmp) {
            for (Pair pair : bucket) {
                put(pair.key, pair.val);
            }
        }
    }

    /* Print the hash table */
    void print() {
        for (List<Pair> bucket : buckets) {
            List<String> res = new ArrayList<>();
            for (Pair pair : bucket) {
                res.add(pair.key + " -> " + pair.val);
            }
            System.out.println(res);
        }
    }
}

public class hash_map_chaining {
    public static void main(String[] args) {
        /* Initialize the hash table */
        HashMapChaining map = new HashMapChaining();

        /* Insert a key-value pair */
        // Insert the pair (key, value) into the hash table
        map.put(12836, "Xiao Ha");
        map.put(15937, "Xiao Luo");
        map.put(16750, "Xiao Suan");
        map.put(13276, "Xiao Fa");
        map.put(10583, "Xiao Ya");
        System.out.println("\nHash table after insertion:\nKey -> Value");
        map.print();

        /* Look up a value */
        // Look up key in the hash table to get value
        String name = map.get(13276);
        System.out.println("\nName for student ID 13276: " + name);

        /* Remove a key-value pair */
        // Remove the pair (key, value) from the hash table
        map.remove(12836);
        System.out.println("\nHash table after removing 12836:\nKey -> Value");
        map.print();
    }
}
