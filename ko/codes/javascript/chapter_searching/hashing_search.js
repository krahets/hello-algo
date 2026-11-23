/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* 해시 탐색(배열) */
function hashingSearchArray(map, target) {
    // 해시 테이블의 key: 목표 원소, value: 인덱스
    // 해시 테이블에 해당 key가 없으면 -1을 반환한다
    return map.has(target) ? map.get(target) : -1;
}

/* 해시 탐색(연결 리스트) */
function hashingSearchLinkedList(map, target) {
    // 해시 테이블의 key: 목표 노드의 값, value: 노드 객체
    // 해시 테이블에 해당 key가 없으면 null을 반환한다
    return map.has(target) ? map.get(target) : null;
}

/* 실행 코드 */
const target = 3;

/* 해시 탐색(배열) */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// 해시 테이블 초기화
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key: 원소, value: 인덱스
}
const index = hashingSearchArray(map, target);
console.log('목표 원소 3의 인덱스 = ' + index);

/* 해시 탐색(연결 리스트) */
let head = arrToLinkedList(nums);
// 해시 테이블 초기화
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key: 노드 값, value: 노드
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('목표 노드 값 3에 해당하는 노드 객체', node);
