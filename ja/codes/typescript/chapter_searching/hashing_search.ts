/**
 * File: hashing_search.ts
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* ハッシュ探索（配列） */
function hashingSearchArray(map: Map<number, number>, target: number): number {
    // ハッシュテーブルのキーは目標の要素、値はインデックス
    // このキーがハッシュテーブルになければ -1 を返す
    return map.has(target) ? (map.get(target) as number) : -1;
}

/* ハッシュ探索（連結リスト） */
function hashingSearchLinkedList(
    map: Map<number, ListNode>,
    target: number
): ListNode | null {
    // ハッシュテーブルのキーは目標ノードの値、値はノードオブジェクト
    // このキーがハッシュテーブルになければ null を返す
    return map.has(target) ? (map.get(target) as ListNode) : null;
}

/* 実行例 */
const target = 3;

/* ハッシュ探索（配列） */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// ハッシュテーブルを初期化する
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // キーは要素、値はインデックス
}
const index = hashingSearchArray(map, target);
console.log('目標値 3 のインデックス = ' + index);

/* ハッシュ探索（連結リスト） */
let head = arrToLinkedList(nums);
// ハッシュテーブルを初期化する
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // キーはノードの値、値はノード
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('目標値 3 に対応するノードオブジェクトは', node);

export {};
