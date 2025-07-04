/**
 * File: simple_hash.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 加法哈希 */
int addHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* 乘法哈希 */
int mulHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* 异或哈希 */
int xorHash(char *key) {
    int hash = 0;
    const int MODULUS = 1000000007;

    for (int i = 0; i < strlen(key); i++) {
        hash ^= (unsigned char)key[i];
    }
    return hash & MODULUS;
}

/* 旋转哈希 */
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
    char *key = "Hello 算法";

    int hash = addHash(key);
    printf("加法哈希值为 %d\n", hash);

    hash = mulHash(key);
    printf("乘法哈希值为 %d\n", hash);

    hash = xorHash(key);
    printf("异或哈希值为 %d\n", hash);

    hash = rotHash(key);
    printf("旋转哈希值为 %d\n", hash);

    return 0;
}
