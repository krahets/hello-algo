
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
        /* ハッシュテーブルを初期化する */
        Dictionary<int, string> map = new() {
            /* 追加操作 */
            // ハッシュテーブルにキーと値のペア (key, value) を追加する
            { 12836, "小哈" },
            { 15937, "小啰" },
            { 16750, "小算" },
            { 13276, "小法" },
            { 10583, "小鸭" }
        };
        // [endregion]{init_hash_map}
        Console.WriteLine("\n追加後のハッシュテーブル\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        // [region]{get_value}
        /* 取得操作 */
        // ハッシュテーブルにキー key を渡し、値 value を取得する
        string name = map[15937];
        // [endregion]{get_value}
        Console.WriteLine("\n学生番号 15937 に対応する氏名は " + name);

        // [region]{remove_pair}
        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除する
        map.Remove(10583);
        // [endregion]{remove_pair}
        Console.WriteLine("\n10583 を削除した後のハッシュテーブル\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        Console.WriteLine("\nキーと値のペア Key->Value を走査する");
        // [region]{iterate_pairs}
        /* ハッシュテーブルを走査する */
        // キーと値のペア key->value を走査する
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        // [endregion]{iterate_pairs}

        Console.WriteLine("\nキー Key だけを走査する");
        // [region]{iterate_keys}
        // キー key だけを走査する
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        // [endregion]{iterate_keys}

        Console.WriteLine("\n値 Value だけを走査する");
        // [region]{iterate_values}
        // 値 value だけを走査する
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
        // [endregion]{iterate_values}
    }
}
