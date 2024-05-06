/**
 * File: hash_map_open_addressing.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Open addressing hash table */
class HashMapOpenAddressing {
  private:
    int size;                             // Number of key-value pairs
    int capacity = 4;                     // Hash table capacity
    const double loadThres = 2.0 / 3.0;     // Load factor threshold for triggering expansion
    const int extendRatio = 2;            // Expansion multiplier
    vector<Pair *> buckets;               // Bucket array
    Pair *TOMBSTONE = new Pair(-1, "-1"); // Removal mark

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

    /* Search for the bucket index corresponding to key */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Linear probing, break when encountering an empty bucket
        while (buckets[index] != nullptr) {
            // If the key is encountered, return the corresponding bucket index
            if (buckets[index]->key == key) {
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
    string get(int key) {
        // Search for the bucket index corresponding to key
        int index = findBucket(key);
        // If the key-value pair is found, return the corresponding val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // If key-value pair does not exist, return an empty string
        return "";
    }

    /* Add operation */
    void put(int key, string val) {
        // When the load factor exceeds the threshold, perform expansion
        if (loadFactor() > loadThres) {
            extend();
        }
        // Search for the bucket index corresponding to key
        int index = findBucket(key);
        // If the key-value pair is found, overwrite val and return
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // If the key-value pair does not exist, add the key-value pair
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove operation */
    void remove(int key) {
        // Search for the bucket index corresponding to key
        int index = findBucket(key);
        // If the key-value pair is found, cover it with a removal mark
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Extend hash table */
    void extend() {
        // Temporarily store the original hash table
        vector<Pair *> bucketsTmp = buckets;
        // Initialize the extended new hash table
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // Move key-value pairs from the original hash table to the new hash table
        for (Pair *pair : bucketsTmp) {
            if (pair != nullptr && pair != TOMBSTONE) {
                put(pair->key, pair->val);
                delete pair;
            }
        }
    }

    /* Print hash table */
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

/* Driver Code */
int main() {
    // Initialize hash table
    HashMapOpenAddressing hashmap;

    // Add operation
    // Add key-value pair (key, val) to the hash table
    hashmap.put(12836, "Ha");
    hashmap.put(15937, "Luo");
    hashmap.put(16750, "Suan");
    hashmap.put(13276, "Fa");
    hashmap.put(10583, "Ya");
    cout << "\nAfter adding, the hash table is\nKey -> Value" << endl;
    hashmap.print();

    // Query operation
    // Enter key to the hash table, get value val
    string name = hashmap.get(13276);
    cout << "\nEnter student ID 13276, found name " << name << endl;

    // Remove operation
    // Remove key-value pair (key, val) from the hash table
    hashmap.remove(16750);
    cout << "\nAfter removing 16750, the hash table is\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
