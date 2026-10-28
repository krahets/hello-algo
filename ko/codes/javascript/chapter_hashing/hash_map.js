/**
 * File: hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* 실행 코드 */
/* 해시 테이블 초기화 */
const map = new Map();

/* 추가 연산 */
// 해시 테이블에 (key, value) 키-값 쌍을 추가한다
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n추가를 마친 후의 해시 테이블\n키 -> 값');
console.info(map);

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻는다
let name = map.get(15937);
console.info('\n학번 15937을 입력하여 조회한 이름 ' + name);

/* 삭제 연산 */
// 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
map.delete(10583);
console.info('\n10583을 삭제한 후의 해시 테이블\n키 -> 값');
console.info(map);

/* 해시 테이블 순회 */
console.info('\n키-값 쌍(키->값) 순회');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\n키 Key만 순회');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n값 Value만 순회');
for (const v of map.values()) {
    console.info(v);
}
