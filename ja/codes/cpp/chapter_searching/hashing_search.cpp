/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ハッシュ探索（配列） */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // ハッシュテーブルのキーは目標の要素、値はインデックス
    // このキーがハッシュテーブルになければ -1 を返す
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* ハッシュ探索（連結リスト） */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // ハッシュテーブルのキーは目標ノードの値、値はノードオブジェクト
    // このキーがハッシュテーブルになければ nullptr を返す
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* 実行例 */
int main() {
    int target = 3;

    /* ハッシュ探索（配列） */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // ハッシュテーブルを初期化する
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // キーは要素、値はインデックス
    }
    int index = hashingSearchArray(map, target);
    cout << "目標値 3 のインデックス = " << index << endl;

    /* ハッシュ探索（連結リスト） */
    ListNode *head = vecToLinkedList(nums);
    // ハッシュテーブルを初期化する
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // キーはノードの値、値はノード
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "目標値 3 に対応するノードオブジェクトは " << node << endl;

    return 0;
}
