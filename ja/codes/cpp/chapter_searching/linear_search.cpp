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
        // ターゲット要素が見つかったため、そのインデックスを返す
        if (nums[i] == target)
            return i;
    }
    // ターゲット要素が見つからなかったため、-1を返す
    return -1;
}

/* 線形探索（連結リスト） */
ListNode *linearSearchLinkedList(ListNode *head, int target) {
    // リストを走査
    while (head != nullptr) {
        // ターゲットノードが見つかった場合、それを返す
        if (head->val == target)
            return head;
        head = head->next;
    }
    // ターゲットノードが見つからない場合、nullptrを返す
    return nullptr;
}

/* ドライバコード */
int main() {
    int target = 3;

    /* 配列で線形探索を実行 */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    int index = linearSearchArray(nums, target);
    cout << "ターゲット要素3のインデックスは " << index << " です" << endl;

    /* 連結リストで線形探索を実行 */
    ListNode *head = vecToLinkedList(nums);
    ListNode *node = linearSearchLinkedList(head, target);
    cout << "ターゲットノード値3に対応するノードオブジェクトは " << node << " です" << endl;

    return 0;
}