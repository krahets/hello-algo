/**
 * File: include_test.c
 * Created Time: 2023-01-10
 * Author: Reanon (793584285@qq.com)
 */

#include "include.h"

void testListNode() {
    int nums[] = {2, 3, 5, 6, 7};
    int size = sizeof(nums) / sizeof(int);
    ListNode *head = ArrayToLinkedList(nums, size);
    PrintLinkedList(head);

    ListNode *node = GetListNode(head, 5);
    printf("find node: %d\n", node->val);
}

void testTreeNode() {
    int nums[] = {1, 2, 3, NIL, 5, 6, NIL};
    int size = sizeof(nums) / sizeof(int);
    TreeNode *root = ArrayToTree(nums, size);

    // print tree
    PrintTree(root);

    // tree to arr
    int *arr = TreeToArray(root);
    PrintArray(arr, size);
}

int main(int argc, char *argv[]) {
    printf("==testListNode==\n");
    testListNode();
    printf("==testTreeNode==\n");
    testTreeNode();
    return 0;
}
