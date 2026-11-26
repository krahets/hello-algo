/**
 * File: iteration.cpp
 * Created Time: 2023-08-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* for 문 */
int forLoop(int n) {
    int res = 0;
    // 1, 2, ..., n-1, n을 차례로 더한다
    for (int i = 1; i <= n; ++i) {
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
string nestedForLoop(int n) {
    ostringstream res;
    // i = 1, 2, ..., n-1, n에 대해 반복한다
    for (int i = 1; i <= n; ++i) {
        // j = 1, 2, ..., n-1, n에 대해 반복한다
        for (int j = 1; j <= n; ++j) {
            res << "(" << i << ", " << j << "), ";
        }
    }
    return res.str();
}

/* 실행 예제 */
int main() {
    int n = 5;
    int res;

    res = forLoop(n);
    cout << "\nfor 문의 합 res = " << res << endl;

    res = whileLoop(n);
    cout << "\nwhile 문의 합 res = " << res << endl;

    res = whileLoopII(n);
    cout << "\nwhile 문(두 번 갱신)의 합 res = " << res << endl;

    string resStr = nestedForLoop(n);
    cout << "\n이중 for 문의 순회 결과: " << resStr << endl;

    return 0;
}
