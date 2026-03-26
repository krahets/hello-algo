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

    /* XOR-хеширование */
    int XorHash(string key) {
        int hash = 0;
        const int MODULUS = 1000000007;
        foreach (char c in key) {
            hash ^= c;
        }
        return hash & MODULUS;
    }

    /* Вращательное хеширование */
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
        string key = "Hello Algo";

        int hash = AddHash(key);
        Console.WriteLine("Аддитивное хешированиезначение равно" + hash);

        hash = MulHash(key);
        Console.WriteLine("Мультипликативное хешированиезначение равно" + hash);

        hash = XorHash(key);
        Console.WriteLine("XOR-хешированиезначение равно" + hash);

        hash = RotHash(key);
        Console.WriteLine("Вращательное хешированиезначение равно" + hash);
    }
}
