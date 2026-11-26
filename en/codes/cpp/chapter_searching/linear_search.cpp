/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Linear search in an array */
int linearSearchArray(vector<int> &nums, int target) {
    // Traverse the array
    for (int i = 0; i < nums.size(); i++) {
        // Found the target. Return its index
        if (nums[i] == target)
            return i;
    }
    // Target not found. Return -1
    return -1;
}

/* Linear search in a linked list */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // Traverse the linked list
    while (head != nullptr) {
        // Found the target node. Return it
        if (head->val == target)
            return head;
        head = head->next;
    }
    // Target node not found. Return nullptr
    return nullptr;
}

/* Driver code */
int main() {
    int target = 3;

    /* Run linear search on the array */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "Index of target 3 = " << index << endl;

    /* Run linear search on the linked list */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "Node object for target value 3 = " << node << endl;

    return 0;
}
