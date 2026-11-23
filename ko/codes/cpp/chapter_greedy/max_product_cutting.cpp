/**
 * File: max_product_cutting.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 분할 후의 최대 곱: 탐욕 */
int maxProductCutting(int n) {
    // n <= 3이면 반드시 1 하나가 나오도록 분할해야 한다
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // 탐욕적으로 3을 떼어 낸다. a는 3의 개수이고 b는 나머지이다
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
        return (int)pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // 나머지가 2이면 별도로 처리하지 않는다
        return (int)pow(3, a) * 2;
    }
    // 나머지가 0이면 별도로 처리하지 않는다
    return (int)pow(3, a);
}

/* 실행 코드 */
int main() {
    int n = 58;

    // 탐욕 알고리즘
    int res = maxProductCutting(n);
    cout << "분할 후의 최대 곱:" << res << endl;

    return 0;
}
