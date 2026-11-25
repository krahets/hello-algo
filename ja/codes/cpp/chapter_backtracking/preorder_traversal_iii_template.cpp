/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 現在の状態が解かどうか判定する */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* 解を記録する */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* 現在の状態でその選択が可能か判定する */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* 状態を更新する */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* 状態を元に戻す */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* バックトラッキング：例題 3 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // 解かどうか調べる
    if (isSolution(state)) {
        // 解を記録する
        recordSolution(state, res);
    }
    // すべての選択肢を調べる
    for (TreeNode *choice : choices) {
        // 枝刈り：その選択が可能か調べる
        if (isValid(state, choice)) {
            // 試行：選択して状態を更新する
            makeChoice(state, choice);
            // 次の選択に進む
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);
            // 後戻り：選択を取り消し、元の状態に戻す
            undoChoice(state, choice);
        }
    }
}

/* 実行例 */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n二分木を初期化" << endl;
    printTree(root);

    // バックトラッキング
    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;
    backtrack(state, choices, res);

    cout << "\n根から値が 7 のノードまでの経路のうち、値が 3 のノードを含まないものをすべて出力" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
