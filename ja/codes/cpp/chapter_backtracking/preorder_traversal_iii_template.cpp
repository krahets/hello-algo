/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 現在の状態が解かどうかを判定 */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* 解を記録 */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* 現在の状態で、この選択が有効かどうかを判定 */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* 状態を更新 */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* 状態を元に戻す */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* バックトラッキング：例題 3 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // 解かどうかを確認
    if (isSolution(state)) {
        // 解を記録
        recordSolution(state, res);
    }
    // すべての選択肢を走査
    for (TreeNode *choice : choices) {
        // 枝刈り：選択が妥当かを確認する
        if (isValid(state, choice)) {
            // 試行: 選択を行い、状態を更新
            makeChoice(state, choice);
            // 次の選択へ進む
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // バックトラック：選択を取り消し、前の状態に戻す
            undoChoice(state, choice);
        }
    }
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n二分木を初期化" << endl;
    printTree(root);

    // バックトラッキング法
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\n根ノードからノード 7 までのすべての経路を出力し、経路に値 3 のノードを含めない" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
