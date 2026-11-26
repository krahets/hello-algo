/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: subset sum I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // Record a solution when the subset sums to target
    if (total == target) {
        res.push_back(state);
        return;
    }
    // Try each choice
    for (size_t i = 0; i < choices.size(); i++) {
        // Prune: skip choices that would take the subset sum over target
        if (total + choices[i] > target) {
            continue;
        }
        // Make a choice and update the running sum total
        state.push_back(choices[i]);
        // Make the next choice
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo the choice to restore the previous state
        state.pop_back();
    }
}

/* Solve subset sum I (including duplicate subsets) */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // State (current subset)
    int total = 0;           // Subset sum
    vector<vector<int>> res; // Results (list of subsets)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Subsets that sum to  " << target << " : res = " << endl;
    printVectorMatrix(res);

    return 0;
}
