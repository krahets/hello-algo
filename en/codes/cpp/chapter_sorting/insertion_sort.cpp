/**
 * File: insertion_sort.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Insertion sort */
void insertionSort(vector<int> &nums) {
    // Outer loop: sorted range is [0, i-1]
    for (int i = 1; i < nums.size(); i++) {
        int base = nums[i], j = i - 1;
        // Inner loop: insert base into the correct position within the sorted range [0, i-1]
        while (j >= 0 && nums[j] > base) {
            nums[j + 1] = nums[j]; // Move nums[j] to the right by one position
            j--;
        }
        nums[j + 1] = base; // Assign base to the correct position
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    insertionSort(nums);
    cout << "After insertion sort, nums = ";
    printVector(nums);

    return 0;
}
