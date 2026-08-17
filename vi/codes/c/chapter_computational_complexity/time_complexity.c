/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Constant order */
int constant(int n) {
    int count = 0;
    int size = 100000;
    int i = 0;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* Linear order */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Linear order (traversing array) */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // Number of iterations is proportional to the array length
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Exponential order */
int quadratic(int n) {
    int count = 0;
    // Number of iterations is quadratically related to the data size n
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Quadratic order (bubble sort) */
int bubbleSort(int *nums, int n) {
    int count = 0; // Counter
    // Outer loop: unsorted range is [0, i]
    for (int i = n - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the rightmost end of that range
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Element swap includes 3 unit operations
            }
        }
    }
    return count;
}

/* Exponential order (loop implementation) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Exponential order (recursive implementation) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic order (loop implementation) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Logarithmic order (recursive implementation) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* Linearithmic order */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Factorial order (recursive implementation) */
int factorialRecur(int n) {
    if (n == 0)
        return 1;
    int count = 0;
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main(int argc, char *argv[]) {
    // You can modify n to run and observe the trend of the number of operations for various complexities
    int n = 8;
    printf("Input data size n = %d\n", n);

    int count = constant(n);
    printf("Constant-time operations count = %d\n", count);

    count = linear(n);
    printf("Linear-time operations count = %d\n", count);
    // Allocate heap memory (create 1D variable-length array: n elements of type int)
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("Linear-time (array traversal) operations count = %d\n", count);

    count = quadratic(n);
    printf("Quadratic-time operations count = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("Quadratic-time (bubble sort) operations count = %d\n", count);

    count = exponential(n);
    printf("Exponential-time (iterative) operations count = %d\n", count);
    count = expRecur(n);
    printf("Exponential-time (recursive) operations count = %d\n", count);

    count = logarithmic(n);
    printf("Logarithmic-time (iterative) operations count = %d\n", count);
    count = logRecur(n);
    printf("Logarithmic-time (recursive) operations count = %d\n", count);

    count = linearLogRecur(n);
    printf("Linearithmic-time (recursive) operations count = %d\n", count);

    count = factorialRecur(n);
    printf("Factorial-time (recursive) operations count = %d\n", count);

    // Free heap memory
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
