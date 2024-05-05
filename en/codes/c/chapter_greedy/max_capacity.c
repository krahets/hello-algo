/**
 * File: max_capacity.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* Find minimum value */
int myMin(int a, int b) {
    return a < b ? a : b;
}
/* Find maximum value */
int myMax(int a, int b) {
    return a < b ? a : b;
}

/* Maximum capacity: Greedy */
int maxCapacity(int ht[], int htLength) {
    // Initialize i, j, making them split the array at both ends
    int i = 0;
    int j = htLength - 1;
    // Initial maximum capacity is 0
    int res = 0;
    // Loop for greedy selection until the two boards meet
    while (i < j) {
        // Update maximum capacity
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // Move the shorter board inward
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver Code */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // Greedy algorithm
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("Maximum capacity = %d\n", res);

    return 0;
}
