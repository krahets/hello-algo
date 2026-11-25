/**
 * File: time_complexity.c
 * Created Time: 2023-01-03
 * Author: codingonion (coderonion@gmail.com)
 */

#include "../utils/common.h"

/* Constant time */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++) {
        count++;
    }
    return count;
}

/* Linear time */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Linear time (array traversal) */
int arrayTraversal(int *nums, int n) {
    int count = 0;
    // The iteration count is proportional to the array length
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Quadratic time */
int quadratic(int n) {
    int count = 0;
    // The iteration count grows quadratically with input size n
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            count++;
        }
    }
    return count;
}

/* Quadratic time (bubble sort) */
int bubbleSort(int *nums, int n) {
    int count = 0; // Counter
    // Outer loop: the unsorted range is the closed interval [0, i]
    for (int i = n - 1; i > 0; i--) {
        // Inner loop: swap adjacent elements to move the largest in [0, i] to index i
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

/* Exponential time (iterative) */
int exponential(int n) {
    int count = 0;
    int bas = 1;
    // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < bas; j++) {
            count++;
        }
        bas *= 2;
    }
    // count = 1 + 2 + 4 + 8 + .. + 2^(n-1) = 2^n - 1
    return count;
}

/* Exponential time (recursive) */
int expRecur(int n) {
    if (n == 1)
        return 1;
    return expRecur(n - 1) + expRecur(n - 1) + 1;
}

/* Logarithmic time (iterative) */
int logarithmic(int n) {
    int count = 0;
    while (n > 1) {
        n = n / 2;
        count++;
    }
    return count;
}

/* Logarithmic time (recursive) */
int logRecur(int n) {
    if (n <= 1)
        return 0;
    return logRecur(n / 2) + 1;
}

/* Linearithmic time */
int linearLogRecur(int n) {
    if (n <= 1)
        return 1;
    int count = linearLogRecur(n / 2) + linearLogRecur(n / 2);
    for (int i = 0; i < n; i++) {
        count++;
    }
    return count;
}

/* Factorial time (recursive) */
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
    // Try different values of n to see how the operation count grows for each complexity
    int n = 8;
    printf("Input size n = %d\n", n);

    int count = constant(n);
    printf("Constant operation count = %d\n", count);

    count = linear(n);
    printf("Linear operation count = %d\n", count);
    // Allocate heap memory for a one-dimensional array of n elements of type int
    int *nums = (int *)malloc(n * sizeof(int));
    count = arrayTraversal(nums, n);
    printf("Linear operation count (array traversal) = %d\n", count);

    count = quadratic(n);
    printf("Quadratic operation count = %d\n", count);
    for (int i = 0; i < n; i++) {
        nums[i] = n - i; // [n,n-1,...,2,1]
    }
    count = bubbleSort(nums, n);
    printf("Quadratic operation count (bubble sort) = %d\n", count);

    count = exponential(n);
    printf("Exponential operation count (iterative) = %d\n", count);
    count = expRecur(n);
    printf("Exponential operation count (recursive) = %d\n", count);

    count = logarithmic(n);
    printf("Logarithmic operation count (iterative) = %d\n", count);
    count = logRecur(n);
    printf("Logarithmic operation count (recursive) = %d\n", count);

    count = linearLogRecur(n);
    printf("Linearithmic operation count (recursive) = %d\n", count);

    count = factorialRecur(n);
    printf("Factorial operation count (recursive) = %d\n", count);

    // Free the heap memory
    if (nums != NULL) {
        free(nums);
        nums = NULL;
    }
    getchar();

    return 0;
}
