
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* ハッシュテーブルを初期化 */
        Dictionary<int, string> map = new() {
            /* 追加操作 */
            // ハッシュテーブルにキーと値のペア (key, value) を追加
            { 12836, "シャオハー" },
            { 15937, "シャオルオ" },
            { 16750, "シャオスワン" },
            { 13276, "シャオファー" },
            { 10583, "シャオヤー" }
        };
        Console.WriteLine("\n追加完了後、ハッシュテーブルは\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* 検索操作 */
        // キー key をハッシュテーブルに渡し、値 value を取得
        string name = map[15937];
        Console.WriteLine("\n学籍番号 15937 を入力すると、氏名 " + name);

        /* 削除操作 */
        // ハッシュテーブルからキーと値のペア (key, value) を削除
        map.Remove(10583);
        Console.WriteLine("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* ハッシュテーブルを走査 */
        Console.WriteLine("\nキーと値のペア Key->Value を走査");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\nキー Key のみを走査");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n値 Value のみを走査");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
