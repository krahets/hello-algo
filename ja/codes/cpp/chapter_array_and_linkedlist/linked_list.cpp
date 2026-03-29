/**
 * File: linked_list.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 連結リストでノード n0 の後ろにノード P を挿入する */
void insert(ListNode *n0, ListNode *P) {
    ListNode *n1 = n0->next;
    P->next = n1;
    n0->next = P;
}

/* 連結リストでノード n0 の直後のノードを削除する */
void remove(ListNode *n0) {
    if (n0->next == nullptr)
        return;
    // n0 -> P -> n1
    ListNode *P = n0->next;
    ListNode *n1 = P->next;
    n0->next = n1;
    // メモリを解放する
    delete P;
}

/* 連結リスト内で index 番目のノードにアクセス */
ListNode *access(ListNode *head, int index) {
    for (int i = 0; i < index; i++) {
        if (head == nullptr)
            return nullptr;
        head = head->next;
    }
    return head;
}

/* 連結リストで値が target の最初のノードを探す */
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

/* Driver Code */
int main() {
    /* 連結リストを初期化 */
    // 各ノードを初期化
    ListNode *n0 = new ListNode(1);
    ListNode *n1 = new ListNode(3);
    ListNode *n2 = new ListNode(2);
    ListNode *n3 = new ListNode(5);
    ListNode *n4 = new ListNode(4);
    // ノード間の参照を構築する
    n0->next = n1;
    n1->next = n2;
    n2->next = n3;
    n3->next = n4;
    cout << "初期化した連結リストは" << endl;
    printLinkedList(n0);

    /* ノードを挿入 */
    insert(n0, new ListNode(0));
    cout << "ノード挿入後の連結リストは" << endl;
    printLinkedList(n0);

    /* ノードを削除 */
    remove(n0);
    cout << "ノード削除後の連結リストは" << endl;
    printLinkedList(n0);

    /* ノードにアクセス */
    ListNode *node = access(n0, 3);
    cout << "連結リストのインデックス 3 のノードの値 = " << node->val << endl;

    /* ノードを探索 */
    int index = find(n0, 2);
    cout << "連結リスト内で値が 2 のノードのインデックス = " << index << endl;

    // メモリを解放する
    freeMemoryLinkedList(n0);

    return 0;
}
