/**
 * File: include_test.c
 * Created Time: 2023-01-10
 * Author: Reanon (793584285@qq.com)
 */

#include "common.h"

void testListNode() {
    int nums[] = {2, 3, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    ListNode *head = arrToLinkedList(nums, size);
    printLinkedList(head);
}

void testTreeNode() {
    int nums[] = {1, 2, 3, INT_MAX, 5, 6, INT_MAX};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = arrayToTree(nums, size);

    // print tree
    printTree(root);

    // tree to arr
    int *arr = treeToArray(root, &size);
    printArray(arr, size);
}

int main(int argc, char *argv[]) {
    printf("==testListNode==\n");
    testListNode();
    printf("==testTreeNode==\n");
    testTreeNode();
    return 0;
}
