/**
 * File: hash_map_open_addressing.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
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

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    private size: number; // 키-값 쌍 개수
    private capacity: number; // 해시 테이블 용량
    private loadThres: number; // 용량 확장을 수행하는 적재율 임계값
    private extendRatio: number; // 용량 확장 배수
    private buckets: Array<Pair | null>; // 버킷 배열
    private TOMBSTONE: Pair; // 삭제 표시

    /* 생성자 */
    constructor() {
        this.size = 0; // 키-값 쌍 개수
        this.capacity = 4; // 해시 테이블 용량
        this.loadThres = 2.0 / 3.0; // 용량 확장을 수행하는 적재율 임계값
        this.extendRatio = 2; // 용량 확장 배수
        this.buckets = Array(this.capacity).fill(null); // 버킷 배열
        this.TOMBSTONE = new Pair(-1, '-1'); // 삭제 표시
    }

    /* 해시 함수 */
    private hashFunc(key: number): number {
        return key % this.capacity;
    }

    /* 적재율 */
    private loadFactor(): number {
        return this.size / this.capacity;
    }

    /* key에 해당하는 버킷 인덱스 탐색 */
    private findBucket(key: number): number {
        let index = this.hashFunc(key);
        let firstTombstone = -1;
        // 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
        while (this.buckets[index] !== null) {
            // key를 만나면 해당 버킷 인덱스를 반환한다
            if (this.buckets[index]!.key === key) {
                // 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
                if (firstTombstone !== -1) {
                    this.buckets[firstTombstone] = this.buckets[index];
                    this.buckets[index] = this.TOMBSTONE;
                    return firstTombstone; // 옮긴 후의 버킷 인덱스를 반환한다
                }
                return index; // 버킷 인덱스를 반환한다
            }
            // 처음 만난 삭제 표시를 기록한다
            if (
                firstTombstone === -1 &&
                this.buckets[index] === this.TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
            index = (index + 1) % this.capacity;
        }
        // key가 없으면 추가할 위치의 인덱스를 반환한다
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 조회 연산 */
    get(key: number): string | null {
        // key에 해당하는 버킷 인덱스 탐색
        const index = this.findBucket(key);
        // 키-값 쌍을 찾으면 해당 val을 반환한다
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            return this.buckets[index]!.val;
        }
        // 키-값 쌍이 없으면 null을 반환한다
        return null;
    }

    /* 추가 연산 */
    put(key: number, val: string): void {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (this.loadFactor() > this.loadThres) {
            this.extend();
        }
        // key에 해당하는 버킷 인덱스 탐색
        const index = this.findBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index]!.val = val;
            return;
        }
        // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
        this.buckets[index] = new Pair(key, val);
        this.size++;
    }

    /* 삭제 연산 */
    remove(key: number): void {
        // key에 해당하는 버킷 인덱스 탐색
        const index = this.findBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index] = this.TOMBSTONE;
            this.size--;
        }
    }

    /* 해시 테이블 용량 확장 */
    private extend(): void {
        // 원래 해시 테이블을 임시로 저장한다
        const bucketsTmp = this.buckets;
        // 용량을 확장한 새 해시 테이블을 초기화한다
        this.capacity *= this.extendRatio;
        this.buckets = Array(this.capacity).fill(null);
        this.size = 0;
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
        for (const pair of bucketsTmp) {
            if (pair !== null && pair !== this.TOMBSTONE) {
                this.put(pair.key, pair.val);
            }
        }
    }

    /* 해시 테이블 출력 */
    print(): void {
        for (const pair of this.buckets) {
            if (pair === null) {
                console.log('null');
            } else if (pair === this.TOMBSTONE) {
                console.log('TOMBSTONE');
            } else {
                console.log(pair.key + ' -> ' + pair.val);
            }
        }
    }
}

/* 실행 코드 */
// 해시 테이블 초기화
const hashmap = new HashMapOpenAddressing();

// 추가 연산
// 해시 테이블에 키-값 쌍 (key, val)을 추가한다
hashmap.put(12836, '小哈');
hashmap.put(15937, '小啰');
hashmap.put(16750, '小算');
hashmap.put(13276, '小法');
hashmap.put(10583, '小鸭');
console.log('\n추가를 마친 후의 해시 테이블\n키 -> 값');
hashmap.print();

// 조회 연산
// 해시 테이블에 키 key를 입력하여 값 val을 얻는다
const name = hashmap.get(13276);
console.log('\n학번 13276을 입력하여 조회한 이름 ' + name);

// 삭제 연산
// 해시 테이블에서 키-값 쌍 (key, val)을 삭제한다
hashmap.remove(16750);
console.log('\n16750을 삭제한 후의 해시 테이블\n키 -> 값');
hashmap.print();

export {};
