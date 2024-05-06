/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* Initialize hash table */
    unordered_map<int, string> map;

    /* Add operation */
    // Add key-value pair (key, value) to the hash table
    map[12836] = "Ha";
    map[15937] = "Luo";
    map[16750] = "Suan";
    map[13276] = "Fa";
    map[10583] = "Ya";
    cout << "\nAfter adding, the hash table is\nKey -> Value" << endl;
    printHashMap(map);

    /* Query operation */
    // Enter key to the hash table, get value
    string name = map[15937];
    cout << "\nEnter student ID 15937, found name " << name << endl;

    /* Remove operation */
    // Remove key-value pair (key, value) from the hash table
    map.erase(10583);
    cout << "\nAfter removing 10583, the hash table is\nKey -> Value" << endl;
    printHashMap(map);

    /* Traverse hash table */
    cout << "\nTraverse key-value pairs Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nIterate through Key->Value using an iterator" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
