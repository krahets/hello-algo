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

/**
 * @brief Definition for a singly-linked list node
 *
 */
struct ListNode {
    int val;               // 结点值
    struct ListNode *next; // 指向下一结点的指针（引用）
};

// typedef 为 C 语言的关键字，作用是为一种数据类型定义一个新名字
typedef struct ListNode ListNode;

ListNode *newListNode(int val) {
    ListNode *node, *next;
    node = (ListNode *) malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}

/**
 * @brief Generate a linked list with a vector
 *
 * @param list
 * @return ListNode*
 */

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

/**
 * @brief Get a list node with specific value from a linked list
 *
 * @param head
 * @param val
 * @return ListNode*
 */
ListNode *getListNode(ListNode *head, int val) {
    while (head != NULL && head->val != val) {
        head = head->next;
    }
    return head;
}

#ifdef __cplusplus
}
#endif

#endif // LIST_NODE_H