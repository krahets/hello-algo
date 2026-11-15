
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
        /* 初始化雜湊表 */
        Dictionary<int, string> map = new() {
            /* 新增操作 */
            // 在雜湊表中新增鍵值對 (key, value)
            { 12836, "小哈" },
            { 15937, "小囉" },
            { 16750, "小算" },
            { 13276, "小法" },
            { 10583, "小鴨" }
        };
        // [endregion]{init_hash_map}
        Console.WriteLine("\n新增完成後，雜湊表為\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        // [region]{get_value}
        /* 查詢操作 */
        // 向雜湊表中輸入鍵 key ，得到值 value
        string name = map[15937];
        // [endregion]{get_value}
        Console.WriteLine("\n輸入學號 15937 ，查詢到姓名 " + name);

        // [region]{remove_pair}
        /* 刪除操作 */
        // 在雜湊表中刪除鍵值對 (key, value)
        map.Remove(10583);
        // [endregion]{remove_pair}
        Console.WriteLine("\n刪除 10583 後，雜湊表為\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        Console.WriteLine("\n走訪鍵值對 Key->Value");
        // [region]{iterate_pairs}
        /* 走訪雜湊表 */
        // 走訪鍵值對 key->value
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        // [endregion]{iterate_pairs}

        Console.WriteLine("\n單獨走訪鍵 Key");
        // [region]{iterate_keys}
        // 單獨走訪鍵 key
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        // [endregion]{iterate_keys}

        Console.WriteLine("\n單獨走訪值 Value");
        // [region]{iterate_values}
        // 單獨走訪值 value
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
        // [endregion]{iterate_values}
    }
}
