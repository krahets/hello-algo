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
    const double loadThres = 2.0 / 3.0;     // Load factor threshold for triggering expansion
    const int extendRatio = 2;            // Expansion multiplier
    vector<Pair *> buckets;               // Bucket array
    Pair *TOMBSTONE = new Pair(-1, "-1"); // Removal marker

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

    /* Search for bucket index corresponding to key */
    int findBucket(int key) {
        int index = hashFunc(key);
        int firstTombstone = -1;
        // Linear probing, break when encountering an empty bucket
        while (buckets[index] != nullptr) {
            // If key is encountered, return the corresponding bucket index
            if (buckets[index]->key == key) {
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
    string get(int key) {
        // Search for bucket index corresponding to key
        int index = findBucket(key);
        // If key-value pair is found, return corresponding val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // Return empty string if key-value pair does not exist
        return "";
    }

    /* Add operation */
    void put(int key, string val) {
        // When load factor exceeds threshold, perform expansion
        if (loadFactor() > loadThres) {
            extend();
        }
        // Search for bucket index corresponding to key
        int index = findBucket(key);
        // If key-value pair is found, overwrite val and return
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // If key-value pair does not exist, add the key-value pair
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove operation */
    void remove(int key) {
        // Search for bucket index corresponding to key
        int index = findBucket(key);
        // If key-value pair is found, overwrite it with removal marker
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Expand hash table */
    void extend() {
        // Temporarily store the original hash table
        vector<Pair *> bucketsTmp = buckets;
        // Initialize expanded new hash table
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // Move key-value pairs from original hash table to new hash table
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
    hashmap.put(12836, "Xiao Ha");
    hashmap.put(15937, "Xiao Luo");
    hashmap.put(16750, "Xiao Suan");
    hashmap.put(13276, "Xiao Fa");
    hashmap.put(10583, "Xiao Ya");
    cout << "\nAfter adding is complete, hash table is\nKey -> Value" << endl;
    hashmap.print();

    // Query operation
    // Input key into hash table to get value val
    string name = hashmap.get(13276);
    cout << "\nInput student ID 13276, query name " << name << endl;

    // Remove operation
    // Remove key-value pair (key, val) from hash table
    hashmap.remove(16750);
    cout << "\nAfter removing 16750, hash table is\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
