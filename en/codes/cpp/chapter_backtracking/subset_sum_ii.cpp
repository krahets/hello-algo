/**
 * File: subset_sum_ii.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: subset sum II */
void backtrack(vector<int> &state, int target, vector<int> &choices, int start, vector<vector<int>> &res) {
    // Record a solution when the subset sums to target
    if (target == 0) {
        res.push_back(state);
        return;
    }
    // Try each choice
    // Pruning rule 2: start at start to avoid duplicate subsets
    // Pruning rule 3: start at start to avoid reusing the same element
    for (int i = start; i < choices.size(); i++) {
        // Pruning rule 1: break if the subset sum would exceed target
        // The array is sorted, so later elements are at least as large and would also take the sum over target
        if (target - choices[i] < 0) {
            break;
        }
        // Pruning rule 4: skip a value equal to its left neighbor, since its search branch is a duplicate
        if (i > start && choices[i] == choices[i - 1]) {
            continue;
        }
        // Make a choice and update target and start
        state.push_back(choices[i]);
        // Make the next choice
        backtrack(state, target - choices[i], choices, i + 1, res);
        // Backtrack: undo the choice to restore the previous state
        state.pop_back();
    }
}

/* Solve subset sum II */
vector<vector<int>> subsetSumII(vector<int> &nums, int target) {
    vector<int> state;              // State (current subset)
    sort(nums.begin(), nums.end()); // Sort nums
    int start = 0;                  // Starting index
    vector<vector<int>> res;        // Results (list of subsets)
    backtrack(state, target, nums, start, res);
    return res;
}

/* Driver code */
int main() {
    vector<int> nums = {4, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumII(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "Subsets that sum to  " << target << " : res = " << endl;
    printVectorMatrix(res);

    return 0;
}
