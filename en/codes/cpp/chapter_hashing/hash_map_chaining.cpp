/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Hash table with chaining */
class HashMapChaining {
  private:
    int size;                       // Number of key-value pairs
    int capacity;                   // Hash table capacity
    double loadThres;               // Load factor threshold for resizing
    int extendRatio;                // Growth factor
    vector<vector<Pair *>> buckets; // Bucket array

  public:
    /* Constructor */
    HashMapChaining() : size(0), capacity(4), loadThres(2.0 / 3.0), extendRatio(2) {
        buckets.resize(capacity);
    }

    /* Destructor */
    ~HashMapChaining() {
        for (auto &bucket : buckets) {
            for (Pair *pair : bucket) {
                // Free the memory
                delete pair;
            }
        }
    }

    /* Hash function */
    int hashFunc(int key) {
        return key % capacity;
    }

    /* Load factor */
    double loadFactor() {
        return (double)size / (double)capacity;
    }

    /* Look up a value */
    string get(int key) {
        int index = hashFunc(key);
        // Scan the bucket and return the corresponding val if key is found
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // Return an empty string if key is absent
        return "";
    }

    /* Insert a key-value pair */
    void put(int key, string val) {
        // Expand the table when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // Scan the bucket. If the specified key is found, update its val and return
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // If key is absent, append the pair to the end of the list
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* Remove a key-value pair */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // Scan the bucket and remove the pair
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // Remove the pair from the list
                delete tmp;                       // Free the memory
                size--;
                return;
            }
        }
    }

    /* Expand the hash table */
    void extend() {
        // Save the original hash table
        vector<vector<Pair *>> bucketsTmp = buckets;
        // Initialize the larger hash table
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // Move the key-value pairs from the old table into the new one
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // Free the memory
                delete pair;
            }
        }
    }

    /* Print the hash table */
    void print() {
        for (auto &bucket : buckets) {
            cout << "[";
            for (Pair *pair : bucket) {
                cout << pair->key << " -> " << pair->val << ", ";
            }
            cout << "]\n";
        }
    }
};

/* Driver code */
int main() {
    /* Initialize the hash table */
    HashMapChaining map = HashMapChaining();

    /* Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    map.put(12836, "Xiao Ha");
    map.put(15937, "Xiao Luo");
    map.put(16750, "Xiao Suan");
    map.put(13276, "Xiao Fa");
    map.put(10583, "Xiao Ya");
    cout << "\nHash table after insertion:\nKey -> Value" << endl;
    map.print();

    /* Look up a value */
    // Look up key in the hash table to get value
    string name = map.get(13276);
    cout << "\nName for student ID 13276: " << name << endl;

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.remove(12836);
    cout << "\nHash table after removing 12836:\nKey -> Value" << endl;
    map.print();

    return 0;
}
