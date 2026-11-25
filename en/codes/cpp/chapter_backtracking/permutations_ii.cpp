/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: permutations II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // Record a solution when the state contains all the elements
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // Try each choice
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // Skip elements already in use and values already tried at this level
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // Make a choice and update the state
            duplicated.emplace(choice); // Track values already tried
            selected[i] = true;
            state.push_back(choice);
            // Make the next choice
            backtrack(state, choices, selected, res);
            // Backtrack: undo the choice to restore the previous state
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* Permutations II */
vector<vector<int>> permutationsII(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Driver code */
int main() {
    vector<int> nums = {1, 1, 2};

    vector<vector<int>> res = permutationsII(nums);

    cout << "Input array nums =  ";
    printVector(nums);
    cout << "All permutations res =  ";
    printVectorMatrix(res);

    return 0;
}
