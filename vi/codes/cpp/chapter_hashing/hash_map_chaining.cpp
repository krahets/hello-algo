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
    double loadThres;               // Load factor threshold for triggering expansion
    int extendRatio;                // Expansion multiplier
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

    /* Query operation */
    string get(int key) {
        int index = hashFunc(key);
        // Traverse bucket, if key is found, return corresponding val
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                return pair->val;
            }
        }
        // Return empty string if key not found
        return "";
    }

    /* Add operation */
    void put(int key, string val) {
        // When load factor exceeds threshold, perform expansion
        if (loadFactor() > loadThres) {
            extend();
        }
        int index = hashFunc(key);
        // Traverse bucket, if specified key is encountered, update corresponding val and return
        for (Pair *pair : buckets[index]) {
            if (pair->key == key) {
                pair->val = val;
                return;
            }
        }
        // If key does not exist, append key-value pair to the end
        buckets[index].push_back(new Pair(key, val));
        size++;
    }

    /* Remove operation */
    void remove(int key) {
        int index = hashFunc(key);
        auto &bucket = buckets[index];
        // Traverse bucket and remove key-value pair from it
        for (int i = 0; i < bucket.size(); i++) {
            if (bucket[i]->key == key) {
                Pair *tmp = bucket[i];
                bucket.erase(bucket.begin() + i); // Remove key-value pair from it
                delete tmp;                       // Free memory
                size--;
                return;
            }
        }
    }

    /* Expand hash table */
    void extend() {
        // Temporarily store the original hash table
        vector<vector<Pair *>> bucketsTmp = buckets;
        // Initialize expanded new hash table
        capacity *= extendRatio;
        buckets.clear();
        buckets.resize(capacity);
        size = 0;
        // Move key-value pairs from original hash table to new hash table
        for (auto &bucket : bucketsTmp) {
            for (Pair *pair : bucket) {
                put(pair->key, pair->val);
                // Free memory
                delete pair;
            }
        }
    }

    /* Print hash table */
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

/* Driver Code */
int main() {
    /* Initialize hash table */
    HashMapChaining map = HashMapChaining();

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    map.put(12836, "Xiao Ha");
    map.put(15937, "Xiao Luo");
    map.put(16750, "Xiao Suan");
    map.put(13276, "Xiao Fa");
    map.put(10583, "Xiao Ya");
    cout << "\nAfter adding is complete, hash table is\nKey -> Value" << endl;
    map.print();

    /* Query operation */
    // Input key into hash table to get value
    string name = map.get(13276);
    cout << "\nInput student ID 13276, query name " << name << endl;

    /* Remove operation */
    // Remove key-value pair (key, value) from hash table
    map.remove(12836);
    cout << "\nAfter removing 12836, hash table is\nKey -> Value" << endl;
    map.print();

    return 0;
}
