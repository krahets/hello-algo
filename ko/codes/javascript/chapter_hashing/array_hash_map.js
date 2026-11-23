/**
 * File: array_hash_map.js
 * Created Time: 2022-12-26
 * Author: Justin (xiefahit@gmail.com)
 */

/* 키-값 쌍 Number -> String */
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
        // 버킷 100개를 포함하는 배열을 초기화한다
        this.#buckets = new Array(100).fill(null);
    }

    /* 해시 함수 */
    #hashFunc(key) {
        return key % 100;
    }

    /* 조회 연산 */
    get(key) {
        let index = this.#hashFunc(key);
        let pair = this.#buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* 추가 연산 */
    set(key, val) {
        let index = this.#hashFunc(key);
        this.#buckets[index] = new Pair(key, val);
    }

    /* 삭제 연산 */
    delete(key) {
        let index = this.#hashFunc(key);
        // null로 설정하여 삭제를 나타낸다
        this.#buckets[index] = null;
    }

    /* 모든 키-값 쌍 반환 */
    entries() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i]);
            }
        }
        return arr;
    }

    /* 모든 키 반환 */
    keys() {
        let arr = [];
        for (let i = 0; i < this.#buckets.length; i++) {
            if (this.#buckets[i]) {
                arr.push(this.#buckets[i].key);
            }
        }
        return arr;
    }

    /* 모든 값 반환 */
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

/* 실행 코드 */
/* 해시 테이블 초기화 */
const map = new ArrayHashMap();
/* 추가 연산 */
// 해시 테이블에 (key, value) 키-값 쌍을 추가한다
map.set(12836, '小哈');
map.set(15937, '小啰');
map.set(16750, '小算');
map.set(13276, '小法');
map.set(10583, '小鸭');
console.info('\n추가를 마친 후의 해시 테이블\n키 -> 값');
map.print();

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻는다
let name = map.get(15937);
console.info('\n학번 15937을 입력하여 조회한 이름 ' + name);

/* 삭제 연산 */
// 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
map.delete(10583);
console.info('\n10583을 삭제한 후의 해시 테이블\n키 -> 값');
map.print();

/* 해시 테이블 순회 */
console.info('\n키-값 쌍(키->값) 순회');
for (const pair of map.entries()) {
    if (!pair) continue;
    console.info(pair.key + ' -> ' + pair.val);
}
console.info('\n키 Key만 순회');
for (const key of map.keys()) {
    console.info(key);
}
console.info('\n값 Value만 순회');
for (const val of map.values()) {
    console.info(val);
}
