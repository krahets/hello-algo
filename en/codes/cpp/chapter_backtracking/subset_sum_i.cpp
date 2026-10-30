/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: subset sum I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Record a solution when the remaining target reaches 0
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Iterate over all choices
    // Pruning 2: iterate from start to avoid generating duplicate subsets
    for (int i = start; i < choices.size(); i++) {
        // Pruning 1: exit the loop if this choice exceeds the remaining target
        // The array is sorted, so later elements are at least as large and also exceed the remaining target
        if (target - choices[i] < 0) {
            break;
        }
        // Try: make a choice and update target and start
        state.push_back(choices[i]);
        // Proceed to the next choice
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo the choice and restore the previous state
        state.pop_back();
    }
}

/* Solve subset sum I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // State (subset)
    sort(nums.begin(), nums.end()); // Sort nums
    int start = 0;                  // Starting index for iteration
    vector<vector<int>> res;        // Result list (list of subsets)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumI(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "All subsets with sum " << target << " , res = " << endl;
    printVectorMatrix(res);

    return 0;
}
