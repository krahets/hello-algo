/**
 * File: linear_search.js
 * Created Time: 2022-12-22
 * Author: JoseHung (szhong@link.cuhk.edu.hk)
 */

const { ListNode, arrToLinkedList } = require('../modules/ListNode');

/* 배열에서의 선형 탐색 */
function linearSearchArray(nums, target) {
    // 배열을 순회한다.
    for (let i = 0; i < nums.length; i++) {
        // 목표 원소를 찾았으므로 그 인덱스를 반환한다.
        if (nums[i] === target) {
            return i;
        }
    }
    // 목표 원소를 찾지 못했으므로 -1을 반환한다.
    return -1;
}

/* 연결 리스트에서의 선형 탐색*/
function linearSearchLinkedList(head, target) {
    // 연결 리스트를 순회한다.
    while (head) {
        // 목표 노드를 찾았으므로 해당 노드를 반환한다.
        if (head.val === target) {
            return head;
        }
        head = head.next;
    }
    // 목표 노드를 찾지 못했으므로 null을 반환한다.
    return null;
}

/* 실행 예제 */
const target = 3;

/* 배열에서 선형 탐색 수행 */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
const index = linearSearchArray(nums, target);
console.log('목표 원소 3의 인덱스 = ' + index);

/* 연결 리스트에서 선형 탐색 수행 */
const head = arrToLinkedList(nums);
const node = linearSearchLinkedList(head, target);
console.log('값이 3인 목표 노드의 객체 = ', node);
