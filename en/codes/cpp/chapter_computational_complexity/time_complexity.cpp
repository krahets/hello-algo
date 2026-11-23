/**
 * File: time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Constant complexity */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++)
        count++;
    return count;
}

/* Linear complexity */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++)
        count++;
    return count;
}

/* Linear complexity (array traversal) */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    // The number of iterations is proportional to the array length
    for (int num : nums) {
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
int bubbleSort(vector<int> &nums) {
    int count = 0; // Counter
    // Outer loop: the unsorted range is [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
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
    int count = 0, base = 1;
    // Each cell divides into two per round, giving the sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
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
    // Split one problem into n subproblems
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver code */
int main() {
    // Try different values of n to see how the operation count grows for each complexity
    int n = 8;
    cout << "Input size n = " << n << endl;

    int count = constant(n);
    cout << "Operation count for constant complexity = " << count << endl;

    count = linear(n);
    cout << "Operation count for linear complexity = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "Operation count for linear complexity (array traversal) = " << count << endl;

    count = quadratic(n);
    cout << "Operation count for quadratic complexity = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i; // [n,n-1,...,2,1]
    count = bubbleSort(nums);
    cout << "Operation count for quadratic complexity (bubble sort) = " << count << endl;

    count = exponential(n);
    cout << "Operation count for exponential complexity (iterative implementation) = " << count << endl;
    count = expRecur(n);
    cout << "Operation count for exponential complexity (recursive implementation) = " << count << endl;

    count = logarithmic(n);
    cout << "Operation count for logarithmic complexity (iterative implementation) = " << count << endl;
    count = logRecur(n);
    cout << "Operation count for logarithmic complexity (recursive implementation) = " << count << endl;

    count = linearLogRecur(n);
    cout << "Operation count for linearithmic complexity (recursive implementation) = " << count << endl;

    count = factorialRecur(n);
    cout << "Operation count for factorial complexity (recursive implementation) = " << count << endl;

    return 0;
}
