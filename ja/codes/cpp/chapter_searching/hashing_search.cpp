/**
 * File: hashing_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* ハッシュ探索（配列） */
int hashingSearchArray(unordered_map<int, int> map, int target) {
    // ハッシュテーブルのキー：ターゲット要素、値：インデックス
    // ハッシュテーブルにこのキーが含まれていない場合、-1を返す
    if (map.find(target) == map.end())
        return -1;
    return map[target];
}

/* ハッシュ探索（連結リスト） */
ListNode *hashingSearchLinkedList(unordered_map<int, ListNode *> map, int target) {
    // ハッシュテーブルのキー：ターゲットノード値、値：ノードオブジェクト
    // キーがハッシュテーブルにない場合、nullptrを返す
    if (map.find(target) == map.end())
        return nullptr;
    return map[target];
}

/* ドライバコード */
int main() {
    int target = 3;

    /* ハッシュ探索（配列） */
    vector<int> nums = {1, 5, 3, 2, 4, 7, 5, 9, 10, 8};
    // ハッシュテーブルを初期化
    unordered_map<int, int> map;
    for (int i = 0; i < nums.size(); i++) {
        map[nums[i]] = i; // キー：要素、値：インデックス
    }
    int index = hashingSearchArray(map, target);
    cout << "ターゲット要素3のインデックスは " << index << " です" << endl;

    /* ハッシュ探索（連結リスト） */
    ListNode *head = vecToLinkedList(nums);
    // ハッシュテーブルを初期化
    unordered_map<int, ListNode *> map1;
    while (head != nullptr) {
        map1[head->val] = head; // キー：ノード値、値：ノード
        head = head->next;
    }
    ListNode *node = hashingSearchLinkedList(map1, target);
    cout << "ターゲットノード値3に対応するノードオブジェクトは " << node << " です" << endl;

    return 0;
}