/**
 * File: linear_search.c
 * Created Time: 2023-03-19
 * Author: Guanngxu (446678850@qq.com)
 */

#include "../utils/common.h"

/* 线性查找（数组） */
int linearSearchArray(int *nums, int len, int target) {
    // 遍历数组
    for (int i = 0; i < len; i++) {
        // 找到目标元素，返回其索引
        if (nums[i] == target)
            return i;
    }
    // 未找到目标元素，返回 -1
    return -1;
}

/* 线性查找（链表） */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // 遍历链表
    while (head != NULL) {
        // 找到目标节点，返回之
        if (head->val == target)
            return head;
        head = head->next;
    }
    // 未找到目标节点，返回 NULL
    return NULL;
}

/* Driver Code */
int main() {
    int target = 3;

    /* 在数组中执行线性查找 */
    int nums[10] = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, 10, target);
    printf("目标元素 3 的索引 = %d\n", index);

    /* 在链表中执行线性查找 */
    ListNode *head = arrToLinkedList(nums, 10);
    ListNode *node = linearSearchLinkedList(head, target);
    if (node == NULL) {
        printf("目标节点值 3 的对应节点对象为 NULL\n");
    } else {
        printf("目标节点值 3 的对应节点对象为 addr: %p val: %d\n", node, node->val);
    }

    return 0;
}
