/**
 * File: list_node.hpp
 * Created Time: 2021-12-19
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <iostream>
#include <vector>

using namespace std;

// [region]{list_node}
/* Узел связного списка */
struct ListNode {
    int val;        // Значение узла
    ListNode *next; // Указатель на узел-преемник
    ListNode(int x) : val(x), next(nullptr) {
    }
};
// [endregion]{list_node}

/* Десериализовать список в связный список */
ListNode *vecToLinkedList(vector<int> list) {
    ListNode *dum = new ListNode(0);
    ListNode *head = dum;
    for (int val : list) {
        head->next = new ListNode(val);
        head = head->next;
    }
    return dum->next;
}

/* Освободить память, выделенную под связный список */
void freeMemoryLinkedList(ListNode *cur) {
    // Освободить память
    ListNode *pre;
    while (cur != nullptr) {
        pre = cur;
        cur = cur->next;
        delete pre;
    }
}
