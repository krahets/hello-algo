/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search for an insertion point (no duplicates) */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Any match must lie in [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Any match must lie in [i, m-1]
        } else {
            return m; // Found target. Return insertion point m
        }
    }
    // Target not found. Return insertion point i
    return i;
}

/* Binary search for an insertion point (duplicates allowed) */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Any match must lie in [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Any match must lie in [i, m-1]
        } else {
            j = m - 1; // Look in [i, m-1] for the rightmost element less than target
        }
    }
    // Return insertion point i
    return i;
}

/* Driver code */
int main() {
    // Array without duplicates
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\nArray nums = ";
    printVector(nums);
    // Find the insertion point using binary search
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "Element " << target << " has insertion index " << index << endl;
    }

    // Array with duplicates
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);
    // Find the insertion point using binary search
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "Element " << target << " has insertion index " << index << endl;
    }

    return 0;
}
