/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Check whether the current state is a solution */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* Record the solution */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* Check whether the choice is valid in the current state */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* Update the state */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* Restore the state */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* Backtracking: example 3 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // Check whether this is a solution
    if (isSolution(state)) {
        // Record the solution
        recordSolution(state, res);
    }
    // Iterate over all choices
    for (TreeNode *choice : choices) {
        // Prune: check whether the choice is valid
        if (isValid(state, choice)) {
            // Try: make a choice and update the state
            makeChoice(state, choice);
            // Proceed to the next choice
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // Backtrack: undo the choice and restore the previous state
            undoChoice(state, choice);
        }
    }
}

/* Driver code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nInitialize the binary tree" << endl;
    printTree(root);

    // Backtracking algorithm
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\nOutput all paths from the root to nodes with value 7, requiring that no node on the path has value 3" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
