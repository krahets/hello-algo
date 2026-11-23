/**
 * File: linear_search.ts
 * Created Time: 2023-01-07
 * Author: Daniel (better.sunjian@gmail.com)
 */

import { ListNode, arrToLinkedList } from '../modules/ListNode';

/* 선형 탐색(배열)*/
function linearSearchArray(nums: number[], target: number): number {
    // 배열 순회
    for (let i = 0; i < nums.length; i++) {
        // 목표 원소를 찾았으므로 해당 인덱스를 반환한다
        if (nums[i] === target) {
            return i;
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다
    return -1;
}

/* 선형 탐색(연결 리스트)*/
function linearSearchLinkedList(
    head: ListNode | null,
    target: number
): ListNode | null {
    // 연결 리스트 순회
    while (head) {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // 목표 노드를 찾지 못했으므로 null을 반환한다
    return null;
}

/* 실행 코드 */
const target = 3;

/* 배열에서 선형 탐색을 수행한다 */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('목표 원소 3의 인덱스 =', index);

/* 연결 리스트에서 선형 탐색을 수행한다 */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('목표 노드 값 3에 해당하는 노드 객체', node);

export {};
