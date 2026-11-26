/**
 * File: max_capacity.c
 * Created Time: 2023-09-15
 * Author: xianii (xianyi.xia@outlook.com)
 */

#include "../utils/common.h"

/* Find the minimum */
int myMin(int a, int b) {
    return a < b ? a : b;
}
/* Find the maximum */
int myMax(int a, int b) {
    return a > b ? a : b;
}

/* Greedy maximum capacity algorithm */
int maxCapacity(int ht[], int htLength) {
    // Start i and j at opposite ends of the array
    int i = 0;
    int j = htLength - 1;
    // The initial maximum capacity is 0
    int res = 0;
    // Make greedy choices until the two pointers meet
    while (i < j) {
        // Update the maximum capacity
        int capacity = myMin(ht[i], ht[j]) * (j - i);
        res = myMax(res, capacity);
        // Move the pointer at the shorter board inward
        if (ht[i] < ht[j]) {
            i++;
        } else {
            j--;
        }
    }
    return res;
}

/* Driver code */
int main(void) {
    int ht[] = {3, 8, 5, 2, 7, 7, 3, 4};

    // Greedy algorithm
    int res = maxCapacity(ht, sizeof(ht) / sizeof(int));
    printf("The maximum capacity is %d\n", res);

    return 0;
}
