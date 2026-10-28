/**
 * File: array_hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

/* 키-값 쌍 int->string */
class Pair(int key, string val) {
    public int key = key;
    public string val = val;
}

/* 배열로 구현한 해시 테이블 */
class ArrayHashMap {
    List<Pair?> buckets;
    public ArrayHashMap() {
        // 버킷 100개를 포함하는 배열을 초기화한다
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

    /* 조회 연산 */
    public string? Get(int key) {
        int index = HashFunc(key);
        Pair? pair = buckets[index];
        if (pair == null) return null;
        return pair.val;
    }

    /* 추가 연산 */
    public void Put(int key, string val) {
        Pair pair = new(key, val);
        int index = HashFunc(key);
        buckets[index] = pair;
    }

    /* 삭제 연산 */
    public void Remove(int key) {
        int index = HashFunc(key);
        // null로 설정하여 삭제를 나타낸다
        buckets[index] = null;
    }

    /* 모든 키-값 쌍 반환 */
    public List<Pair> PairSet() {
        List<Pair> pairSet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                pairSet.Add(pair);
        }
        return pairSet;
    }

    /* 모든 키 반환 */
    public List<int> KeySet() {
        List<int> keySet = [];
        foreach (Pair? pair in buckets) {
            if (pair != null)
                keySet.Add(pair.key);
        }
        return keySet;
    }

    /* 모든 값 반환 */
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
        string? name = map.Get(15937);
        Console.WriteLine("\n학번 15937을 입력하여 조회한 이름 " + name);

        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.Remove(10583);
        Console.WriteLine("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
        map.Print();

        /* 해시 테이블 순회 */
        Console.WriteLine("\n키-값 쌍(키->값) 순회");
        foreach (Pair kv in map.PairSet()) {
            Console.WriteLine(kv.key + " -> " + kv.val);
        }
        Console.WriteLine("\n키 Key만 순회");
        foreach (int key in map.KeySet()) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n값 Value만 순회");
        foreach (string val in map.ValueSet()) {
            Console.WriteLine(val);
        }
    }
}
