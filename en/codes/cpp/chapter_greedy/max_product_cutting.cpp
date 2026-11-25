/**
 * File: max_product_cutting.cpp
 * Created Time: 2023-07-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Greedy maximum product algorithm */
int maxProductCutting(int n) {
    // When n <= 3, one piece must be 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Greedily cut off pieces of size 3. Let a be their count and b the remainder
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // If the remainder is 1, replace one pair 1 * 3 with 2 * 2
        return (int)pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // If the remainder is 2, leave it as is
        return (int)pow(3, a) * 2;
    }
    // If the remainder is 0, no adjustment is needed
    return (int)pow(3, a);
}

/* Driver code */
int main() {
    int n = 58;

    // Greedy algorithm
    int res = maxProductCutting(n);
    cout << "The maximum product after cutting is" << res << endl;

    return 0;
}
