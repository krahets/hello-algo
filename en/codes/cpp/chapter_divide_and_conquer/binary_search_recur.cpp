/**
 * File: binary_search_recur.cpp
 * Created Time: 2023-07-17
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Binary search: problem f(i, j) */
int dfs(vector<int> &nums, int target, int i, int j) {
    // If the interval is empty, the target is absent; return -1
    if (i > j) {
        return -1;
    }
    // Calculate the midpoint index m
    int m = (i + j) / 2;
    if (nums[m] < target) {
        // Recurse on subproblem f(m+1, j)
        return dfs(nums, target, m + 1, j);
    } else if (nums[m] > target) {
        // Recurse on subproblem f(i, m-1)
        return dfs(nums, target, i, m - 1);
    } else {
        // The target element was found; return its index
        return m;
    }
}

/* Binary search */
int binarySearch(vector<int> &nums, int target) {
    int n = nums.size();
    // Solve problem f(0, n-1)
    return dfs(nums, target, 0, n - 1);
}

/* Driver code */
int main() {
    int target = 6;
    vector<int> nums = {1, 3, 6, 8, 12, 15, 23, 26, 31, 35};

    // Binary search (closed interval)
    int index = binarySearch(nums, target);
    cout << "Index of target element 6 = " << index << endl;

    return 0;
}