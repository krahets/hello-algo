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
        // Found the target element, thus return its index
        if (nums[i] == target)
            return i;
    }
    // Did not find the target element, thus return -1
    return -1;
}

/* Linear search (linked list) */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // Traverse the list
    while (head != nullptr) {
        // Found the target node, return it
        if (head->val == target)
            return head;
        head = head->next;
    }
    // If the target node is not found, return nullptr
    return nullptr;
}

/* Driver Code */
int main() {
    int target = 3;

    /* Perform linear search in array */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "The index of target element 3 is " << index << endl;

    /* Perform linear search in linked list */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "The corresponding node object for target node value 3 is " << node << endl;

    return 0;
}
