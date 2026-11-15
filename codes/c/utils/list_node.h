/**
 * File: list_node.h
 * Created Time: 2023-01-09
 * Author: Reanon (793584285@qq.com)
 */

#ifndef LIST_NODE_H
#define LIST_NODE_H

#ifdef __cplusplus
extern "C" {
#endif

/* 链表节点结构体 */
typedef struct ListNode {
    int val;               // 节点值
    struct ListNode *next; // 指向下一节点的引用
} ListNode;

/* 构造函数，初始化一个新节点 */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}

/* 将数组反序列化为链表 */
ListNode *arrToLinkedList(const int *arr, size_t size) {
    if (size <= 0) {
        return NULL;
    }

    ListNode *dummy = newListNode(0);
    ListNode *node = dummy;
    for (int i = 0; i < size; i++) {
        node->next = newListNode(arr[i]);
        node = node->next;
    }
    return dummy->next;
}

/* 释放分配给链表的内存空间 */
void freeMemoryLinkedList(ListNode *cur) {
    // 释放内存
    ListNode *pre;
    while (cur != NULL) {
        pre = cur;
        cur = cur->next;
        free(pre);
    }
}

#ifdef __cplusplus
}
#endif

#endif // LIST_NODE_H
