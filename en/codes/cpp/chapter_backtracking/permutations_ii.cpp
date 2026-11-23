/**
 * File: permutations_ii.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking: permutations II */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // Record a solution when the state length equals the number of elements
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // Iterate over all choices
    unordered_set<int> duplicated;
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // Prune: do not reuse an element or choose the same value again at this depth
        if (!selected[i] && duplicated.find(choice) == duplicated.end()) {
            // Try: make a choice and update the state
            duplicated.emplace(choice); // Record the chosen value
            selected[i] = true;
            state.push_back(choice);
            // Proceed to the next choice
            backtrack(state, choices, selected, res);
            // Backtrack: undo the choice and restore the previous state
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

    cout << "Input array nums = ";
    printVector(nums);
    cout << "All permutations res = ";
    printVectorMatrix(res);

    return 0;
}
