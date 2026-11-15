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

/* 연결 리스트 노드 구조체 */
typedef struct ListNode {
    int val;               // 노드 값
    struct ListNode *next; // 다음 노드를 가리키는 참조
} ListNode;

/* 생성자: 새 노드를 초기화한다 */
ListNode *newListNode(int val) {
    ListNode *node;
    node = (ListNode *)malloc(sizeof(ListNode));
    node->val = val;
    node->next = NULL;
    return node;
}

/* 배열을 역직렬화하여 연결 리스트로 변환한다 */
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

/* 연결 리스트에 할당한 메모리 공간을 해제한다 */
void freeMemoryLinkedList(ListNode *cur) {
    // 메모리 해제
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
