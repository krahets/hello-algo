/**
 * File: selection_sort.cpp
 * Created Time: 2023-05-23
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Selection sort */
void selectionSort(vector<int> &nums) {
    int n = nums.size();
    // Outer loop: unsorted range is [i, n-1]
    for (int i = 0; i < n - 1; i++) {
        // Inner loop: find the smallest element within the unsorted range
        int k = i;
        for (int j = i + 1; j < n; j++) {
            if (nums[j] < nums[k])
                k = j; // Record the index of the smallest element
        }
        // Swap the smallest element with the first element of the unsorted range
        swap(nums[i], nums[k]);
    }
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 1, 3, 1, 5, 2};
    selectionSort(nums);

    cout << "After selection sort, nums = ";
    printVector(nums);

    return 0;
}
