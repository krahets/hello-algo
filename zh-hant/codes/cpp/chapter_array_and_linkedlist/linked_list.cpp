/**
 * File: linked_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 在鏈結串列的節點 n0 之後插入節點 P */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* 刪除鏈結串列的節點 n0 之後的首個節點 */
void remove(ListNode *n0) {
    if (n0->next == nullptr)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // 釋放記憶體
    delete P;
}

/* 訪問鏈結串列中索引為 index 的節點 */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == nullptr)
            return nullptr;
        head = head->next;
    }
    return head;
}

/* 在鏈結串列中查詢值為 target 的首個節點 */
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
    /* 初始化鏈結串列 */
    // 初始化各個節點
    ListNode *n0 = new ListNode(1);
    ListNode *n1 = new ListNode(3);
    ListNode *n2 = new ListNode(2);
    ListNode *n3 = new ListNode(5);
    ListNode *n4 = new ListNode(4);
    // 構建節點之間的引用
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    cout << "初始化的鏈結串列為" << endl;
    printLinkedList(n0);

    /* 插入節點 */
    insert(n0, new ListNode(0));
    cout << "插入節點後的鏈結串列為" << endl;
    printLinkedList(n0);

    /* 刪除節點 */
    remove(n0);
    cout << "刪除節點後的鏈結串列為" << endl;
    printLinkedList(n0);

    /* 訪問節點 */
    ListNode *node = access(n0, 3);
    cout << "鏈結串列中索引 3 處的節點的值 = " << node->val << endl;

    /* 查詢節點 */
    int index = find(n0, 2);
    cout << "鏈結串列中值為 2 的節點的索引 = " << index << endl;

    // 釋放記憶體
    freeMemoryLinkedList(n0);

    return 0;
}
