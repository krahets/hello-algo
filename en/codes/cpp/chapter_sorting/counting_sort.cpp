/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Counting sort */
// Simple implementation, cannot be used for sorting objects
void countingSortNaive(vector<int> &nums) {
    // 1. Count the maximum element m in the array
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Count the occurrence of each digit
    // counter[num] represents the occurrence of num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Traverse counter, filling each element back into the original array nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Counting sort */
// Complete implementation, can sort objects and is a stable sort
void countingSort(vector<int> &nums) {
    // 1. Count the maximum element m in the array
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Count the occurrence of each digit
    // counter[num] represents the occurrence of num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Calculate the prefix sum of counter, converting "occurrence count" to "tail index"
    // counter[num]-1 is the last index where num appears in res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums in reverse order, placing each element into the result array res
    // Initialize the array res to record results
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Place num at the corresponding index
        counter[num]--;              // Decrement the prefix sum by 1, getting the next index to place num
    }
    // Use result array res to overwrite the original array nums
    nums = res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "After count sort (unable to sort objects), nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "After count sort, nums1 = ";
    printVector(nums1);

    return 0;
}
