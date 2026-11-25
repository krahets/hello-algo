/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* Number -> String 키-값 쌍 */
class Pair {
    constructor(key, val) {
        this.key = key;
        this.val = val;
    }
}

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
    #buckets;
    constructor() {
        // 버킷 100개로 배열 초기화
        this.#buckets = new Array(100).fill(null);
    }

    /* 해시 함수 */
    #hashFunc(key) {
        return key % 100;
    }

    /* 조회 */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* 추가 */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* 삭제 */
    delete(key) {
        let index = this.#hashFunc(key);
        // null로 설정하여 삭제를 나타냄
        this.#buckets[index] = null;
    }

    /* 모든 키-값 쌍 가져오기 */
    entries() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i]);
            }
        }
        return arr;
    }

    /* 모든 키 가져오기 */
    keys() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].key);
            }
        }
        return arr;
    }

    /* 모든 값 가져오기 */
    values() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].val);
            }
        }
        return arr;
    }

    /* 해시 테이블 출력 */
    print() {
        let pairSet = this.entries();
        for (const pair of pairSet) {
            console.info(`${pair.key} -> ${pair.val}`);
        }
    }
}

/* 실행 예제 */
/* 해시 테이블 초기화 */
const map = new ArrayHashMap();
/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.set(12836, '샤오하');
map.set(15937, '샤오뤄');
map.set(16750, '샤오쑤안');
map.set(13276, '샤오파');
map.set(10583, '샤오야');
console.info('\n추가 후 해시 테이블\nKey -> Value');
map.print();

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
let name = map.get(15937);
console.info('\n학번 15937로 조회한 이름: ' + name);

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.delete(10583);
console.info('\n키 10583 삭제 후 해시 테이블\nKey -> Value');
map.print();

/* 해시 테이블 순회 */
console.info('\n키-값 쌍 순회 Key->Value');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\n키만 순회 Key');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\n값만 순회 Value');
for (const val of map.values()) {
    console.info(val);
}
