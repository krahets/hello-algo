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

/* Linear complexity (traversing an array) */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    // Loop count is proportional to the length of the array
    for (int num : nums) {
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
int bubbleSort(vector<int> &nums) {
    int count = 0; // Counter
    // Outer loop: unsorted range is [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
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
    int count = 0, base = 1;
    // Cells split into two every round, forming the sequence 1, 2, 4, 8, ..., 2^(n-1)
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
    // From 1 split into n
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main() {
    // Can modify n to experience the trend of operation count changes under various complexities
    int n = 8;
    cout << "Input data size n = " << n << endl;

    int count = constant(n);
    cout << "Number of constant complexity operations = " << count << endl;

    count = linear(n);
    cout << "Number of linear complexity operations = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "Number of linear complexity operations (traversing the array) = " << count << endl;

    count = quadratic(n);
    cout << "Number of quadratic order operations = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i; // [n,n-1,...,2,1]
    count = bubbleSort(nums);
    cout << "Number of quadratic order operations (bubble sort) = " << count << endl;

    count = exponential(n);
    cout << "Number of exponential complexity operations (implemented by loop) = " << count << endl;
    count = expRecur(n);
    cout << "Number of exponential complexity operations (implemented by recursion) = " << count << endl;

    count = logarithmic(n);
    cout << "Number of logarithmic complexity operations (implemented by loop) = " << count << endl;
    count = logRecur(n);
    cout << "Number of logarithmic complexity operations (implemented by recursion) = " << count << endl;

    count = linearLogRecur(n);
    cout << "Number of linear logarithmic complexity operations (implemented by recursion) = " << count << endl;

    count = factorialRecur(n);
    cout << "Number of factorial complexity operations (implemented by recursion) = " << count << endl;

    return 0;
}
