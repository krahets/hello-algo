/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Linear search (array) */
int linearSearchArray(vector<int> &nums, int target) {
    // Traverse the array
    for (int i = 0; i < nums.size(); i++) {
        // The target element was found; return its index
        if (nums[i] == target)
            return i;
    }
    // The target element was not found; return -1
    return -1;
}

/* Linear search (linked list) */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // Traverse the linked list
    while (head != nullptr) {
        // The target node was found; return it
        if (head->val == target)
            return head;
        head = head->next;
    }
    // The target node was not found; return nullptr
    return nullptr;
}

/* Driver code */
int main() {
    int target = 3;

    /* Perform linear search on the array */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "Index of target element 3 = " << index << endl;

    /* Perform linear search on the linked list */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "The node object corresponding to target value 3 is " << node << endl;

    return 0;
}
