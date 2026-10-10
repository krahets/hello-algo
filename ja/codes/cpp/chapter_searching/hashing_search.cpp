/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ハッシュ探索（配列） */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // ハッシュテーブルの key: 目標要素、value: インデックス
    // ハッシュテーブルにこの key がなければ -1 を返す
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* ハッシュ探索（連結リスト） */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // ハッシュテーブルの key: 対象ノードの値、value: ノードオブジェクト
    // ハッシュテーブルにその key がなければ nullptr を返す
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* Driver Code */
int main() {
    int target = 3;

    /* ハッシュ探索（配列） */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // ハッシュテーブルを初期化
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // key: 要素、value: インデックス
    }
    int index = hashingSearchArray(map, target);
    cout << "対象要素 3 のインデックス = " << index << endl;

    /* ハッシュ探索（連結リスト） */
    ListNode *head = vecToLinkedList(nums);
    // ハッシュテーブルを初期化
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // key: ノード値、value: ノード
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "対象ノード値 3 に対応するノードオブジェクトは " << node << endl;

    return 0;
}
