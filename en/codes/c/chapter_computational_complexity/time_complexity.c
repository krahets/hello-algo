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

/* Linear complexity (array traversal) */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // The number of iterations is proportional to the array length
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Quadratic complexity */
int quadratic(int n) {
    int count = 0;
    // The number of iterations is proportional to the square of the input size n
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
    // Outer loop: the unsorted range is [0, i]
    for (int i = n - 1; i > 0; i--) {
        // Inner loop: move the largest element in the unsorted range [0, i] to its right end through swaps
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                int tmp = nums[j];
                nums[j] = nums[j + 1];
                nums[j + 1] = tmp;
                count += 3; // Swapping two elements takes 3 elementary operations
            }
        }
    }
    return count;
}

/* Exponential complexity (iterative implementation) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
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

/* Logarithmic complexity (iterative implementation) */
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

/* Linearithmic complexity */
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

/* Driver code */
int main(int argc, char *argv[]) {
    // Try different values of n to see how the operation count grows for each complexity
    int n = 8;
    printf("Input size n = %d\n", n);

    int count = constant(n);
    printf("Operation count for constant complexity = %d\n", count);

    count = linear(n);
    printf("Operation count for linear complexity = %d\n", count);
    // Allocate heap memory for a one-dimensional array of n int elements
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("Operation count for linear complexity (array traversal) = %d\n", count);

    count = quadratic(n);
    printf("Operation count for quadratic complexity = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("Operation count for quadratic complexity (bubble sort) = %d\n", count);

    count = exponential(n);
    printf("Operation count for exponential complexity (iteration) = %d\n", count);
    count = expRecur(n);
    printf("Operation count for exponential complexity (recursion) = %d\n", count);

    count = logarithmic(n);
    printf("Operation count for logarithmic complexity (iteration) = %d\n", count);
    count = logRecur(n);
    printf("Operation count for logarithmic complexity (recursion) = %d\n", count);

    count = linearLogRecur(n);
    printf("Operation count for linearithmic complexity (recursion) = %d\n", count);

    count = factorialRecur(n);
    printf("Operation count for factorial complexity (recursion) = %d\n", count);

    // Free the heap memory
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
