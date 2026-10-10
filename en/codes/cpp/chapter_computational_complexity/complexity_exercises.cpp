/**
 * File: complexity_exercises.cpp
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

#include <cassert>

/* Iterative summation */
int sumIter(int n) {
    int res = 0;
    for (int i = 1; i <= n; ++i) {
        res += i;
    }
    return res;
}

/* Recursive summation */
int sumRecur(int n) {
    if (n == 1) {
        return 1;
    }
    return n + sumRecur(n - 1);
}

/* Linear loop */
int linearLoop(int n) {
    int res = 0;
    for (int i = 0; i < n; ++i) {
        res += i;
    }
    return res;
}

/* Quadratic loop */
int quadraticLoop(int n) {
    int res = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = i; j < n; ++j) {
            res += j;
        }
    }
    return res;
}

/* Logarithmic loop */
int logarithmicLoop(int n) {
    while (n > 1) {
        n /= 2;
    }
    return n;
}

int main() {
    assert(sumIter(1) == 1 && sumRecur(1) == 1);
    assert(sumIter(4) == 10 && sumRecur(4) == 10);
    assert(linearLoop(4) == 6);
    assert(quadraticLoop(4) == 20);
    assert(logarithmicLoop(4) == 1 && logarithmicLoop(5) == 1);
    return 0;
}
