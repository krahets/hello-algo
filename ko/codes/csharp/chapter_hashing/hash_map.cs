
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* 해시 테이블 초기화 */
        Dictionary<int, string> map = new() {
            /* 추가 */
            // 해시 테이블에 키-값 쌍 (key, value) 추가
            { 12836, "샤오하" },
            { 15937, "샤오뤄" },
            { 16750, "샤오쑤안" },
            { 13276, "샤오파" },
            { 10583, "샤오야" }
        };
        Console.WriteLine("\n추가 후 해시 테이블\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* 조회 */
        // 해시 테이블에 키 key를 입력하여 값 value 조회
        string name = map[15937];
        Console.WriteLine("\n학번 15937로 조회한 이름: " + name);

        /* 삭제 */
        // 해시 테이블에서 키-값 쌍 (key, value) 삭제
        map.Remove(10583);
        Console.WriteLine("\n키 10583 삭제 후 해시 테이블\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* 해시 테이블 순회 */
        Console.WriteLine("\n키-값 쌍 순회 Key->Value");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\n키만 순회 Key");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n값만 순회 Value");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
