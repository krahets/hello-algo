/**
 * File: counting_sort.cpp
 * Created Time: 2023-03-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Counting sort */
// Simple implementation that cannot sort objects
void countingSortNaive(vector<int> &nums) {
    // 1. Find the largest array element m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Traverse counter and write each value back into nums
    int i = 0;
    for (int num = 0; num < m + 1; num++) {
        for (int j = 0; j < counter[num]; j++, i++) {
            nums[i] = num;
        }
    }
}

/* Counting sort */
// Full implementation that can sort objects and is stable
void countingSort(vector<int> &nums) {
    // 1. Find the largest array element m
    int m = 0;
    for (int num : nums) {
        m = max(m, num);
    }
    // 2. Count the occurrences of each number
    // counter[num] holds the number of occurrences of num
    vector<int> counter(m + 1, 0);
    for (int num : nums) {
        counter[num]++;
    }
    // 3. Compute prefix sums in counter to locate the last position for each value
    // That is, counter[num]-1 is the last index of num in res
    for (int i = 0; i < m; i++) {
        counter[i + 1] += counter[i];
    }
    // 4. Traverse nums backward and place each element in the result array res
    // Initialize the result array res
    int n = nums.size();
    vector<int> res(n);
    for (int i = n - 1; i >= 0; i--) {
        int num = nums[i];
        res[counter[num] - 1] = num; // Place num at its corresponding index
        counter[num]--;              // Decrement the prefix sum by 1 to find the next index for num
    }
    // Copy res back into the original array nums
    nums = res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSortNaive(nums);
    cout << "After counting sort (values only), nums = ";
    printVector(nums);

    vector<int> nums1 = {1, 0, 1, 2, 0, 4, 0, 2, 2, 4};
    countingSort(nums1);
    cout << "After counting sort, nums1 = ";
    printVector(nums1);

    return 0;
}
