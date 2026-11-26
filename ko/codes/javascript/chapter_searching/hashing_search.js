/**
 * File: hashing_search.js
 * Created Time: 2022-12-29
 * Author: Zhuo Qinyue (1403450829@qq.com)
 */

const { arrToLinkedList } = require('../modules/ListNode');

/* 배열에서의 해시 탐색 */
function hashingSearchArray(map, target) {
    // 해시 테이블의 key는 목표 원소, value는 인덱스다.
    // 해시 테이블에 해당 키가 없으면 -1을 반환한다.
    return map.has(target) ? map.get(target) : -1;
}

/* 연결 리스트에서의 해시 탐색 */
function hashingSearchLinkedList(map, target) {
    // 해시 테이블의 key는 찾을 노드의 값, value는 노드 객체다.
    // 해시 테이블에 해당 키가 없으면 null을 반환한다.
    return map.has(target) ? map.get(target) : null;
}

/* 실행 예제 */
const target = 3;

/* 배열에서의 해시 탐색 */
const nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
// 해시 테이블 초기화
const map = new Map();
for (let i = 0; i < nums.length; i++) {
    map.set(nums[i], i); // key는 원소, value는 인덱스다.
}
const index = hashingSearchArray(map, target);
console.log('목표 원소 3의 인덱스 = ' + index);

/* 연결 리스트에서의 해시 탐색 */
let head = arrToLinkedList(nums);
// 해시 테이블 초기화
const map1 = new Map();
while (head != null) {
    map1.set(head.val, head); // key는 노드의 값, value는 노드다.
    head = head.next;
}
const node = hashingSearchLinkedList(map1, target);
console.log('값이 3인 목표 노드의 객체 =', node);
