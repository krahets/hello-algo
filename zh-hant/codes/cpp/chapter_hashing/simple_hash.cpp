/**
 * File: simple_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 加法雜湊 */
int addHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* 乘法雜湊 */
int mulHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (31 * hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* 互斥或雜湊 */
int xorHash(string key) {
    int hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash ^= (int)c;
    }
    return hash & MODULUS;
}

/* 旋轉雜湊 */
int rotHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (int)c) % MODULUS;
    }
    return (int)hash;
}

/* Driver Code */
int main() {
    string key = "Hello dsad3241241dsa算123法";

    int hash = addHash(key);
    cout << "加法雜湊值為 " << hash << endl;

    hash = mulHash(key);
    cout << "乘法雜湊值為 " << hash << endl;

    hash = xorHash(key);
    cout << "互斥或雜湊值為 " << hash << endl;

    hash = rotHash(key);
    cout << "旋轉雜湊值為 " << hash << endl;

    return 0;
}
