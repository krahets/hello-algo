/**
 * File: PrintUtil.hpp
 * Created Time: 2021-12-19
 * Author: Krahets (krahets@163.com)
 */

#pragma once

#include <iostream>
using namespace std;

/**
 * @brief Definition for a singly-linked list node
 * 
 */
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(nullptr) {}
};

/**
 * @brief Generate a linked list with a vector
 * 
 * @param list 
 * @return ListNode* 
 */
ListNode* vecToLinkedList(vector<int> list) {
    ListNode *dum = new ListNode(0);
    ListNode *head = dum;
    for (int val : list) {
        head->next = new ListNode(val);
        head = head->next;
    }
    return dum->next;
}

/**
 * @brief Get a list node with specific value from a linked list
 * 
 * @param head 
 * @param val 
 * @return ListNode* 
 */
ListNode* getListNode(ListNode *head, int val) {
    while (head != nullptr && head->val != val) {
        head = head->next;
    }
    return head;
}

/**
 * @brief Free the memory allocated to a linked list
 * 
 * @param cur 
 */
void freeMemoryLinkedList(ListNode *cur) {
    // 释放内存
    ListNode *pre;
    while (cur != nullptr) {
        pre = cur;
        cur = cur->next;
        delete pre;
    }
}
