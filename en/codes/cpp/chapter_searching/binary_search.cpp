/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search (closed interval) */
int binarySearch(vector<int> &nums, int target) {
    // Initialize the closed interval [0, n-1], with i and j pointing to the first and last elements
    int i = 0, j = nums.size() - 1;
    // Loop until the search interval is empty (when i > j)
    while (i <= j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target)    // In this case, target must be in [m+1, j] if it exists
            i = m + 1;
        else if (nums[m] > target) // In this case, target must be in [i, m-1] if it exists
            j = m - 1;
        else // The target element was found; return its index
            return m;
    }
    // The target element was not found; return -1
    return -1;
}

/* Binary search (left-closed, right-open interval) */
int binarySearchLCRO(vector<int> &nums, int target) {
    // Initialize the left-closed, right-open interval [0, n), with i at the first element and j one past the last
    int i = 0, j = nums.size();
    // Loop until the search interval is empty (when i = j)
    while (i < j) {
        int m = i + (j - i) / 2; // Calculate the midpoint index m
        if (nums[m] < target)    // In this case, target must be in [m+1, j) if it exists
            i = m + 1;
        else if (nums[m] > target) // In this case, target must be in [i, m) if it exists
            j = m;
        else // The target element was found; return its index
            return m;
    }
    // The target element was not found; return -1
    return -1;
}

/* Driver code */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* Binary search (closed interval) */
    int index = binarySearch(nums, target);
    cout << "Index of target element 6 = " << index << endl;

    /* Binary search (left-closed, right-open interval) */
    index = binarySearchLCRO(nums, target);
    cout << "Index of target element 6 = " << index << endl;

    return 0;
}
