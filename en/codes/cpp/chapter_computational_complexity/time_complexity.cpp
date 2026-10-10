/**
 * File: time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Constant order */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++)
        count++;
    return count;
}

/* Linear order */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++)
        count++;
    return count;
}

/* Linear order (traversing array) */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    // Number of iterations is proportional to the array length
    for (int num : nums) {
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
int bubbleSort(vector<int> &nums) {
    int count = 0; // Counter
    // Outer loop: unsorted range is [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
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
    int count = 0, base = 1;
    // Cells divide into two every round, forming sequence 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
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
    // Split from 1 into n
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main() {
    // You can modify n to run and observe the trend of the number of operations for various complexities
    int n = 8;
    cout << "Input data size n = " << n << endl;

    int count = constant(n);
    cout << "Constant order operation count = " << count << endl;

    count = linear(n);
    cout << "Linear order operation count = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "Linear order (array traversal) operation count = " << count << endl;

    count = quadratic(n);
    cout << "Quadratic order operation count = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i; // [n,n-1,...,2,1]
    count = bubbleSort(nums);
    cout << "Quadratic order (bubble sort) operation count = " << count << endl;

    count = exponential(n);
    cout << "Exponential order (loop implementation) operation count = " << count << endl;
    count = expRecur(n);
    cout << "Exponential order (recursive implementation) operation count = " << count << endl;

    count = logarithmic(n);
    cout << "Logarithmic order (loop implementation) operation count = " << count << endl;
    count = logRecur(n);
    cout << "Logarithmic order (recursive implementation) operation count = " << count << endl;

    count = linearLogRecur(n);
    cout << "Linearithmic order (recursive implementation) operation count = " << count << endl;

    count = factorialRecur(n);
    cout << "Factorial order (recursive implementation) operation count = " << count << endl;

    return 0;
}
