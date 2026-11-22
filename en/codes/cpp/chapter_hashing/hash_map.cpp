/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    /* Initialize the hash table */
    unordered_map<int, string> map;

    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    cout << "\nHash table after insertion:\nKey -> Value" << endl;
    printHashMap(map);

    /* Lookup operation */
    // Look up key in the hash table to obtain value
    string name = map[15937];
    cout << "\nLook up student ID 15937 to obtain the name " << name << endl;

    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.erase(10583);
    cout << "\nHash table after removing 10583:\nKey -> Value" << endl;
    printHashMap(map);

    /* Traverse the hash table */
    cout << "\nTraverse key-value pairs: Key->Value" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nTraverse Key->Value pairs using an iterator" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
