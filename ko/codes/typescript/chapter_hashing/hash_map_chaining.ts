/**
 * File: hash_map_chaining.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com)
 */

/* 키-값 쌍 Number -> String */
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
    #size: number; // 키-값 쌍 개수
    #capacity: number; // 해시 테이블 용량
    #loadThres: number; // 용량 확장을 수행하는 적재율 임계값
    #extendRatio: number; // 용량 확장 배수
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

    /* 조회 연산 */
    get(key: number): string | null {
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
        for (const pair of bucket) {
            if (pair.key === key) {
                return pair.val;
            }
        }
        // key를 찾지 못하면 null을 반환한다
        return null;
    }

    /* 추가 연산 */
    put(key: number, val: string): void {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (this.#loadFactor() > this.#loadThres) {
            this.#extend();
        }
        const index = this.#hashFunc(key);
        const bucket = this.#buckets[index];
        // 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
        for (const pair of bucket) {
            if (pair.key === key) {
                pair.val = val;
                return;
            }
        }
        // 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
        const pair = new Pair(key, val);
        bucket.push(pair);
        this.#size++;
    }

    /* 삭제 연산 */
    remove(key: number): void {
        const index = this.#hashFunc(key);
        let bucket = this.#buckets[index];
        // 버킷을 순회하며 키-값 쌍을 삭제한다
        for (let i = 0; i < bucket.length; i++) {
            if (bucket[i].key === key) {
                bucket.splice(i, 1);
                this.#size--;
                break;
            }
        }
    }

    /* 해시 테이블 용량 확장 */
    #extend(): void {
        // 원래 해시 테이블을 임시로 저장한다
        const bucketsTmp = this.#buckets;
        // 용량을 확장한 새 해시 테이블을 초기화한다
        this.#capacity *= this.#extendRatio;
        this.#buckets = new Array(this.#capacity).fill(null).map((x) => []);
        this.#size = 0;
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

/* 실행 코드 */
/* 해시 테이블 초기화 */
const map = new HashMapChaining();

/* 추가 연산 */
// 해시 테이블에 (key, value) 키-값 쌍을 추가한다
map.put(12836, '小哈');
map.put(15937, '小啰');
map.put(16750, '小算');
map.put(13276, '小法');
map.put(10583, '小鸭');
console.log('\n추가를 마친 후의 해시 테이블\n키 -> 값');
map.print();

/* 조회 연산 */
// 해시 테이블에 키 key를 입력하여 값 value를 얻는다
const name = map.get(13276);
console.log('\n학번 13276을 입력하여 조회한 이름 ' + name);

/* 삭제 연산 */
// 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
map.remove(12836);
console.log('\n12836을 삭제한 뒤의 해시 테이블\n키 -> 값');
map.print();

export {};
