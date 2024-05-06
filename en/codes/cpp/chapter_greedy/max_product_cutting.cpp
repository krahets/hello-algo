/**
 * File: max_product_cutting.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Maximum product of cutting: Greedy */
int maxProductCutting(int n) {
    // When n <= 3, must cut out a 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Greedy cut out 3s, a is the number of 3s, b is the remainder
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // When the remainder is 1, convert a pair of 1 * 3 into 2 * 2
        return (int)pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // When the remainder is 2, do nothing
        return (int)pow(3, a) * 2;
    }
    // When the remainder is 0, do nothing
    return (int)pow(3, a);
}

/* Driver Code */
int main() {
    int n = 58;

    // Greedy algorithm
    int res = maxProductCutting(n);
    cout << "Maximum cutting product is" << res << endl;

    return 0;
}
