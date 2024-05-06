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
    map.put(12836, "Ha");
    map.put(15937, "Luo");
    map.put(16750, "Suan");
    map.put(13276, "Fa");
    map.put(10583, "Ya");
    cout << "\nAfter adding, the hash table is\nKey -> Value" << endl;
    map.print();

    /* Query operation */
    // Enter key to the hash table, get value
    string name = map.get(15937);
    cout << "\nEnter student ID 15937, found name " << name << endl;

    /* Remove operation */
    // Remove key-value pair (key, value) from the hash table
    map.remove(10583);
    cout << "\nAfter removing 10583, the hash table is\nKey -> Value" << endl;
    map.print();

    /* Traverse hash table */
    cout << "\nTraverse key-value pairs Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nIndividually traverse keys Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nIndividually traverse values Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
