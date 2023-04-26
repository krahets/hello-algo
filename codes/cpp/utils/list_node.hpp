/**
 * File: list_node.hpp
 * Created Time: 2021-12-19
 * Author: Krahets (krahets@163.com)
 */

#pragma once

#include <iostream>
using namespace std;

/* Definition for a singly-linked list node */
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(nullptr) {
    }
};

/* Generate a linked list with a vector */
ListNode *vecToLinkedList(vector<int> list) {
    ListNode *dum = new ListNode(0);
    ListNode *head = dum;
    for (int val : list) {
        head->next = new ListNode(val);
        head = head->next;
    }
    return dum->next;
}

/* Get a list node with specific value from a linked list */
ListNode *getListNode(ListNode *head, int val) {
    while (head != nullptr && head->val != val) {
        head = head->next;
    }
    return head;
}

/* Free the memory allocated to a linked list */
void freeMemoryLinkedList(ListNode *cur) {
    // 释放内存
    ListNode *pre;
    while (cur != nullptr) {
        pre = cur;
        cur = cur->next;
        delete pre;
    }
}
