/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search for insertion point (with duplicate elements) */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // target is in the interval [m+1, j]
        } else {
            j = m - 1; // The first element less than target is in the interval [i, m-1]
        }
    }
    // Return insertion point i
    return i;
}

/* Binary search for the leftmost target */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // Equivalent to finding the insertion point of target
    int i = binarySearchInsertion(nums, target);
    // Target not found, return -1
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // Found target, return index i
    return i;
}

/* Binary search for the rightmost target */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // Convert to finding the leftmost target + 1
    int i = binarySearchInsertion(nums, target + 1);
    // j points to the rightmost target, i points to the first element greater than target
    int j = i - 1;
    // Target not found, return -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Found target, return index j
    return j;
}

/* Driver Code */
int main() {
    // Array with duplicate elements
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);

    // Binary search left and right boundaries
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "Index of leftmost element " << target << " is " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "Index of rightmost element " << target << " is " << index << endl;
    }

    return 0;
}
