/**
* File: simple_hash.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

public class simple_hash {
    /* 加算ハッシュ */
    int AddHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* 乗算ハッシュ */
    int MulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* XOR ハッシュ */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* 回転ハッシュ */
    int RotHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = ((hash << 4) ^ (hash >> 28) ^ c) % MODULUS;
        }
        return (int)hash;
    }

    [Test]
    public void Test() {
        string key = "Hello アルゴリズム";

        int hash = AddHash(key);
        Console.WriteLine("加算ハッシュ値は " + hash);

        hash = MulHash(key);
        Console.WriteLine("乗算ハッシュ値は " + hash);

        hash = XorHash(key);
        Console.WriteLine("XOR ハッシュ値は " + hash);

        hash = RotHash(key);
        Console.WriteLine("回転ハッシュ値は " + hash);
    }
}
