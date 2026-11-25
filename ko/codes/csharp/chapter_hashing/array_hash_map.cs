/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* int->string 키-값 쌍 */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // 버킷 100개로 배열 초기화
        buckets = [];
        for (int i = 0; i < 100; i++) {
            buckets.Add(null);
        }
    }

    /* 해시 함수 */
    int HashFunc(int key) {
        int index = key % 100;
        return index;
    }

    /* 조회 */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* 추가 */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* 삭제 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // null로 설정하여 삭제를 나타냄
        buckets[index] = null;
    }

    /* 모든 키-값 쌍 가져오기 */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* 모든 키 가져오기 */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* 모든 값 가져오기 */
    public List<string> ValueSet() {
        List<string> valueSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                valueSet.Add(pair.val);
        }
        return valueSet;
    }

    /* 해시 테이블 출력 */
    public void Print() {
        foreach (Pair kv in PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
    }
}


public class array_hash_map {
    [Test]
    public void Test() {
        /* 해시 테이블 초기화 */
        ArrayHashMap map = new();

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
        string? name = map.Get(15937);
        Console.WriteLine("\n학번 15937로 조회한 이름: " + name);

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.Remove(10583);
        Console.WriteLine("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
        map.Print();

        /* 해시 테이블 순회 */
        Console.WriteLine("\n키-값 쌍 순회 Key->Value");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\n키만 순회 Key");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n값만 순회 Value");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
