/**
 * File: bubble_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Bubble sort */
void bubbleSort(vector<int> &nums) {
    // Outer loop: unsorted range is [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                // Here, the std
                swap(nums[j], nums[j + 1]);
            }
        }
    }
}

/* Bubble sort (optimized with flag)*/
void bubbleSortWithFlag(vector<int> &nums) {
    // Outer loop: unsorted range is [0, i]
    for (int i = nums.size() - 1; i > 0; i--) {
        bool flag = false; // Initialize flag
        // Inner loop: swap the largest element in the unsorted range [0, i] to the right end of the range
        for (int j = 0; j < i; j++) {
            if (nums[j] > nums[j + 1]) {
                // Swap nums[j] and nums[j + 1]
                // Here, the std
                swap(nums[j], nums[j + 1]);
                flag = true; // Record swapped elements
            }
        }
        if (!flag)
            break; // If no elements were swapped in this round of "bubbling", exit
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    bubbleSort(nums);
    cout << "After bubble sort, nums = ";
    printVector(nums);

    vector<int> nums1 = {4, 1, 3, 1, 5, 2};
    bubbleSortWithFlag(nums1);
    cout << "After bubble sort, nums1 = ";
    printVector(nums1);

    return 0;
}
