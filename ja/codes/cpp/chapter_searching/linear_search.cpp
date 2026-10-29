/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 線形探索（配列） */
int linearSearchArray(vector<int> &nums, int target) {
    // 配列を走査する
    for (int i = 0; i < nums.size(); i++) {
        // 目的の要素が見つかったので、そのインデックスを返す
        if (nums[i] == target)
            return i;
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 線形探索（連結リスト） */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // 連結リストを走査する
    while (head != nullptr) {
        // 目的のノードが見つかったので、それを返す
        if (head->val == target)
            return head;
        head = head->next;
    }
    // 目的のノードが見つからなかったので、nullptr を返す
    return nullptr;
}

/* 実行用コード */
int main() {
    int target = 3;

    /* 配列で線形探索を行う */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "目的の要素 3 のインデックス = " << index << endl;

    /* 連結リストで線形探索を行う */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "目的のノードの値 3 に対応するノードオブジェクトは " << node << endl;

    return 0;
}
