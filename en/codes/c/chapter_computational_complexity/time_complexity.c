/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Constant complexity */
int constant(int n) {
    int count = 0;
    int size = 100000;
    int i = 0;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* Linear complexity */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Linear complexity (traversing an array) */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // Loop count is proportional to the length of the array
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Quadratic complexity */
int quadratic(int n) {
    int count = 0;
    // Loop count is squared in relation to the data size n
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Quadratic complexity (bubble sort) */
int bubbleSort(int *nums, int n) {
    int count = 0; // Counter
    // Outer loop: unsorted range is [0, i]
    for (int i = n - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Element swap includes 3 individual operations
            }
        }
    }
    return count;
}

/* Exponential complexity (loop implementation) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Exponential complexity (recursive implementation) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic complexity (loop implementation) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Logarithmic complexity (recursive implementation) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* Linear logarithmic complexity */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Factorial complexity (recursive implementation) */
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
    // Can modify n to experience the trend of operation count changes under various complexities
    int n = 8;
    printf("Input data size n = %d\n", n);

    int count = constant(n);
    printf("Constant complexity operation count = %d\n", count);

    count = linear(n);
    printf("Linear complexity operation count = %d\n", count);
    // Allocate heap memory (create a one-dimensional dynamic array: array element count = n, element type = int)
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("Linear complexity (array traversal) operation count = %d\n", count);

    count = quadratic(n);
    printf("Quadratic complexity operation count = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("Quadratic complexity (bubble sort) operation count = %d\n", count);

    count = exponential(n);
    printf("Exponential complexity (loop implementation) operation count = %d\n", count);
    count = expRecur(n);
    printf("Exponential complexity (recursive implementation) operation count = %d\n", count);

    count = logarithmic(n);
    printf("Logarithmic complexity (loop implementation) operation count = %d\n", count);
    count = logRecur(n);
    printf("Logarithmic complexity (recursive implementation) operation count = %d\n", count);

    count = linearLogRecur(n);
    printf("Linear logarithmic time (recursive implementation) operation count = %d\n", count);

    count = factorialRecur(n);
    printf("Factorial complexity (recursive implementation) operation count = %d\n", count);

    // Free heap memory
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
