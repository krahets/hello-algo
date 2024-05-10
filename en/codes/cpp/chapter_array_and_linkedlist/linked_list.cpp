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

/* Remove the first node after node n0 in the linked list */
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

/* Access the node at `index` in the linked list */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == nullptr)
            return nullptr;
        head = head->next;
    }
    return head;
}

/* Search for the first node with value target in the linked list */
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
    /* Initialize linked list */
    // Initialize each node
    ListNode *n0 = new ListNode(1);
    ListNode *n1 = new ListNode(3);
    ListNode *n2 = new ListNode(2);
    ListNode *n3 = new ListNode(5);
    ListNode *n4 = new ListNode(4);
    // Build references between nodes
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    cout << "The initialized linked list is" << endl;
    printLinkedList(n0);

    /* Insert node */
    insert(n0, new ListNode(0));
    cout << "Linked list after inserting the node is" << endl;
    printLinkedList(n0);

    /* Remove node */
    remove(n0);
    cout << "Linked list after removing the node is" << endl;
    printLinkedList(n0);

    /* Access node */
    ListNode *node = access(n0, 3);
    cout << "The value of the node at index 3 in the linked list = " << node->val << endl;

    /* Search node */
    int index = find(n0, 2);
    cout << "The index of the node with value 2 in the linked list = " << index << endl;

    // Free memory
    freeMemoryLinkedList(n0);

    return 0;
}
