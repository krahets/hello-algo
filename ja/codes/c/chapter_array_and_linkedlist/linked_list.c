/**
 * File: linked_list.c
 * Created Time: 2023-01-12
 * Author: Zero (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 連結リストでノード n0 の後ろにノード P を挿入する */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* 連結リストでノード n0 の直後のノードを削除する */
// 注意: stdio.h が remove 識別子を使用している
void removeItem(ListNode *n0) {
    if (!n0->next)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // メモリを解放する
    free(P);
}

/* 連結リスト内で index 番目のノードにアクセス */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == NULL)
            return NULL;
        head = head->next;
    }
    return head;
}

/* 連結リストで値が target の最初のノードを探す */
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
    /* 連結リストを初期化 */
    // 各ノードを初期化
    ListNode *n0 = newListNode(1);
    ListNode *n1 = newListNode(3);
    ListNode *n2 = newListNode(2);
    ListNode *n3 = newListNode(5);
    ListNode *n4 = newListNode(4);
    // ノード間の参照を構築する
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    printf("初期化後の連結リストは\r\n");
    printLinkedList(n0);

    /* ノードを挿入 */
    insert(n0, newListNode(0));
    printf("ノード挿入後の連結リストは\r\n");
    printLinkedList(n0);

    /* ノードを削除 */
    removeItem(n0);
    printf("ノード削除後の連結リストは\r\n");
    printLinkedList(n0);

    /* ノードにアクセス */
    ListNode *node = access(n0, 3);
    printf("連結リストのインデックス 3 にあるノードの値 = %d\r\n", node->val);

    /* ノードを探索 */
    int index = find(n0, 2);
    printf("連結リスト内で値が 2 のノードのインデックス = %d\r\n", index);

    // メモリを解放する
    freeMemoryLinkedList(n0);
    return 0;
}
