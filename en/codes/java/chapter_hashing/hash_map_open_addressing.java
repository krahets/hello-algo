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
    private final double loadThres = 2.0 / 3.0; // Load factor threshold for resizing
    private final int extendRatio = 2; // Growth factor
    private Pair[] buckets; // Bucket array
    private final Pair TOMBSTONE = new Pair(-1, "-1"); // Deletion marker

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
        for (int i = 0; i < capacity && buckets[index] != null; i++) {
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
    public String get(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the pair is found, return its val
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // Return null if the pair is absent
        return null;
    }

    /* Insert a key-value pair */
    public void put(int key, String val) {
        // Expand the table when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        // Find the bucket index for key
        int index = findBucket(key);
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
    public void remove(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the pair is found, replace it with a deletion marker
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Expand the hash table */
    private void extend() {
        // Save the original hash table
        Pair[] bucketsTmp = buckets;
        // Initialize the larger hash table
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // Move the key-value pairs from the old table into the new one
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

        // Insert a key-value pair
        // Insert the pair (key, val) into the hash table
        hashmap.put(12836, "Xiao Ha");
        hashmap.put(15937, "Xiao Luo");
        hashmap.put(16750, "Xiao Suan");
        hashmap.put(13276, "Xiao Fa");
        hashmap.put(10583, "Xiao Ya");
        System.out.println("\nHash table after insertion:\nKey -> Value");
        hashmap.print();

        // Look up a value
        // Look up key in the hash table to get val
        String name = hashmap.get(13276);
        System.out.println("\nName for student ID 13276: " + name);

        // Remove a key-value pair
        // Remove the pair (key, val) from the hash table
        hashmap.remove(16750);
        System.out.println("\nHash table after removing 16750:\nKey -> Value");
        hashmap.print();
    }
}
