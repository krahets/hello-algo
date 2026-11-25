/**
 * File: hash_map_open_addressing.ts
 * Created Time: 2023-08-06
 * Author: yuan0221 (yl1452491917@gmail.com), krahets (krahets@163.com)
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

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    private size: number; // 키-값 쌍의 개수
    private capacity: number; // 해시 테이블의 용량
    private loadThres: number; // 용량을 늘리는 기준이 되는 적재율
    private extendRatio: number; // 용량 증가 배수
    private buckets: Array<Pair | null>; // 버킷 배열
    private TOMBSTONE: Pair; // 삭제 표시

    /* 생성자 */
    constructor() {
        this.size = 0; // 키-값 쌍의 개수
        this.capacity = 4; // 해시 테이블의 용량
        this.loadThres = 2.0 / 3.0; // 용량을 늘리는 기준이 되는 적재율
        this.extendRatio = 2; // 용량 증가 배수
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

    /* key에 해당하는 버킷 인덱스 찾기 */
    private findBucket(key: number): number {
        let index = this.hashFunc(key);
        let firstTombstone = -1;
        // 선형 탐사 중 빈 버킷을 만나면 반복 종료
        while (this.buckets[index] !== null) {
            // key를 만나면 해당 버킷 인덱스 반환
            if (this.buckets[index]!.key === key) {
                // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if (firstTombstone !== -1) {
                    this.buckets[firstTombstone] = this.buckets[index];
                    this.buckets[index] = this.TOMBSTONE;
                    return firstTombstone; // 옮긴 뒤의 버킷 인덱스 반환
                }
                return index; // 버킷 인덱스 반환
            }
            // 처음 만난 삭제 표시의 위치 기록
            if (
                firstTombstone === -1 &&
                this.buckets[index] === this.TOMBSTONE
            ) {
                firstTombstone = index;
            }
            // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % this.capacity;
        }
        // key가 없으면 삽입할 위치의 인덱스 반환
        return firstTombstone === -1 ? index : firstTombstone;
    }

    /* 조회 */
    get(key: number): string | null {
        // key에 해당하는 버킷 인덱스 찾기
        const index = this.findBucket(key);
        // 키-값 쌍을 찾으면 해당 val 반환
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            return this.buckets[index]!.val;
        }
        // 키-값 쌍이 없으면 null 반환
        return null;
    }

    /* 추가 */
    put(key: number, val: string): void {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (this.loadFactor() > this.loadThres) {
            this.extend();
        }
        // key에 해당하는 버킷 인덱스 찾기
        const index = this.findBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index]!.val = val;
            return;
        }
        // 키-값 쌍이 없으면 새로 추가
        this.buckets[index] = new Pair(key, val);
        this.size++;
    }

    /* 삭제 */
    remove(key: number): void {
        // key에 해당하는 버킷 인덱스 찾기
        const index = this.findBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if (
            this.buckets[index] !== null &&
            this.buckets[index] !== this.TOMBSTONE
        ) {
            this.buckets[index] = this.TOMBSTONE;
            this.size--;
        }
    }

    /* 해시 테이블 용량 늘리기 */
    private extend(): void {
        // 기존 해시 테이블 임시 보관
        const bucketsTmp = this.buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        this.capacity *= this.extendRatio;
        this.buckets = Array(this.capacity).fill(null);
        this.size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
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

/* 실행 예제 */
// 해시 테이블 초기화
const hashmap = new HashMapOpenAddressing();

// 추가
// 해시 테이블에 키-값 쌍 (key, val) 추가
hashmap.put(12836, '샤오하');
hashmap.put(15937, '샤오뤄');
hashmap.put(16750, '샤오쑤안');
hashmap.put(13276, '샤오파');
hashmap.put(10583, '샤오야');
console.log('\n추가 후 해시 테이블\nKey -> Value');
hashmap.print();

// 조회
// 해시 테이블에 키 key를 입력하여 값 val 조회
const name = hashmap.get(13276);
console.log('\n학번 13276으로 조회한 이름: ' + name);

// 삭제
// 해시 테이블에서 키-값 쌍 (key, val) 삭제
hashmap.remove(16750);
console.log('\n키 16750 삭제 후 해시 테이블\nKey -> Value');
hashmap.print();

export {};
