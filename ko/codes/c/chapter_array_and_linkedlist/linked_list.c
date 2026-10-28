/**
 * File: linked_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
// 주의: stdio.h가 remove라는 이름을 사용한다
void removeItem(ListNode *n0) {
    if (!n0->next)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // 메모리 해제
    free(P);
}

/* 연결 리스트에서 인덱스가 index인 노드에 접근 */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == NULL)
            return NULL;
        head = head->next;
    }
    return head;
}

/* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
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

/* 실행 코드 */
int main() {
    /* 연결 리스트 초기화 */
    // 각 노드를 초기화한다
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // 노드 사이의 참조를 설정한다
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("초기화한 연결 리스트\r\n");
    printLinkedList(n0);

    /* 노드 삽입 */
    insert(n0, newListNode(0));
    printf("노드를 삽입한 뒤의 연결 리스트\r\n");
    printLinkedList(n0);

    /* 노드 삭제 */
    removeItem(n0);
    printf("노드를 삭제한 뒤의 연결 리스트\r\n");
    printLinkedList(n0);

    /* 노드 접근 */
    ListNode *node = access(n0, 3);
    printf("연결 리스트에서 인덱스 3의 노드 값 = %d\r\n", node->val);

    /* 노드 탐색 */
    int index = find(n0, 2);
    printf("연결 리스트에서 값이 2인 노드의 인덱스 = %d\r\n", index);

    // 메모리 해제
    freeMemoryLinkedList(n0);
    return 0;
}
