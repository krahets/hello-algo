/**
* File: simple_hash.cs
* Created Time: 2023-06-26
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_hashing;

public class simple_hash {
    /* Аддитивное хеширование */
    int AddHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* Мультипликативное хеширование */
    int MulHash(string key) {
        long hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash = (31 * hash + c) % MODULUS;
        }
        return (int)hash;
    }

    /* Хеширование с помощью XOR */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* Хеширование с циклическим сдвигом */
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
        string key = "Hello 算法";

        int hash = AddHash(key);
        Console.WriteLine("Аддитивный хеш: " + hash);

        hash = MulHash(key);
        Console.WriteLine("Мультипликативный хеш: " + hash);

        hash = XorHash(key);
        Console.WriteLine("Хеш на основе XOR: " + hash);

        hash = RotHash(key);
        Console.WriteLine("Хеш с циклическим сдвигом: " + hash);
    }
}
