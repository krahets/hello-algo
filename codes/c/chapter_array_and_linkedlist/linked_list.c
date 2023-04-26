/**
 * File: linked_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 在链表的节点 n0 之后插入节点 P */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* 删除链表的节点 n0 之后的首个节点 */
// 注意：stdio.h 占用了 remove 关键词
void removeNode(ListNode *n0) {
    if (!n0->next)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // 释放内存
    free(P);
}

/* 访问链表中索引为 index 的节点 */
ListNode *access(ListNode *head, int index) {
    while (head && head->next && index) {
        head = head->next;
        index--;
    }
    return head;
}

/* 在链表中查找值为 target 的首个节点 */
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
    /* 初始化链表 */
    // 初始化各个节点
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // 构建引用指向
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("初始化的链表为\r\n");
    printLinkedList(n0);

    /* 插入节点 */
    insert(n0, newListNode(0));
    printf("插入节点后的链表为\r\n");
    printLinkedList(n0);

    /* 删除节点 */
    removeNode(n0);
    printf("删除节点后的链表为\r\n");
    printLinkedList(n0);

    /* 访问节点 */
    ListNode *node = access(n0, 3);
    printf("链表中索引 3 处的节点的值 = %d\r\n", node->val);

    /* 查找节点 */
    int index = find(n0, 2);
    printf("链表中值为 2 的节点的索引 = %d\r\n", index);

    return 0;
}
