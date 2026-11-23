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
    string name = map.get(15937);
    cout << "\nLook up student ID 15937 to obtain the name " << name << endl;

    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.remove(10583);
    cout << "\nHash table after removing 10583:\nKey -> Value" << endl;
    map.print();

    /* Traverse the hash table */
    cout << "\nTraverse key-value pairs: Key->Value" << endl;
    for (auto kv : map.pairSet()) {
        cout << kv->key << " -> " << kv->val << endl;
    }

    cout << "\nTraverse keys only: Key" << endl;
    for (auto key : map.keySet()) {
        cout << key << endl;
    }

    cout << "\nTraverse values only: Value" << endl;
    for (auto val : map.valueSet()) {
        cout << val << endl;
    }

    return 0;
}
