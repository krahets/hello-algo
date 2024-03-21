
/**
 * File: hash_map.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_hashing;

public class hash_map {
    [Test]
    public void Test() {
        /* 初始化哈希表 */
        Dictionary<int, string> map = new() {
            /* 添加操作 */
            // 在哈希表中添加键值对 (key, value)
            { 12836, "小哈" },
            { 15937, "小啰" },
            { 16750, "小算" },
            { 13276, "小法" },
            { 10583, "小鸭" }
        };
        Console.WriteLine("\n添加完成后，哈希表为\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* 查询操作 */
        // 向哈希表中输入键 key ，得到值 value
        string name = map[15937];
        Console.WriteLine("\n输入学号 15937 ，查询到姓名 " + name);

        /* 删除操作 */
        // 在哈希表中删除键值对 (key, value)
        map.Remove(10583);
        Console.WriteLine("\n删除 10583 后，哈希表为\nKey -> Value");
        PrintUtil.PrintHashMap(map);

        /* 遍历哈希表 */
        Console.WriteLine("\n遍历键值对 Key->Value");
        foreach (var kv in map) {
            Console.WriteLine(kv.Key + " -> " + kv.Value);
        }
        Console.WriteLine("\n单独遍历键 Key");
        foreach (int key in map.Keys) {
            Console.WriteLine(key);
        }
        Console.WriteLine("\n单独遍历值 Value");
        foreach (string val in map.Values) {
            Console.WriteLine(val);
        }
    }
}
