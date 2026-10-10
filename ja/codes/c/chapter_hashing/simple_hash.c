/**
 * File: simple_hash.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 加算ハッシュ */
int addHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* 乗算ハッシュ */
int mulHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* XOR ハッシュ */
int xorHash(char *key) {
    int hash = 0;
    const int MODULUS = 1000000007;

    for (int i = 0; i < strlen(key); i++) {
        hash ^= (unsigned char)key[i];
    }
    return hash & MODULUS;
}

/* 回転ハッシュ */
int rotHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (unsigned char)key[i]) % MODULUS;
    }

    return (int)hash;
}

/* Driver Code */
int main() {
    char *key = "Hello アルゴリズム";

    int hash = addHash(key);
    printf("加算ハッシュ値は %d\n", hash);

    hash = mulHash(key);
    printf("乗算ハッシュ値は %d\n", hash);

    hash = xorHash(key);
    printf("XORハッシュ値は %d\n", hash);

    hash = rotHash(key);
    printf("回転ハッシュ値は %d\n", hash);

    return 0;
}
