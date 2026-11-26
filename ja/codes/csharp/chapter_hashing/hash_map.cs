
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* ハッシュ表を初期化する */
        Dictionary<int, string> map = new() {
            /* 追加 */
            // ハッシュ表にペア (key, value) を追加する
            { 12836, "小哈" },
            { 15937, "小啰" },
            { 16750, "小算" },
            { 13276, "小法" },
            { 10583, "小鸭" }
        };
        Console.WriteLine("\n追加後のハッシュ表\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* 検索 */
        // ハッシュ表でキー key に対応する値 value を取得する
        string name = map[15937];
        Console.WriteLine("\n学籍番号 15937 に対応する名前は " + name);

        /* 削除 */
        // ハッシュ表からペア (key, value) を削除する
        map.Remove(10583);
        Console.WriteLine("\n10583 を削除した後のハッシュ表\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* ハッシュ表を走査する */
        Console.WriteLine("\nキーと値のペアを順に表示 Key->Value");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nキーだけを順に表示 Key");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n値だけを順に表示 Value");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
