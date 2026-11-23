/**
 * File: fast_power.cpp
 * Created Time: 2026-08-18
 * Author: Hello Algo Team
 */

#include <cassert>

/* Быстрое возведение в степень */
int fastPow(int x, int n) {
    if (n == 0) {
        return 1;
    }
    int half = fastPow(x, n / 2);
    if (n % 2 == 0) {
        return half * half;
    }
    return half * half * x;
}

int main() {
    assert(fastPow(7, 0) == 1);
    assert(fastPow(3, 5) == 243);
    assert(fastPow(2, 6) == 64);
    return 0;
}
