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
    const double loadThres = 2.0 / 3.0;     // Load factor threshold for resizing
    const int extendRatio = 2;            // Growth factor
    vector<Pair *> buckets;               // Bucket array
    Pair *TOMBSTONE = new Pair(-1, "-1"); // Deletion marker

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
    string get(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the pair is found, return its val
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            return buckets[index]->val;
        }
        // If the pair is absent, return an empty string
        return "";
    }

    /* Insert a key-value pair */
    void put(int key, string val) {
        // Expand the table when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        // Find the bucket index for key
        int index = findBucket(key);
        // If the pair is found, overwrite val and return
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            buckets[index]->val = val;
            return;
        }
        // If the pair is absent, insert it
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* Remove a key-value pair */
    void remove(int key) {
        // Find the bucket index for key
        int index = findBucket(key);
        // If the pair is found, replace it with a deletion marker
        if (buckets[index] != nullptr && buckets[index] != TOMBSTONE) {
            delete buckets[index];
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* Expand the hash table */
    void extend() {
        // Save the original hash table
        vector<Pair *> bucketsTmp = buckets;
        // Initialize the larger hash table
        capacity *= extendRatio;
        buckets = vector<Pair *>(capacity, nullptr);
        size = 0;
        // Move the key-value pairs from the old table into the new one
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

    // Insert a key-value pair
    // Insert the pair (key, val) into the hash table
    hashmap.put(12836, "Xiao Ha");
    hashmap.put(15937, "Xiao Luo");
    hashmap.put(16750, "Xiao Suan");
    hashmap.put(13276, "Xiao Fa");
    hashmap.put(10583, "Xiao Ya");
    cout << "\nHash table after insertion:\nKey -> Value" << endl;
    hashmap.print();

    // Look up a value
    // Look up key in the hash table to get val
    string name = hashmap.get(13276);
    cout << "\nName for student ID 13276: " << name << endl;

    // Remove a key-value pair
    // Remove the pair (key, val) from the hash table
    hashmap.remove(16750);
    cout << "\nHash table after removing 16750:\nKey -> Value" << endl;
    hashmap.print();

    return 0;
}
