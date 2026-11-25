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

    /* Insert a key-value pair */
    // Insert the pair (key, value) into the hash table
    map[12836] = "Xiao Ha";
    map[15937] = "Xiao Luo";
    map[16750] = "Xiao Suan";
    map[13276] = "Xiao Fa";
    map[10583] = "Xiao Ya";
    cout << "\nHash table after insertion:\nKey -> Value" << endl;
    printHashMap(map);

    /* Look up a value */
    // Look up key in the hash table to get value
    string name = map[15937];
    cout << "\nName for student ID 15937: " << name << endl;

    /* Remove a key-value pair */
    // Remove the pair (key, value) from the hash table
    map.erase(10583);
    cout << "\nHash table after removing 10583:\nKey -> Value" << endl;
    printHashMap(map);

    /* Iterate over the hash table */
    cout << "\nIterate over key-value pairs (Key->Value)" << endl;
    for (auto kv : map) {
        cout << kv.first << " -> " << kv.second << endl;
    }
    cout << "\nIterate over key-value pairs with an iterator (Key->Value)" << endl;
    for (auto iter = map.begin(); iter != map.end(); iter++) {
        cout << iter->first << "->" << iter->second << endl;
    }

    return 0;
}
