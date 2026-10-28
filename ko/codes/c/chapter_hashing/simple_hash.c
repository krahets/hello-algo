/**
 * File: simple_hash.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 덧셈 해시 */
int addHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* 곱셈 해시 */
int mulHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = (31 * hash + (unsigned char)key[i]) % MODULUS;
    }
    return (int)hash;
}

/* XOR 해시 */
int xorHash(char *key) {
    int hash = 0;
    const int MODULUS = 1000000007;

    for (int i = 0; i < strlen(key); i++) {
        hash ^= (unsigned char)key[i];
    }
    return hash & MODULUS;
}

/* 회전 해시 */
int rotHash(char *key) {
    long long hash = 0;
    const int MODULUS = 1000000007;
    for (int i = 0; i < strlen(key); i++) {
        hash = ((hash << 4) ^ (hash >> 28) ^ (unsigned char)key[i]) % MODULUS;
    }

    return (int)hash;
}

/* 실행 코드 */
int main() {
    char *key = "Hello 算法";

    int hash = addHash(key);
    printf("덧셈 해시값은 %d이다\n", hash);

    hash = mulHash(key);
    printf("곱셈 해시값은 %d이다\n", hash);

    hash = xorHash(key);
    printf("XOR 해시값은 %d이다\n", hash);

    hash = rotHash(key);
    printf("회전 해시값은 %d이다\n", hash);

    return 0;
}
