/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for 문 */
int forLoop(int n) {
    int res = 0;
    // 1, 2, ..., n-1, n을 차례로 더한다
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 문 */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // 반복 조건에 쓰는 변수를 초기화한다
    // 1, 2, ..., n-1, n을 차례로 더한다
    while (i <= n) {
        res += i;
        i++; // 반복 조건에 쓰는 변수를 갱신한다
    }
    return res;
}

/* while 문(한 번에 두 번 갱신) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // 반복 조건에 쓰는 변수를 초기화한다
    // 1, 4, 10, ...을 차례로 더한다
    while (i <= n) {
        res += i;
        // 반복 조건에 쓰는 변수를 갱신한다
        i++;
        i *= 2;
    }
    return res;
}

/* 이중 for 문 */
char *nestedForLoop(int n) {
    // 점은 n * n개이고 각 점을 나타내는 "(i, j), "의 길이는 최대 6+10*2이다. 끝의 널 문자 \0을 위한 공간도 더한다
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // i = 1, 2, ..., n-1, n에 대해 반복한다
    for (int i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n에 대해 반복한다
        for (int j = 1; j <= n; j++) {
            char tmp[26];
            snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
            strncat(res, tmp, size - strlen(res) - 1);
        }
    }
    return res;
}

/* 실행 예제 */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    printf("\nfor 문의 합 res = %d\n", res);

    res = whileLoop(n);
    printf("\nwhile 문의 합 res = %d\n", res);

    res = whileLoopII(n);
    printf("\nwhile 문(두 번 갱신)의 합 res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\n이중 for 문의 순회 결과: %s\r\n", resStr);
    free(resStr);

    return 0;
}
