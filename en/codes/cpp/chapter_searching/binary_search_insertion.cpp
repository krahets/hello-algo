/**
 * File: binary_search_insertion.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Find an insertion point using binary search (no duplicates) */
int binarySearchInsertionSimple(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            return m; // Target was found; return insertion point m
        }
    }
    // Target was not found; return insertion point i
    return i;
}

/* Find an insertion point using binary search (with duplicates) */
int binarySearchInsertion(vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else if (nums[m] > target) {
            j = m - 1; // Target must be in [i, m-1] if it exists
        } else {
            j = m - 1; // Continue searching [i, m-1] for the insertion point before any equal elements
        }
    }
    // Return insertion point i
    return i;
}

/* Driver code */
int main() {
    // Array with no duplicate elements
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};
    cout << "\nArray nums = ";
    printVector(nums);
    // Find an insertion point using binary search
    for (int target : {6, 9}) {
        int index = binarySearchInsertionSimple(nums, target);
        cout << "Element " << target << " has insertion index " << index << endl;
    }

    // Array containing duplicate elements
    nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);
    // Find an insertion point using binary search
    for (int target : {2, 6, 20}) {
        int index = binarySearchInsertion(nums, target);
        cout << "Element " << target << " has insertion index " << index << endl;
    }

    return 0;
}
