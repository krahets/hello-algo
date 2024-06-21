/**
 * File: linked_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 在鏈結串列的節點 n0 之後插入節點 P */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* 刪除鏈結串列的節點 n0 之後的首個節點 */
// 注意：stdio.h 佔用了 remove 關鍵詞
void removeItem(ListNode *n0) {
    if (!n0->next)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // 釋放記憶體
    free(P);
}

/* 訪問鏈結串列中索引為 index 的節點 */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == NULL)
            return NULL;
        head = head->next;
    }
    return head;
}

/* 在鏈結串列中查詢值為 target 的首個節點 */
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
    /* 初始化鏈結串列 */
    // 初始化各個節點
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // 構建節點之間的引用
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("初始化的鏈結串列為\r\n");
    printLinkedList(n0);

    /* 插入節點 */
    insert(n0, newListNode(0));
    printf("插入節點後的鏈結串列為\r\n");
    printLinkedList(n0);

    /* 刪除節點 */
    removeItem(n0);
    printf("刪除節點後的鏈結串列為\r\n");
    printLinkedList(n0);

    /* 訪問節點 */
    ListNode *node = access(n0, 3);
    printf("鏈結串列中索引 3 處的節點的值 = %d\r\n", node->val);

    /* 查詢節點 */
    int index = find(n0, 2);
    printf("鏈結串列中值為 2 的節點的索引 = %d\r\n", index);

    // 釋放記憶體
    freeMemoryLinkedList(n0);
    return 0;
}
