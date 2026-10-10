/**
 * File: max_product_cutting.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* Max product cutting: Greedy algorithm */
int maxProductCutting(int n) {
    // When n <= 3, must cut out a 1
    if (n <= 3) {
        return 1 * (n - 1);
    }
    // Greedily cut out 3, a is the number of 3s, b is the remainder
    int a = n / 3;
    int b = n % 3;
    if (b == 1) {
        // When the remainder is 1, convert a pair of 1 * 3 to 2 * 2
        return pow(3, a - 1) * 2 * 2;
    }
    if (b == 2) {
        // When the remainder is 2, do nothing
        return pow(3, a) * 2;
    }
    // When the remainder is 0, do nothing
    return pow(3, a);
}

/* Driver Code */
int main(void) {
    int n = 58;
    // Greedy algorithm
    int res = maxProductCutting(n);
    printf("Maximum cutting product is %d\n", res);

    return 0;
}
