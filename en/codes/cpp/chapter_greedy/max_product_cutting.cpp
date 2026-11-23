/**
 * File: max_product_cutting.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Maximum product after splitting: greedy algorithm */
int maxProductCutting(int n) {
    // When n <= 3, one part must be 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Greedily split off parts of size 3; a is the number of 3s and b is the remainder
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // When the remainder is 1, replace one pair 1 * 3 with 2 * 2
        return (int)pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // When the remainder is 2, no adjustment is needed
        return (int)pow(3, a) * 2;
    }
    // When the remainder is 0, no adjustment is needed
    return (int)pow(3, a);
}

/* Driver code */
int main() {
    int n = 58;

    // Greedy algorithm
    int res = maxProductCutting(n);
    cout << "Maximum product after cutting: " << res << endl;

    return 0;
}
