/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Counting sort */
// Simple implementation; cannot be used to sort objects
void countingSortNaive(vector<int> &nums) {
    // 1. Find the maximum array element m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Traverse counter and fill the original array nums with the elements
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Counting sort */
// Stable implementation that can be adapted to sort objects
void countingSort(vector<int> &nums) {
    // 1. Find the maximum array element m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Count the occurrences of each number
    // counter[num] is the number of occurrences of num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Compute prefix sums of counter to convert occurrence counts into end positions
    // That is, counter[num]-1 is the index of the last occurrence of num in res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums in reverse and place each element in the result array res
    // Initialize array res to store the result
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Place num at the corresponding index
        counter[num]--;              // Decrement the prefix sum by 1 to determine where to place the next occurrence of num
    }
    // Overwrite the original array nums with the result array res
    nums = res;
}

/* Driver code */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "After counting sort (without support for objects), nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "After counting sort, nums1 = ";
    printVector(nums1);

    return 0;
}
