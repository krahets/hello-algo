/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Hash search (array) */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // Hash table's key: target element, value: index
    // If the hash table does not contain this key, return -1
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* Hash search (linked list) */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // Hash table key: target node value, value: node object
    // If the key is not in the hash table, return nullptr
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Driver Code */
int main() {
    int target = 3;

    /* Hash search (array) */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // Initialize hash table
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key: element, value: index
    }
    int index = hashingSearchArray(map, target);
    cout << "The index of target element 3 is " << index << endl;

    /* Hash search (linked list) */
    ListNode *head = vecToLinkedList(nums);
    // Initialize hash table
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key: node value, value: node
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "The corresponding node object for target node value 3 is " << node << endl;

    return 0;
}
