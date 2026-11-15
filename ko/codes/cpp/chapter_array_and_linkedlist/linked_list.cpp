/**
 * File: linked_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 연결 리스트의 노드 n0 뒤에 노드 P 삽입 */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* 연결 리스트의 노드 n0 바로 뒤에 있는 노드 삭제 */
void remove(ListNode *n0) {
    if (n0->next == nullptr)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // 메모리 해제
    delete P;
}

/* 연결 리스트에서 인덱스가 index인 노드에 접근 */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == nullptr)
            return nullptr;
        head = head->next;
    }
    return head;
}

/* 연결 리스트에서 값이 target인 첫 번째 노드 탐색 */
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

/* 실행 코드 */
int main() {
    /* 연결 리스트 초기화 */
    // 각 노드를 초기화한다
    ListNode *n0 = new ListNode(1);
    ListNode *n1 = new ListNode(3);
    ListNode *n2 = new ListNode(2);
    ListNode *n3 = new ListNode(5);
    ListNode *n4 = new ListNode(4);
    // 노드 사이의 참조를 설정한다
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    cout << "초기화한 연결 리스트" << endl;
    printLinkedList(n0);

    /* 노드 삽입 */
    insert(n0, new ListNode(0));
    cout << "노드를 삽입한 후의 연결 리스트" << endl;
    printLinkedList(n0);

    /* 노드 삭제 */
    remove(n0);
    cout << "노드를 삭제한 후의 연결 리스트" << endl;
    printLinkedList(n0);

    /* 노드 접근 */
    ListNode *node = access(n0, 3);
    cout << "연결 리스트에서 인덱스 3에 있는 노드의 값 = " << node->val << endl;

    /* 노드 탐색 */
    int index = find(n0, 2);
    cout << "연결 리스트에서 값이 2인 노드의 인덱스 = " << index << endl;

    // 메모리 해제
    freeMemoryLinkedList(n0);

    return 0;
}
