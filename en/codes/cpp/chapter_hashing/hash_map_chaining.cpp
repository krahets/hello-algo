/**
 * File: hash_map_chaining.cpp
 * Created Time: 2023-06-13
 * Author: krahets (krahets@163.com)
 */

#include "./array_hash_map.cpp"

/* Hash table with separate chaining */
class HashMapChaining {
  private:
    int size;                       // Number of key-value pairs
    int capacity;                   // Hash table capacity
    double loadThres;               // Load factor threshold that triggers capacity growth
    int extendRatio;                // Capacity growth factor
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
                // Free memory
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

    /* Lookup operation */
    string get(int key) {
        int index = hashFunc(key);
        // Traverse the bucket; if key is found, return its corresponding val
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // Return an empty string if key is not found
        return "";
    }

    /* Insert operation */
    void put(int key, string val) {
        // Grow the capacity when the load factor exceeds the threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // Traverse the bucket; if the specified key is found, update its val and return
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // If key is absent, append the key-value pair at the end
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* Remove operation */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // Traverse the bucket and remove the key-value pair
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // Remove the key-value pair from the list
                delete tmp;                       // Free memory
                size--;
                return;
            }
        }
    }

    /* Grow the hash table capacity */
    void extend() {
        // Keep a copy of the original bucket array
        vector<vector<Pair *>> bucketsTmp = buckets;
        // Initialize a new hash table with the expanded capacity
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // Move the key-value pairs from the original hash table to the new one
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // Free memory
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

    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    map.put(12836, "小哈");
    map.put(15937, "小啰");
    map.put(16750, "小算");
    map.put(13276, "小法");
    map.put(10583, "小鸭");
    cout << "\nHash table after insertion:\nKey -> Value" << endl;
    map.print();

    /* Lookup operation */
    // Look up key in the hash table to obtain value
    string name = map.get(13276);
    cout << "\nLook up student ID 13276 to obtain the name " << name << endl;

    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.remove(12836);
    cout << "\nHash table after removing 12836:\nKey -> Value" << endl;
    map.print();

    return 0;
}
