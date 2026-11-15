/**
 * File: hash_map.cpp
 * Created Time: 2022-12-14
 * Author: msk397 (machangxinq@gmail.com)
 */

#include "../utils/common.hpp"

/* Driver code */
int main() {
    // [region]{init_hash_map}
    /* Initialize the hash table */
    unordered_map<int, string> map;
    // [endregion]{init_hash_map}

    // [region]{add_pairs}
    /* Insert operation */
    // Insert the key-value pair (key, value) into the hash table
    map[12836] = "小哈";
    map[15937] = "小啰";
    map[16750] = "小算";
    map[13276] = "小法";
    map[10583] = "小鸭";
    // [endregion]{add_pairs}
    cout << "\nHash table after insertion:\nKey -> Value" << endl;
    printHashMap(map);

    // [region]{get_value}
    /* Lookup operation */
    // Look up key in the hash table to obtain value
    string name = map[15937];
    // [endregion]{get_value}
    cout << "\nLook up student ID 15937 to obtain the name " << name << endl;

    // [region]{remove_pair}
    /* Remove operation */
    // Remove the key-value pair (key, value) from the hash table
    map.erase(10583);
    // [endregion]{remove_pair}
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
