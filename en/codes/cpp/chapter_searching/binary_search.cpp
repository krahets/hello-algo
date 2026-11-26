/**
 * File: binary_search.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search on a closed interval */
int binarySearch(vector<int> &nums, int target) {
    // Initialize the closed interval [0, n-1] with i at the first element and j at the last
    int i = 0, j = nums.size() - 1;
    // Stop when the search interval is empty (i > j)
    while (i <= j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target)    // Any match must lie in [m+1, j]
            i = m + 1;
        else if (nums[m] > target) // Any match must lie in [i, m-1]
            j = m - 1;
        else // Found the target. Return its index
            return m;
    }
    // Target not found. Return -1
    return -1;
}

/* Binary search on a left-closed, right-open interval */
int binarySearchLCRO(vector<int> &nums, int target) {
    // Initialize [0, n) with i at the first element and j one past the last
    int i = 0, j = nums.size();
    // Stop when the search interval is empty (i = j)
    while (i < j) {
        int m = i + (j - i) / 2; // Compute the midpoint index m
        if (nums[m] < target)    // Any match must lie in [m+1, j)
            i = m + 1;
        else if (nums[m] > target) // Any match must lie in [i, m)
            j = m;
        else // Found the target. Return its index
            return m;
    }
    // Target not found. Return -1
    return -1;
}

/* Driver code */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    /* Binary search on a closed interval */
    int index = binarySearch(nums, target);
    cout << "Index of target 6 = " << index << endl;

    /* Binary search on a left-closed, right-open interval */
    index = binarySearchLCRO(nums, target);
    cout << "Index of target 6 = " << index << endl;

    return 0;
}
