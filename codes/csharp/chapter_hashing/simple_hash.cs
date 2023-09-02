/**
* File: simple_hash.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

public class simple_hash {
    /* 加法哈希 */
    public static int addHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* 乘法哈希 */
    public static int mulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* 异或哈希 */
    public static int xorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* 旋转哈希 */
    public static int rotHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = ((hash << 4) ^ (hash >> 28) ^ c) % MODULUS;
        }
        return (int)hash;
    }

    [Test]
    public void Test() {
        string key = "Hello 算法";

        int hash = addHash(key);
        Console.WriteLine("加法哈希值为 " + hash);

        hash = mulHash(key);
        Console.WriteLine("乘法哈希值为 " + hash);

        hash = xorHash(key);
        Console.WriteLine("异或哈希值为 " + hash);

        hash = rotHash(key);
        Console.WriteLine("旋转哈希值为 " + hash);
    }
}
