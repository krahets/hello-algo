/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Hash-based search (array) */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // Hash table key: target element; value: index
    // Return -1 if the hash table does not contain this key
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* Hash-based search (linked list) */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // Hash table key: target node value; value: node object
    // Return nullptr if this key is absent from the hash table
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Driver code */
int main() {
    int target = 3;

    /* Hash-based search (array) */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // Initialize the hash table
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key: element; value: index
    }
    int index = hashingSearchArray(map, target);
    cout << "Index of target element 3 = " << index << endl;

    /* Hash-based search (linked list) */
    ListNode *head = vecToLinkedList(nums);
    // Initialize the hash table
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key: node value; value: node
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "The node object corresponding to target value 3 is " << node << endl;

    return 0;
}
