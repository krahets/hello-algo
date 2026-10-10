/**
 * File: linear_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 線形探索（配列） */
int linearSearchArray(vector<int> &nums, int target) {
    // 配列を走査
    for (int i = 0; i < nums.size(); i++) {
        // 目標要素が見つかったらそのインデックスを返す
        if (nums[i] == target)
            return i;
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

/* 線形探索（連結リスト） */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // 連結リストを走査
    while (head != nullptr) {
        // 対象ノードが見つかったら、それを返す
        if (head->val == target)
            return head;
        head = head->next;
    }
    // 対象ノードが見つからない場合は `nullptr` を返す
    return nullptr;
}

/* Driver Code */
int main() {
    int target = 3;

    /* 配列で線形探索を行う */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "対象要素 3 のインデックス = " << index << endl;

    /* 連結リストで線形探索を行う */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "対象ノード値 3 に対応するノードオブジェクトは " << node << endl;

    return 0;
}
