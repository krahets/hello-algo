/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search for an insertion point (duplicates allowed) */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Any match must lie in [m+1, j]
        } else {
            j = m - 1; // Look in [i, m-1] for the rightmost element less than target
        }
    }
    // Return insertion point i
    return i;
}

/* Use binary search to find the leftmost occurrence of target */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // Equivalent to finding the insertion point for target
    int i = binarySearchInsertion(nums, target);
    // Target not found. Return -1
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // Found target. Return index i
    return i;
}

/* Use binary search to find the rightmost occurrence of target */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // Search for the leftmost occurrence of target + 1
    int i = binarySearchInsertion(nums, target + 1);
    // j points to the rightmost occurrence of target, and i to the first larger element
    int j = i - 1;
    // Target not found. Return -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Found target. Return index j
    return j;
}

/* Driver code */
int main() {
    // Array with duplicates
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);

    // Find the left and right boundaries using binary search
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "The leftmost occurrence of " << target << " is at index " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "The rightmost occurrence of " << target << " is at index " << index << endl;
    }

    return 0;
}
