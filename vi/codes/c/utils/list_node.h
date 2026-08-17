/**
 * File: list_node.h
 * Created Time: 2023-01-09
 * Author: Reanon (793584285@qq.com)
 */

#ifndef LIST_NODE_H
#define LIST_NODE_H

#ifdef __cplusplus
extern "C" {
#endif

/* Linked list node structure */
typedef struct ListNode {
    int val;               // Node value
    struct ListNode *next; // Reference to next node
} ListNode;

/* Constructor, initialize a new node */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}

/* Deserialize array to linked list */
ListNode *arrToLinkedList(const int *arr, size_t size) {
    if (size <= 0) {
        return NULL;
    }

    ListNode *dummy = newListNode(0);
    ListNode *node = dummy;
    for (int i = 0; i < size; i++) {
        node->next = newListNode(arr[i]);
        node = node->next;
    }
    return dummy->next;
}

/* Free memory allocated to linked list */
void freeMemoryLinkedList(ListNode *cur) {
    // Free memory
    ListNode *pre;
    while (cur != NULL) {
        pre = cur;
        cur = cur->next;
        free(pre);
    }
}

#ifdef __cplusplus
}
#endif

#endif // LIST_NODE_H
