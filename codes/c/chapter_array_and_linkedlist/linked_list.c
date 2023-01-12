/**
 * File: linked_list.c
 * Created Time: 2022-01-12
 * Author: Zero (glj0@outlook.com)
 */

 #include "../include/include.h"

 /* 在链表的结点 n0 之后插入结点 P */
void insertNode(ListNode* n0, ListNode* P) {
    ListNode *n1;
    n1 = n0 -> next;
    n0 -> next = P;
    P -> next = n1;
}

/* 删除链表的结点 n0 之后的首个结点 */
void removeNode(ListNode* n0) {
    // n0 -> P -> n1
    ListNode *n1, *P;
    P = n0 -> next;
    n1 = P -> next;
    n0 -> next = n1;

    free(P);
}

/* 访问链表中索引为 index 的结点 */
ListNode* accessNode(ListNode* head, int index) {
    ListNode* n;
    while(head && head->next && index) {
        head = head->next;
        index --;
    }
    n = head;
}

/* 在链表中查找值为 target 的首个结点 */
int findNode(ListNode* head, int target) {
    ListNode* n;
    int idx=0;
    while(head) {
        if(head->val == target) {
            return idx;
        }
        head = head -> next;
        idx ++;
    }
    return -1;
}


/* Driver Code */
int main() {
    /* 初始化链表 */
    // 初始化各个结点 
    ListNode* n0 = newListNode(1);
    ListNode* n1 = newListNode(2);
    ListNode* n2 = newListNode(3);
    ListNode* n3 = newListNode(4);
    ListNode* n4 = newListNode(5);
    // 构建引用指向
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("初始化的链表为\r\n"); 
    printLinkedList(n0);

    /* 插入结点 */
    insertNode(n0, newListNode(0));
    printf("插入结点后的链表为\r\n");
    printLinkedList(n0);

    /* 删除结点 */
    removeNode(n0);
    printf("删除结点后的链表为\r\n");
    printLinkedList(n0);

    /* 访问结点 */
    ListNode* node = accessNode(n0, 3);
    printf("链表中索引 3 处的结点的值 = %d\r\n", node->val);

    /* 查找结点 */
    int index = findNode(n0, 5);
    printf("链表中值为 5 的结点的索引 = %d\r\n", index);

    return 0;
}
