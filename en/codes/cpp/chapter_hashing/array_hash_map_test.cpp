/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* Driver code */
int main() {
    /* Initialize the hash table */
    ArrayHashMap map = ArrayHashMap();

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
    string name = map.get(15937);
    cout << "\nName for student ID 15937: " << name << endl;

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.remove(10583);
    cout << "\nHash table after removing 10583:\nKey -> Value" << endl;
    map.print();

    /* Iterate over the hash table */
    cout << "\nIterate over key-value pairs (Key->Value)" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nIterate over keys only" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nIterate over values only" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
