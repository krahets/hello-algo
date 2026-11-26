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

/* Remove the node immediately after n0 in the linked list */
// Note: stdio.h already uses the name remove
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

/* Access the linked list node at the specified index */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == NULL)
            return NULL;
        head = head->next;
    }
    return head;
}

/* Find the first node with value target in the linked list */
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
    /* Initialize the linked list */
    // Initialize the nodes
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // Link the nodes together
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("Initial linked list:\r\n");
    printLinkedList(n0);

    /* Insert a node */
    insert(n0, newListNode(0));
    printf("Linked list after insertion:\r\n");
    printLinkedList(n0);

    /* Remove a node */
    removeItem(n0);
    printf("Linked list after removal:\r\n");
    printLinkedList(n0);

    /* Access a node */
    ListNode *node = access(n0, 3);
    printf("Value of the node at index 3 = %d\r\n", node->val);

    /* Find a node */
    int index = find(n0, 2);
    printf("Index of the node with value 2 = %d\r\n", index);

    // Free memory
    freeMemoryLinkedList(n0);
    return 0;
}
