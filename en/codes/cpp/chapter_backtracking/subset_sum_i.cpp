/**
 * File: subset_sum_i.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: subset sum I */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Record a solution when the subset sums to target
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Try each choice
    // Pruning rule 2: start at start to avoid duplicate subsets
    for (int i = start; i < choices.size(); i++) {
        // Pruning rule 1: break if the subset sum would exceed target
        // The array is sorted, so later elements are at least as large and would also take the sum over target
        if (target - choices[i] < 0) {
            break;
        }
        // Make a choice and update target and start
        state.push_back(choices[i]);
        // Make the next choice
        backtrack(state, target - choices[i], choices, i, res);
        // Backtrack: undo the choice to restore the previous state
        state.pop_back();
    }
}

/* Solve subset sum I */
vector<vector<int>> subsetSumI(vector<int> &nums, int target) {
    vector<int> state;              // State (current subset)
    sort(nums.begin(), nums.end()); // Sort nums
    int start = 0;                  // Starting index
    vector<vector<int>> res;        // Results (list of subsets)
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
    cout << "Subsets that sum to " << target << " (res) = " << endl;
    printVectorMatrix(res);

    return 0;
}
