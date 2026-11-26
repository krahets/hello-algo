/**
 * File: linked_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Insert node P after node n0 in the linked list */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* Remove the node immediately after n0 in the linked list */
void remove(ListNode *n0) {
    if (n0->next == nullptr)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // Free memory
    delete P;
}

/* Access the linked list node at the specified index */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == nullptr)
            return nullptr;
        head = head->next;
    }
    return head;
}

/* Find the first node with value target in the linked list */
int find(ListNode *head, int target) {
    int index = 0;
    while (head != nullptr) {
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
    ListNode *n0 = new ListNode(1);
    ListNode *n1 = new ListNode(3);
    ListNode *n2 = new ListNode(2);
    ListNode *n3 = new ListNode(5);
    ListNode *n4 = new ListNode(4);
    // Link the nodes together
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    cout << "Initial linked list:" << endl;
    printLinkedList(n0);

    /* Insert a node */
    insert(n0, new ListNode(0));
    cout << "Linked list after insertion:" << endl;
    printLinkedList(n0);

    /* Remove a node */
    remove(n0);
    cout << "Linked list after removal:" << endl;
    printLinkedList(n0);

    /* Access a node */
    ListNode *node = access(n0, 3);
    cout << "Value of the node at index 3 = " << node->val << endl;

    /* Find a node */
    int index = find(n0, 2);
    cout << "Index of the node with value 2 = " << index << endl;

    // Free memory
    freeMemoryLinkedList(n0);

    return 0;
}
