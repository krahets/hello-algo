/**
 * File: linear_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

const { ListNode, arrToLinkedList } = require('../modules/ListNode');

/* 線形探索（配列） */
function linearSearchArray(nums, target) {
    // 配列を走査
    for (let i = 0; i < nums.length; i++) {
        // 目標要素が見つかったらそのインデックスを返す
        if (nums[i] === target) {
            return i;
        }
    }
    // 目標要素が見つからなければ -1 を返す
    return -1;
}

/* 線形探索（連結リスト） */
function linearSearchLinkedList(head, target) {
    // 連結リストを走査
    while (head) {
        // 対象ノードが見つかったら、それを返す
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // 対象ノードが見つからない場合は null を返す
    return null;
}

/* Driver Code */
const target = 3;

/* 配列で線形探索を行う */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('目標要素 3 のインデックス = ' + index);

/* 連結リストで線形探索を行う */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('目標ノード値 3 に対応するノードオブジェクトは ', node);
