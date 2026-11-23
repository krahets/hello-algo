/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: subset sum I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // Record a solution when the subset sum equals target
    if (total == target) {
        res.push_back(state);
        return;
    }
    // Iterate over all choices
    for (size_t i = 0; i < choices.size(); i++) {
        // Prune: skip this choice if the subset sum would exceed target
        if (total + choices[i] > target) {
            continue;
        }
        // Try: make a choice and update the sum total
        state.push_back(choices[i]);
        // Proceed to the next choice
        backtrack(state, target, total + choices[i], choices, res);
        // Backtrack: undo the choice and restore the previous state
        state.pop_back();
    }
}

/* Solve subset sum I (with duplicate subsets) */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // State (subset)
    int total = 0;           // Subset sum
    vector<vector<int>> res; // Result list (list of subsets)
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
    cout << "All subsets with sum " << target << " , res = " << endl;
    printVectorMatrix(res);

    return 0;
}
