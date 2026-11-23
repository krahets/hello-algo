/**
 * File: simple_hash.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Additive hash */
int addHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* Multiplicative hash */
int mulHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = (31 * hash + (int)c) % MODULUS;
    }
    return (int)hash;
}

/* XOR hash */
int xorHash(string key) {
    int hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash ^= (int)c;
    }
    return hash & MODULUS;
}

/* Rotating hash */
int rotHash(string key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (unsigned char c : key) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (int)c) % MODULUS;
    }
    return (int)hash;
}

/* Driver code */
int main() {
    string key = "Hello 算法";

    int hash = addHash(key);
    cout << "Additive hash value: " << hash << endl;

    hash = mulHash(key);
    cout << "Multiplicative hash value: " << hash << endl;

    hash = xorHash(key);
    cout << "XOR hash value: " << hash << endl;

    hash = rotHash(key);
    cout << "Rotation hash value: " << hash << endl;

    return 0;
}
