/**
 * File: array_hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

/* Number -> String 키-값 쌍 */
class Pair {
    public key: number;
    public val: string;

    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
    private readonly buckets: (Pair | null)[];

    constructor() {
        // 버킷 100개로 배열 초기화
        this.buckets = new Array(100).fill(null);
    }

    /* 해시 함수 */
    private hashFunc(key: number): number {
        return key % 100;
    }

    /* 조회 */
    public get(key: number): string | null {
        let index = this.hashFunc(key);
        let pair = this.buckets[index];
        if (pair === null) return null;
        return pair.val;
    }

    /* 추가 */
    public set(key: number, val: string) {
        let index = this.hashFunc(key);
        this.buckets[index] = new Pair(key, val);
    }

    /* 삭제 */
    public delete(key: number) {
        let index = this.hashFunc(key);
        // null로 설정하여 삭제를 나타냄
        this.buckets[index] = null;
    }

    /* 모든 키-값 쌍 가져오기 */
    public entries(): (Pair | null)[] {
        let arr: (Pair | null)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i]);
            }
        }
        return arr;
    }

    /* 모든 키 가져오기 */
    public keys(): (number | undefined)[] {
        let arr: (number | undefined)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i].key);
            }
        }
        return arr;
    }

    /* 모든 값 가져오기 */
    public values(): (string | undefined)[] {
        let arr: (string | undefined)[] = [];
        for (let i = 0; i < this.buckets.length; i++) {
            if (this.buckets[i]) {
                arr.push(this.buckets[i].val);
            }
        }
        return arr;
    }

    /* 해시 테이블 출력 */
    public print() {
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

export {};
