/**
 * File: binary_search_edge.cpp
 * Created Time: 2023-08-04
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Find an insertion point using binary search (with duplicates) */
int binarySearchInsertion(const vector<int> &nums, int target) {
    int i = 0, j = nums.size() - 1; // Initialize the closed interval [0, n-1]
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target) {
            i = m + 1; // Target must be in [m+1, j] if it exists
        } else {
            j = m - 1; // Continue searching [i, m-1] for the insertion point before any equal elements
        }
    }
    // Return insertion point i
    return i;
}

/* Find the leftmost occurrence of target using binary search */
int binarySearchLeftEdge(vector<int> &nums, int target) {
    // This is equivalent to finding the insertion point of target
    int i = binarySearchInsertion(nums, target);
    // If target was not found, return -1
    if (i == nums.size() || nums[i] != target) {
        return -1;
    }
    // Target was found; return index i
    return i;
}

/* Find the rightmost occurrence of target using binary search */
int binarySearchRightEdge(vector<int> &nums, int target) {
    // Reduce the problem to finding the leftmost insertion point of target + 1
    int i = binarySearchInsertion(nums, target + 1);
    // j points to the rightmost target, while i points to the first element greater than target
    int j = i - 1;
    // If target was not found, return -1
    if (j == -1 || nums[j] != target) {
        return -1;
    }
    // Target was found; return index j
    return j;
}

/* Driver code */
int main() {
    // Array containing duplicate elements
    vector<int> nums = {1, 3, 6, 6, 6, 6, 6, 10, 12, 15};
    cout << "\nArray nums = ";
    printVector(nums);

    // Find the left and right boundaries using binary search
    for (int target : {6, 7}) {
        int index = binarySearchLeftEdge(nums, target);
        cout << "Leftmost occurrence of element " << target << " has index " << index << endl;
        index = binarySearchRightEdge(nums, target);
        cout << "Rightmost occurrence of element " << target << " has index " << index << endl;
    }

    return 0;
}
