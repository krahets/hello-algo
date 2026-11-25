/**
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* 실행 예제 */
/* 해시 테이블 초기화 */
const map = new Map<number, string>();

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.set(12836, '샤오하');
map.set(15937, '샤오뤄');
map.set(16750, '샤오쑤안');
map.set(13276, '샤오파');
map.set(10583, '샤오야');
console.info('\n추가 후 해시 테이블\nKey -> Value');
console.info(map);

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
let name = map.get(15937);
console.info('\n학번 15937로 조회한 이름: ' + name);

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.delete(10583);
console.info('\n키 10583 삭제 후 해시 테이블\nKey -> Value');
console.info(map);

/* 해시 테이블 순회 */
console.info('\n키-값 쌍 순회 Key->Value');
for (const [k, v] of map.entries()) {
    console.info(k + ' -> ' + v);
}
console.info('\n키만 순회 Key');
for (const k of map.keys()) {
    console.info(k);
}
console.info('\n값만 순회 Value');
for (const v of map.values()) {
    console.info(v);
}

export {};
