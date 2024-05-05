/**
 * File: linked_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* Insert node P after node n0 in the linked list */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* Remove the first node after node n0 in the linked list */
// Note: stdio.h uses the keyword 'remove'
void removeItem(ListNode *n0) {
    if (!n0->next)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // Free memory
    free(P);
}

/* Access the node at `index` in the linked list */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == NULL)
            return NULL;
        head = head->next;
    }
    return head;
}

/* Search for the first node with value target in the linked list */
int find(ListNode *head, int target) {
    int index = 0;
    while (head) {
        if (head->val == target)
            return index;
        head = head->next;
        index++;
    }
    return -1;
}

/* Driver Code */
int main() {
    /* Initialize linked list */
    // Initialize each node
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // Build references between nodes
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("The initialized linked list is\r\n");
    printLinkedList(n0);

    /* Insert node */
    insert(n0, newListNode(0));
    printf("The linked list after inserting a node is\r\n");
    printLinkedList(n0);

    /* Remove node */
    removeItem(n0);
    printf("The linked list after removing a node is\r\n");
    printLinkedList(n0);

    /* Access node */
    ListNode *node = access(n0, 3);
    printf("The value of the node at index 3 in the linked list = %d\r\n", node->val);

    /* Search node */
    int index = find(n0, 2);
    printf("The index of the node with value 2 in the linked list = %d\r\n", index);

    // Free memory
    freeMemoryLinkedList(n0);
    return 0;
}
