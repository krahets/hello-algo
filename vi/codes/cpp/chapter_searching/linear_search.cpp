/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Linear search (array) */
int linearSearchArray(vector<int> &nums, int target) {
    // Traverse array
    for (int i = 0; i < nums.size(); i++) {
        // Found the target element, return its index
        if (nums[i] == target)
            return i;
    }
    // Target element not found, return -1
    return -1;
}

/* Linear search (linked list) */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // Traverse the linked list
    while (head != nullptr) {
        // Found the target node, return it
        if (head->val == target)
            return head;
        head = head->next;
    }
    // Target node not found, return nullptr
    return nullptr;
}

/* Driver Code */
int main() {
    int target = 3;

    /* Perform linear search in array */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "Index of target element 3 = " << index << endl;

    /* Perform linear search in linked list */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "Node object corresponding to target node value 3 is " << node << endl;

    return 0;
}
