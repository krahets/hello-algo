/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* 線形探索（配列）*/
function linearSearchArray(nums: number[], target: number): number {
    // 配列を走査する
    for (let i = 0; i < nums.length; i++) {
        // 目的の要素が見つかったので、そのインデックスを返す
        if (nums[i] === target) {
            return i;
        }
    }
    // 目的の要素が見つからなかったので、-1 を返す
    return -1;
}

/* 線形探索（連結リスト）*/
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
    // 連結リストを走査する
    while (head) {
        // 目的のノードが見つかったので、それを返す
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // 目的のノードが見つからなかったので、null を返す
    return null;
}

/* 実行用コード */
const target = 3;

/* 配列で線形探索を行う */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('目的の要素 3 のインデックス =', index);

/* 連結リストで線形探索を行う */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('目的のノードの値 3 に対応するノードオブジェクトは', node);

export {};
