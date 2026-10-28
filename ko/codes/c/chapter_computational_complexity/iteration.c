/**
 * File: iteration.c
 * Created Time: 2023-09-09
 * Author: Gonglja (glj0@outlook.com), MwumLi (mwumli@hotmail.com)
 */

#include "../utils/common.h"

/* for 반복문 */
int forLoop(int n) {
    int res = 0;
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* while 반복문 */
int whileLoop(int n) {
    int res = 0;
    int i = 1; // 조건 변수를 초기화한다
    // 반복문으로 1, 2, ..., n-1, n의 합을 구한다
    while (i <= n) {
        res += i;
        i++; // 조건 변수를 갱신한다
    }
    return res;
}

/* while 반복문(두 번 갱신) */
int whileLoopII(int n) {
    int res = 0;
    int i = 1; // 조건 변수를 초기화한다
    // 반복문으로 1, 4, 10, ...의 합을 구한다
    while (i <= n) {
        res += i;
        // 조건 변수를 갱신한다
        i++;
        i *= 2;
    }
    return res;
}

/* 이중 for 반복문 */
char *nestedForLoop(int n) {
    // n * n은 해당 점의 개수이며, "(i, j), "의 최대 문자열 길이는 6+10*2이다. 마지막 널 문자 \0을 위한 공간도 추가한다
    int size = n * n * 26 + 1;
    char *res = malloc(size * sizeof(char));
    // i = 1, 2, ..., n-1, n을 반복한다
    for (int i = 1; i <= n; i++) {
        // j = 1, 2, ..., n-1, n을 반복한다
        for (int j = 1; j <= n; j++) {
            char tmp[26];
            snprintf(tmp, sizeof(tmp), "(%d, %d), ", i, j);
            strncat(res, tmp, size - strlen(res) - 1);
        }
    }
    return res;
}

/* 실행 코드 */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    printf("\nfor 반복문으로 구한 합 res = %d\n", res);

    res = whileLoop(n);
    printf("\nwhile 반복문으로 구한 합 res = %d\n", res);

    res = whileLoopII(n);
    printf("\nwhile 반복문(두 번 갱신)으로 구한 합 res = %d\n", res);

    char *resStr = nestedForLoop(n);
    printf("\n이중 for 반복문의 순회 결과 %s\r\n", resStr);
    free(resStr);

    return 0;
}
