/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 체이닝 해시 테이블 */
class HashMapChaining {
    int size; // 키-값 쌍의 개수
    int capacity; // 해시 테이블의 용량
    double loadThres; // 용량을 늘리는 기준이 되는 적재율
    int extendRatio; // 용량 증가 배수
    List<List<Pair>> buckets; // 버킷 배열

    /* 생성자 */
    public HashMapChaining() {
        size = 0;
        capacity = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
    }

    /* 해시 함수 */
    int HashFunc(int key) {
        return key % capacity;
    }

    /* 적재율 */
    double LoadFactor() {
        return (double)size / capacity;
    }

    /* 조회 */
    public string? Get(int key) {
        int index = HashFunc(key);
        // 버킷을 순회하다가 key를 찾으면 해당 val 반환
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key를 찾지 못하면 null 반환
        return null;
    }

    /* 추가 */
    public void Put(int key, string val) {
        // 적재율이 임계값을 넘으면 용량 늘리기
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // 버킷을 순회하다가 지정한 key를 만나면 해당 val을 갱신하고 반환
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // 해당 key가 없으면 맨 뒤에 키-값 쌍 추가
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* 삭제 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // 버킷을 순회하며 해당 키-값 쌍 삭제
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* 해시 테이블 용량 늘리기 */
    void Extend() {
        // 기존 해시 테이블 임시 보관
        List<List<Pair>> bucketsTmp = buckets;
        // 용량을 늘린 새 해시 테이블 초기화
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // 기존 해시 테이블의 키-값 쌍을 새 해시 테이블로 이동
        foreach (List<Pair> bucket in bucketsTmp) {
            foreach (Pair pair in bucket) {
                Put(pair.key, pair.val);
            }
        }
    }

    /* 해시 테이블 출력 */
    public void Print() {
        foreach (List<Pair> bucket in buckets) {
            List<string> res = [];
            foreach (Pair pair in bucket) {
                res.Add(pair.key + " -> " + pair.val);
            }
            foreach (string kv in res) {
                Console.WriteLine(kv);
            }
        }
    }
}

public class hash_map_chaining {
    [Test]
    public void Test() {
        /* 해시 테이블 초기화 */
        HashMapChaining map = new();

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
        map.Remove(12836);
        Console.WriteLine("\n키 12836 삭제 후 해시 테이블\nKey -> Value");
        map.Print();
    }
}