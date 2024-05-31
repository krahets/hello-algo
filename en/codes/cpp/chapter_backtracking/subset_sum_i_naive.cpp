/**
 * File: subset_sum_i_naive.cpp
 * Created Time: 2023-06-21
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking algorithm: Subset Sum I */
void backtrack(vector<int> &state, int target, int total, vector<int> &choices, vector<vector<int>> &res) {
    // When the subset sum equals target, record the solution
    if (total == target) {
        res.push_back(state);
        return;
    }
    // Traverse all choices
    for (size_t i = 0; i < choices.size(); i++) {
        // Pruning: if the subset sum exceeds target, skip that choice
        if (total + choices[i] > target) {
            continue;
        }
        // Attempt: make a choice, update elements and total
        state.push_back(choices[i]);
        // Proceed to the next round of selection
        backtrack(state, target, total + choices[i], choices, res);
        // Retract: undo the choice, restore to the previous state
        state.pop_back();
    }
}

/* Solve Subset Sum I (including duplicate subsets) */
vector<vector<int>> subsetSumINaive(vector<int> &nums, int target) {
    vector<int> state;       // State (subset)
    int total = 0;           // Subset sum
    vector<vector<int>> res; // Result list (subset list)
    backtrack(state, target, total, nums, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {3, 4, 5};
    int target = 9;

    vector<vector<int>> res = subsetSumINaive(nums, target);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "target = " << target << endl;
    cout << "All subsets summing to " << target << "is" << endl;
    printVectorMatrix(res);

    return 0;
}
