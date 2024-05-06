/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search for insertion point (no duplicate elements) */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize double closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target is in interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Target is in interval [i, m-1]
        } else {
            return m; // Found target, return insertion point m
        }
    }
    // Did not find target, return insertion point i
    return i;
}

/* Binary search for insertion point (with duplicate elements) */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize double closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target is in interval [m+1, j]
        } else if (nums[m] > target) {
            j = m - 1; // Target is in interval [i, m-1]
        } else {
            j = m - 1; // First element less than target is in interval [i, m-1]
        }
    }
    // Return insertion point i
    return i;
}

/* Driver Code */
int main() {
    // Array without duplicate elements
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\nArray nums = ";
    printVector(nums);
    // Binary search for insertion point
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "The insertion point index for element " << target << " is " << index << endl;
    }

    // Array with duplicate elements
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);
    // Binary search for insertion point
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "The insertion point index for element " << target << " is " << index << endl;
    }

    return 0;
}
