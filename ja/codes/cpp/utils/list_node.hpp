/**
 * File: list_node.hpp
 * Created Time: 2021-12-19
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <iostream>
#include <vector>

using namespace std;

/* 連結リストノード */
struct ListNode {
    int val;
    ListNode *next;
    ListNode(int x) : val(x), next(nullptr) {
    }
};

/* リストを連結リストにデシリアライズする */
ListNode *vecToLinkedList(vector<int> list) {
    ListNode *dum = new ListNode(0);
    ListNode *head = dum;
    for (int val : list) {
        head->next = new ListNode(val);
        head = head->next;
    }
    return dum->next;
}

/* 連結リストに割り当てたメモリを解放する */
void freeMemoryLinkedList(ListNode *cur) {
    // メモリを解放する
    ListNode *pre;
    while (cur != nullptr) {
        pre = cur;
        cur = cur->next;
        delete pre;
    }
}
