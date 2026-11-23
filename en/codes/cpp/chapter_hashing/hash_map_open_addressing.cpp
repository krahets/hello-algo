/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Hash table with open addressing */
class HashMapOpenAddressing {
  private:
    int size;                             // Number of key-value pairs
    int capacity = 4;                     // Hash table capacity
    const double loadThres = 2.0 / 3.0;     // Load factor threshold that triggers capacity growth
    const int extendRatio = 2;            // Capacity growth factor
    vector<Pair *> buckets;               // Bucket array
    Pair *TOMBSTONE = new Pair(-1, "-1"); // Tombstone marker

  public:
    /* Constructor */
    HashMapOpenAddressing() : size(0), buckets(capacity, nullptr) {
    }

    /* Destructor */
    ~HashMapOpenAddressing() {
        for (Pair *pair : buckets) {
            if (pair != nullptr && pair != TOMBSTONE) {
                delete pair;
            }
        }
        delete TOMBSTONE;
    }

    /* Hash function */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Load factor */
    double loadFactor() {
        return (double)size / capacity;
    }

    /* Find the bucket index for key */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Probe linearly until an empty bucket is reached
        while (buckets[index] != nullptr) {
            // If key is found, return its bucket index
            if (buckets[index]->key == key) {
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
    string get(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, return its val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // Return an empty string if the key-value pair does not exist
        return "";
    }

    /* Insert operation */
    void put(int key, string val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, overwrite val and return
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // If the key-value pair is absent, insert it
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove operation */
    void remove(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the key-value pair is found, replace it with a tombstone
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Grow the hash table capacity */
    void extend() {
        // Keep a copy of the original bucket array
        vector<Pair *> bucketsTmp = buckets;
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* Print the hash table */
    void print() {
        for (Pair *pair : buckets) {
            if (pair == nullptr) {
                cout << "nullptr" << endl;
            } else if (pair == TOMBSTONE) {
                cout << "TOMBSTONE" << endl;
            } else {
                cout << pair->key << " -> " << pair->val << endl;
            }
        }
    }
};

/* Driver code */
int main() {
    // Initialize the hash table
    HashMapOpenAddressing hashmap;

    // Insert operation
    // Insert the key-value pair (key, val) into the hash table
    hashmap.put(12836, "小哈");
    hashmap.put(15937, "小啰");
    hashmap.put(16750, "小算");
    hashmap.put(13276, "小法");
    hashmap.put(10583, "小鸭");
    cout << "\nHash table after insertion:\nKey -> Value" << endl;
    hashmap.print();

    // Lookup operation
    // Look up key in the hash table to obtain val
    string name = hashmap.get(13276);
    cout << "\nLook up student ID 13276 to obtain the name " << name << endl;

    // Remove operation
    // Remove the key-value pair (key, val) from the hash table
    hashmap.remove(16750);
    cout << "\nHash table after removing 16750:\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
