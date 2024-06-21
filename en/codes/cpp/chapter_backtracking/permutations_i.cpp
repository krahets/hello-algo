/**
 * File: permutations_i.cpp
 * Created Time: 2023-04-24
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Backtracking algorithm: Permutation I */
void backtrack(vector<int> &state, const vector<int> &choices, vector<bool> &selected, vector<vector<int>> &res) {
    // When the state length equals the number of elements, record the solution
    if (state.size() == choices.size()) {
        res.push_back(state);
        return;
    }
    // Traverse all choices
    for (int i = 0; i < choices.size(); i++) {
        int choice = choices[i];
        // Pruning: do not allow repeated selection of elements
        if (!selected[i]) {
            // Attempt: make a choice, update the state
            selected[i] = true;
            state.push_back(choice);
            // Proceed to the next round of selection
            backtrack(state, choices, selected, res);
            // Retract: undo the choice, restore to the previous state
            selected[i] = false;
            state.pop_back();
        }
    }
}

/* Permutation I */
vector<vector<int>> permutationsI(vector<int> nums) {
    vector<int> state;
    vector<bool> selected(nums.size(), false);
    vector<vector<int>> res;
    backtrack(state, nums, selected, res);
    return res;
}

/* Driver Code */
int main() {
    vector<int> nums = {1, 2, 3};

    vector<vector<int>> res = permutationsI(nums);

    cout << "Input array nums = ";
    printVector(nums);
    cout << "All permutations res = ";
    printVectorMatrix(res);

    return 0;
}
