/**
 * File: array_hash_map_test.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "./array_hash_map.cpp"

/* Driver Code */
int main() {
    /* Initialize hash table */
    ArrayHashMap map = ArrayHashMap();

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
    string name = map.get(15937);
    cout << "\nInput student ID 15937, query name " << name << endl;

    /* Remove operation */
    // Remove key-value pair (key, value) from hash table
    map.remove(10583);
    cout << "\nAfter removing 10583, hash table is\nKey -> Value" << endl;
    map.print();

    /* Traverse hash table */
    cout << "\nTraverse key-value pairs Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nTraverse keys only Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nTraverse values only Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
