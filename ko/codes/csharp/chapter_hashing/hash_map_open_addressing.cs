/**
* File: hash_map_open_addressing.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 개방 주소법 해시 테이블 */
class HashMapOpenAddressing {
    int size; // 키-값 쌍 개수
    int capacity = 4; // 해시 테이블 용량
    double loadThres = 2.0 / 3.0; // 용량 확장을 수행하는 적재율 임계값
    int extendRatio = 2; // 용량 확장 배수
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

    /* key에 해당하는 버킷 인덱스 탐색 */
    int FindBucket(int key) {
        int index = HashFunc(key);
        int firstTombstone = -1;
        // 선형 탐사로 탐색하고, 빈 버킷을 만나면 반복문을 종료한다
        while (buckets[index] != null) {
            // key를 만나면 해당 버킷 인덱스를 반환한다
            if (buckets[index].key == key) {
                // 이전에 삭제 표시를 만났으면 키-값 쌍을 그 인덱스로 옮긴다
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = TOMBSTONE;
                    return firstTombstone; // 옮긴 후의 버킷 인덱스를 반환한다
                }
                return index; // 버킷 인덱스를 반환한다
            }
            // 처음 만난 삭제 표시를 기록한다
            if (firstTombstone == -1 && buckets[index] == TOMBSTONE) {
                firstTombstone = index;
            }
            // 버킷 인덱스를 계산하고, 끝을 넘어가면 처음으로 돌아온다
            index = (index + 1) % capacity;
        }
        // key가 없으면 추가할 위치의 인덱스를 반환한다
        return firstTombstone == -1 ? index : firstTombstone;
    }

    /* 조회 연산 */
    public string? Get(int key) {
        // key에 해당하는 버킷 인덱스 탐색
        int index = FindBucket(key);
        // 키-값 쌍을 찾으면 해당 val을 반환한다
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            return buckets[index].val;
        }
        // 키-값 쌍이 없으면 null을 반환한다
        return null;
    }

    /* 추가 연산 */
    public void Put(int key, string val) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (LoadFactor() > loadThres) {
            Extend();
        }
        // key에 해당하는 버킷 인덱스 탐색
        int index = FindBucket(key);
        // 키-값 쌍을 찾으면 val을 덮어쓰고 반환한다
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index].val = val;
            return;
        }
        // 키-값 쌍이 없으면 해당 키-값 쌍을 추가한다
        buckets[index] = new Pair(key, val);
        size++;
    }

    /* 삭제 연산 */
    public void Remove(int key) {
        // key에 해당하는 버킷 인덱스 탐색
        int index = FindBucket(key);
        // 키-값 쌍을 찾으면 삭제 표시로 덮어쓴다
        if (buckets[index] != null && buckets[index] != TOMBSTONE) {
            buckets[index] = TOMBSTONE;
            size--;
        }
    }

    /* 해시 테이블 용량 확장 */
    void Extend() {
        // 원래 해시 테이블을 임시로 저장한다
        Pair[] bucketsTmp = buckets;
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio;
        buckets = new Pair[capacity];
        size = 0;
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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

        /* 추가 연산 */
        // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
        map.Put(12836, "小哈");
        map.Put(15937, "小啰");
        map.Put(16750, "小算");
        map.Put(13276, "小法");
        map.Put(10583, "小鸭");
        Console.WriteLine("\n추가를 마친 후의 해시 테이블\n키 -> 값");
        map.Print();

        /* 조회 연산 */
        // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
        string? name = map.Get(13276);
        Console.WriteLine("\n학번 13276을 입력하여 조회한 이름 " + name);

        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.Remove(16750);
        Console.WriteLine("\n16750을 삭제한 후의 해시 테이블\n키 -> 값");
        map.Print();
    }
}
