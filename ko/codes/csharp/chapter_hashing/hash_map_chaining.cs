/**
* File: hash_map_chaining.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

/* 체이닝 해시 테이블 */
class HashMapChaining {
    int size; // 키-값 쌍 개수
    int capacity; // 해시 테이블 용량
    double loadThres; // 용량 확장을 수행하는 적재율 임계값
    int extendRatio; // 용량 확장 배수
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

    /* 조회 연산 */
    public string? Get(int key) {
        int index = HashFunc(key);
        // 버킷을 순회하다 key를 찾으면 해당 val을 반환한다
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        // key를 찾지 못하면 null을 반환한다
        return null;
    }

    /* 추가 연산 */
    public void Put(int key, string val) {
        // 적재율이 임계값을 초과하면 용량을 확장한다
        if (LoadFactor() > loadThres) {
            Extend();
        }
        int index = HashFunc(key);
        // 버킷을 순회하다 지정한 key를 만나면 해당 val을 갱신하고 반환한다
        foreach (Pair pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }
        // 해당 key가 없으면 키-값 쌍을 맨 뒤에 추가한다
        buckets[index].Add(new Pair(key, val));
        size++;
    }

    /* 삭제 연산 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // 버킷을 순회하며 키-값 쌍을 삭제한다
        foreach (Pair pair in buckets[index].ToList()) {
            if (pair.key == key) {
                buckets[index].Remove(pair);
                size--;
                break;
            }
        }
    }

    /* 해시 테이블 용량 확장 */
    void Extend() {
        // 원래 해시 테이블을 임시로 저장한다
        List<List<Pair>> bucketsTmp = buckets;
        // 용량을 확장한 새 해시 테이블을 초기화한다
        capacity *= extendRatio;
        buckets = new List<List<Pair>>(capacity);
        for (int i = 0; i < capacity; i++) {
            buckets.Add([]);
        }
        size = 0;
        // 원래 해시 테이블의 키-값 쌍을 새 해시 테이블로 옮긴다
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
        map.Remove(12836);
        Console.WriteLine("\n12836을 삭제한 뒤의 해시 테이블\n키 -> 값");
        map.Print();
    }
}