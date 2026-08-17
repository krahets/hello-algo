/**
 * File: complexity_exercises.c
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

#include <assert.h>

/* 反復による総和 */
int sumIter(int n) {
    int res = 0;
    for (int i = 1; i <= n; i++) {
        res += i;
    }
    return res;
}

/* 再帰による総和 */
int sumRecur(int n) {
    if (n == 1) {
        return 1;
    }
    return n + sumRecur(n - 1);
}

/* 線形時間のループ */
int linearLoop(int n) {
    int res = 0;
    for (int i = 0; i < n; i++) {
        res += i;
    }
    return res;
}

/* 二次時間のループ */
int quadraticLoop(int n) {
    int res = 0;
    for (int i = 0; i < n; i++) {
        for (int j = i; j < n; j++) {
            res += j;
        }
    }
    return res;
}

/* 対数時間のループ */
int logarithmicLoop(int n) {
    while (n > 1) {
        n /= 2;
    }
    return n;
}

int main(void) {
    assert(sumIter(1) == 1 && sumRecur(1) == 1);
    assert(sumIter(4) == 10 && sumRecur(4) == 10);
    assert(linearLoop(4) == 6);
    assert(quadraticLoop(4) == 20);
    assert(logarithmicLoop(4) == 1 && logarithmicLoop(5) == 1);
    return 0;
}
