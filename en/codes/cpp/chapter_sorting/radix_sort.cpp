/**
 * File: radix_sort.cpp
 * Created Time: 2023-03-26
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Get the k-th digit of num, where exp = 10^(k-1) */
int digit(int num, int exp) {
    // Passing exp instead of k avoids repeatedly performing expensive exponentiation here
    return (num / exp) % 10;
}

/* Counting sort (sort nums by the k-th digit) */
void countingSortDigit(vector<int> &nums, int exp) {
    // Decimal digits range from 0 to 9, so the bucket array needs length 10
    vector<int> counter(10, 0);
    int n = nums.size();
    // Count the occurrences of each digit from 0 to 9
    for (int i = 0; i < n; i++) {
        int d = digit(nums[i], exp); // Get the k-th digit of nums[i] and store it in d
        counter[d]++;                // Count the occurrences of digit d
    }
    // Compute prefix sums to convert occurrence counts into array positions
    for (int i = 1; i < 10; i++) {
        counter[i] += counter[i - 1];
    }
    // Traverse in reverse and place each element into res according to the bucket counts
    vector<int> res(n, 0);
    for (int i = n - 1; i >= 0; i--) {
        int d = digit(nums[i], exp);
        int j = counter[d] - 1; // Get the destination index j for digit d in the array
        res[j] = nums[i];       // Place the current element at index j
        counter[d]--;           // Decrease the count for d by 1
    }
    // Overwrite the original array nums with the result
    for (int i = 0; i < n; i++)
        nums[i] = res[i];
}

/* Radix sort */
void radixSort(vector<int> &nums) {
    // Get the largest array element to determine the maximum number of digits
    int m = *max_element(nums.begin(), nums.end());
    // Process digits from least significant to most significant
    for (int exp = 1; exp <= m; exp *= 10)
        // Apply counting sort to the k-th digit of the array elements
        // k = 1 -> exp = 1
        // k = 2 -> exp = 10
        // That is, exp = 10^(k-1)
        countingSortDigit(nums, exp);
}

/* Driver code */
int main() {
    // Radix sort
    vector<int> nums = {10546151, 35663510, 42865989, 34862445, 81883077,
                        88906420, 72429244, 30524779, 82060337, 63832996};
    radixSort(nums);
    cout << "After radix sort, nums = ";
    printVector(nums);

    return 0;
}
