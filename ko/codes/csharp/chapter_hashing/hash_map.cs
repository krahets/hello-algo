
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        // [region]{init_hash_map}
        /* 해시 테이블 초기화 */
        Dictionary<int, string> map = new() {
            /* 추가 연산 */
            // 해시 테이블에 (key, value) 키-값 쌍을 추가한다
            { 12836, "小哈" },
            { 15937, "小啰" },
            { 16750, "小算" },
            { 13276, "小法" },
            { 10583, "小鸭" }
        };
        // [endregion]{init_hash_map}
        Console.WriteLine("\n추가를 마친 후의 해시 테이블\n키 -> 값");
        PrintUtil.PrintHashMap(map);

        // [region]{get_value}
        /* 조회 연산 */
        // 해시 테이블에 키 key를 입력하여 값 value를 얻는다
        string name = map[15937];
        // [endregion]{get_value}
        Console.WriteLine("\n학번 15937을 입력하여 조회한 이름 " + name);

        // [region]{remove_pair}
        /* 삭제 연산 */
        // 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
        map.Remove(10583);
        // [endregion]{remove_pair}
        Console.WriteLine("\n10583을 삭제한 후의 해시 테이블\n키 -> 값");
        PrintUtil.PrintHashMap(map);

        Console.WriteLine("\n키-값 쌍(키->값) 순회");
        // [region]{iterate_pairs}
        /* 해시 테이블 순회 */
        // 키-값 쌍 key->value를 순회한다
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        // [endregion]{iterate_pairs}

        Console.WriteLine("\n키 Key만 순회");
        // [region]{iterate_keys}
        // 키 key만 순회한다
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        // [endregion]{iterate_keys}

        Console.WriteLine("\n값 Value만 순회");
        // [region]{iterate_values}
        // 값 value만 순회한다
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
        // [endregion]{iterate_values}
    }
}
