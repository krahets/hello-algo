/**
 * File: subset_sum_ii.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking algorithm: Subset Sum II */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // When the subset sum equals target, record the solution
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Traverse all choices
    // Pruning two: start traversing from start to avoid generating duplicate subsets
    // Pruning three: start traversing from start to avoid repeatedly selecting the same element
    for (int i = start; i < choices.size(); i++) {
        // Pruning one: if the subset sum exceeds target, end the loop immediately
        // This is because the array is sorted, and later elements are larger, so the subset sum will definitely exceed target
        if (target - choices[i] < 0) {
            break;
        }
        // Pruning four: if the element equals the left element, it indicates that the search branch is repeated, skip it
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // Attempt: make a choice, update target, start
        state.push_back(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Retract: undo the choice, restore to the previous state
        state.pop_back();
    }
}

/* Solve Subset Sum II */
vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
    vector<int> state;              // State (subset)
    sort(nums.begin(), nums.end()); // Sort nums
    int start = 0;                  // Start point for traversal
    vector<vector<int>> res;        // Result list (subset list)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {4, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumII(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "All subsets summing to " << target << "is" << endl;
    printVectorMatrix(res);

    return 0;
}
