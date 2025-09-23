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

/* 配列を連結リストに逆シリアル化する */
ListNode *vecToLinkedList(vector<int> list) {
    ListNode *dum = new ListNode(0);
    ListNode *head = dum;
    for (int val : list) {
        head->next = new ListNode(val);
        head = head->next;
    }
    return dum->next;
}

/* 連結リストに割り当てられたメモリを解放する */
void freeMemoryLinkedList(ListNode *cur) {
    // メモリを解放
    ListNode *pre;
    while (cur != nullptr) {
        pre = cur;
        cur = cur->next;
        delete pre;
    }
}