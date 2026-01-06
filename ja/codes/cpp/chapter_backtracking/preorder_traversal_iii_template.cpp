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

/* 現在の状態下で選択が合法かどうかを判定 */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* 状態を更新 */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* 状態を復元 */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* バックトラッキングアルゴリズム：例３ */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // 解かどうかをチェック
    if (isSolution(state)) {
        // 解を記録
        recordSolution(state, res);
    }
    // すべての選択肢を走査
    for (TreeNode *choice : choices) {
        // 剪定：選択が合法かどうかをチェック
        if (isValid(state, choice)) {
            // 試行：選択を行い、状態を更新
            makeChoice(state, choice);
            // 次のラウンドの選択に進む
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // 回退：選択を取り消し、前の状態に復元
            undoChoice(state, choice);
        }
    }
}

/* ドライバーコード */
int main() {
    vector<int> arr = {1, 7, 3, 4, 5, 6, 7};
    TreeNode *root = vecToTree(arr);
    cout << "\n二分木を初期化" << endl;
    printTree(root);

    // バックトラッキングアルゴリズム
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\nルートからノード7までのすべてのパスを出力、パスには値3のノードを含まないことが要求される" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }

    return 0;
}