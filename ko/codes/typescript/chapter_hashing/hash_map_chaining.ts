/**
 * File: hash_map_chaining.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* Number -> String 키-값 쌍 */
class Pair {
    key: number;
    val: string;
    constructor(key: number, val: string) {
        this.key = key;
        this.val = val;
    }
}

/* 체이닝 해시 테이블 */
class HashMapChaining {
    #size: number; // 키-값 쌍의 개수
    #capacity: number; // 해시 테이블의 용량
    #loadThres: number; // 용량을 늘리는 기준이 되는 적재율
    #extendRatio: number; // 용량 증가 배수
    #buckets: Pair[][]; // 버킷 배열

    /* 생성자 */
    constructor() {
        this.#size = 0;
        this.#capacity = 4;
        this.#loadThres = 2.0 / 3.0;
        this.#extendRatio = 2;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
    }

    /* 해시 함수 */
    #hashFunc(key: number): number {
        return key % this.#capacity;
    }

    /* 적재율 */
    #loadFactor(): number {
        return this.#size / this.#capacity;
    }

    /* 조회 */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 버킷을 순회하다가 key를 찾으면 해당 val 반환
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // key를 찾지 못하면 null 반환
        return null;
    }

    /* 추가 */
    put(key: number, val: string): void {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* 삭제 */
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // 버킷을 순회하며 해당 키-값 쌍 삭제
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* 해시 테이블 용량 늘리기 */
    #extend(): void {
        // 기존 해시 테이블 임시 보관
        const bucketsTmp = this.#buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        for (const bucket of bucketsTmp) {
            for (const pair of bucket) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* 해시 테이블 출력 */
    print(): void {
        for (const bucket of this.#buckets) {
            let res = [];
            for (const pair of bucket) {
                res.push(pair.key + ' -> ' + pair.val);
            }
            console.log(res);
        }
    }
}

/* 실행 예제 */
/* 해시 테이블 초기화 */
const map = new HashMapChaining();

/* 추가 */
// 해시 테이블에 키-값 쌍 (key, value) 추가
map.put(12836, '샤오하');
map.put(15937, '샤오뤄');
map.put(16750, '샤오쑤안');
map.put(13276, '샤오파');
map.put(10583, '샤오야');
console.log('\n추가 후 해시 테이블\nKey -> Value');
map.print();

/* 조회 */
// 해시 테이블에 키 key를 입력하여 값 value 조회
const name = map.get(13276);
console.log('\n학번 13276으로 조회한 이름: ' + name);

/* 삭제 */
// 해시 테이블에서 키-값 쌍 (key, value) 삭제
map.remove(12836);
console.log('\n키 12836 삭제 후 해시 테이블\nKey -> Value');
map.print();

export {};
