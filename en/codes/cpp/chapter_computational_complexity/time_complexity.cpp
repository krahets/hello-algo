/**
 * File: time_complexity.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Constant time */
int constant(int n) {
    int count = 0;
    int size = 100000;
    for (int i = 0; i < size; i++)
        count++;
    return count;
}

/* Linear time */
int linear(int n) {
    int count = 0;
    for (int i = 0; i < n; i++)
        count++;
    return count;
}

/* Linear time (array traversal) */
int arrayTraversal(vector<int> &nums) {
    int count = 0;
    // The iteration count is proportional to the array length
    for (int num : nums) {
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
int bubbleSort(vector<int> &nums) {
    int count = 0; // Counter
    // Outer loop: the unsorted range is the closed interval [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
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
    int count = 0, base = 1;
    // Each cell divides in two per round, giving 1, 2, 4, 8, ..., 2^(n-1)
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < base; j++) {
            count++;
        }
        base *= 2;
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
    // Split one problem into n subproblems
    for (int i = 0; i < n; i++) {
        count += factorialRecur(n - 1);
    }
    return count;
}

/* Driver Code */
int main() {
    // Try different values of n to see how the operation count grows for each complexity
    int n = 8;
    cout << "Input size n = " << n << endl;

    int count = constant(n);
    cout << "Constant operation count = " << count << endl;

    count = linear(n);
    cout << "Linear operation count = " << count << endl;
    vector<int> arr(n);
    count = arrayTraversal(arr);
    cout << "Linear operation count (array traversal) = " << count << endl;

    count = quadratic(n);
    cout << "Quadratic operation count = " << count << endl;
    vector<int> nums(n);
    for (int i = 0; i < n; i++)
        nums[i] = n - i; // [n,n-1,...,2,1]
    count = bubbleSort(nums);
    cout << "Quadratic operation count (bubble sort) = " << count << endl;

    count = exponential(n);
    cout << "Exponential operation count (iterative) = " << count << endl;
    count = expRecur(n);
    cout << "Exponential operation count (recursive) = " << count << endl;

    count = logarithmic(n);
    cout << "Logarithmic operation count (iterative) = " << count << endl;
    count = logRecur(n);
    cout << "Logarithmic operation count (recursive) = " << count << endl;

    count = linearLogRecur(n);
    cout << "Linearithmic operation count (recursive) = " << count << endl;

    count = factorialRecur(n);
    cout << "Factorial operation count (recursive) = " << count << endl;

    return 0;
}
