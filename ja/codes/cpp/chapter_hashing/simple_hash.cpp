/**
 * File: simple_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 加算ハッシュ */
int addHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* 乗算ハッシュ */
int mulHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (31 * hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* 排他的論理和ハッシュ */
int xorHash(string key) {
    int hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash ^= (int)c;
    }
    return hash & MODULUS;
}

/* 回転ハッシュ */
int rotHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (int)c) % MODULUS;
    }
    return (int)hash;
}

/* 実行用コード */
int main() {
    string key = "Hello 算法";

    int hash = addHash(key);
    cout << "加算ハッシュの値は " << hash << endl;

    hash = mulHash(key);
    cout << "乗算ハッシュの値は " << hash << endl;

    hash = xorHash(key);
    cout << "排他的論理和ハッシュの値は " << hash << endl;

    hash = rotHash(key);
    cout << "回転ハッシュの値は " << hash << endl;

    return 0;
}
