/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Check if the current state is a solution */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* Record solution */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* Check if the choice is valid under the current state */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* Update state */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* Restore state */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* Backtracking algorithm: Example 3 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // Check if it is a solution
    if (isSolution(state)) {
        // Record solution
        recordSolution(state, res);
    }
    // Traverse all choices
    for (TreeNode *choice : choices) {
        // Pruning: check if the choice is valid
        if (isValid(state, choice)) {
            // Attempt: make choice, update state
            makeChoice(state, choice);
            // Proceed to the next round of selection
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // Backtrack: undo choice, restore to previous state
            undoChoice(state, choice);
        }
    }
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\nInitialize binary tree" << endl;
    printTree(root);

    // Backtracking algorithm
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\nOutput all paths from root node to node 7, requiring paths do not include nodes with value 3" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
