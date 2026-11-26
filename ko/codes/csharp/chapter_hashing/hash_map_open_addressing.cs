/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    int size; // 키-값 쌍의 개수
    int capacity = 4; // 해시 테이블의 용량
    double loadThres = 2.0 / 3.0; // 용량을 늘리는 기준이 되는 적재율
    int extendRatio = 2; // 용량 증가 배수
    Pair[] buckets; // 버킷 배열
    Pair TOMBSTONE = new(-1, "-1"); // 삭제 표시

    /* 생성자 */
    public HashMapOpenAddressing() {
        size = 0;
        buckets = new Pair[capacity];
    }

    /* 해시 함수 */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* 적재율 */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* key에 해당하는 버킷 인덱스 찾기 */
    int FindBucket(int key) {
        int index = HashFunc(key);
        int firstTombstone = -1;
        // 선형 탐사 중 빈 버킷을 만나면 반복 종료
        while (buckets[index] != null) {
            // key를 만나면 해당 버킷 인덱스 반환
            if (buckets[index].key == key) {
                // 앞서 삭제 표시를 만났으면 키-값 쌍을 그 위치로 이동
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 옮긴 뒤의 버킷 인덱스 반환
                }
                return index; // 버킷 인덱스 반환
            }
            // 처음 만난 삭제 표시의 위치 기록
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 다음 버킷 인덱스 계산. 끝을 지나면 처음으로 돌아감
            index = (index + 1) % capacity;
        }
        // key가 없으면 삽입할 위치의 인덱스 반환
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 조회 */
    public string? Get(int key) {
        // key에 해당하는 버킷 인덱스 찾기
        int index = FindBucket(key);
        // 키-값 쌍을 찾으면 해당 val 반환
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // 키-값 쌍이 없으면 null 반환
        return null;
    }

    /* 추가 */
    public void Put(int key, string val) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // key에 해당하는 버킷 인덱스 찾기
        int index = FindBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // 키-값 쌍이 없으면 새로 추가
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 삭제 */
    public void Remove(int key) {
        // key에 해당하는 버킷 인덱스 찾기
        int index = FindBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓰기
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 해시 테이블 용량 늘리기 */
    void Extend() {
        // 기존 해시 테이블 임시 보관
        Pair[] bucketsTmp = buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        foreach (Pair pair in bucketsTmp) {
            if (pair != null && pair != TOMBSTONE) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* 해시 테이블 출력 */
    public void Print() {
        foreach (Pair pair in buckets) {
            if (pair == null) {
                Console.WriteLine("null");
            } else if (pair == TOMBSTONE) {
                Console.WriteLine("TOMBSTONE");
            } else {
                Console.WriteLine(pair.key + " -> " + pair.val);
            }
        }
    }
}

public class hash_map_open_addressing {
    [Test]
    public void Test() {
        /* 해시 테이블 초기화 */
        HashMapOpenAddressing map = new();

        /* 추가 */
        // 해시 테이블에 키-값 쌍 (key, value) 추가
        map.Put(12836, "샤오하");
        map.Put(15937, "샤오뤄");
        map.Put(16750, "샤오쑤안");
        map.Put(13276, "샤오파");
        map.Put(10583, "샤오야");
        Console.WriteLine("\n추가 후 해시 테이블\nKey -> Value");
        map.Print();

        /* 조회 */
        // 해시 테이블에 키 key를 입력하여 값 value 조회
        string? name = map.Get(13276);
        Console.WriteLine("\n학번 13276으로 조회한 이름: " + name);

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.Remove(16750);
        Console.WriteLine("\n키 16750 삭제 후 해시 테이블\nKey -> Value");
        map.Print();
    }
}
