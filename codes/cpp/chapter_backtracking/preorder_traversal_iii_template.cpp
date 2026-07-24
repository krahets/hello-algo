/**
 * File: preorder_traversal_iii_template.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

// 二叉树节点定义
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int val) : val(val), left(nullptr), right(nullptr) {}
};

/* 判断当前状态是否为解 */
bool isSolution(vector<TreeNode *> &state) {
    return !state.empty() && state.back()->val == 7;
}

/* 记录解 */
void recordSolution(vector<TreeNode *> &state, vector<vector<TreeNode *>> &res) {
    res.push_back(state);
}

/* 判断在当前状态下，该选择是否合法 */
bool isValid(vector<TreeNode *> &state, TreeNode *choice) {
    return choice != nullptr && choice->val != 3;
}

/* 更新状态 */
void makeChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.push_back(choice);
}

/* 恢复状态 */
void undoChoice(vector<TreeNode *> &state, TreeNode *choice) {
    state.pop_back();
}

/* 回溯算法：标准模板 */
void backtrack(vector<TreeNode *> &state, vector<TreeNode *> &choices, vector<vector<TreeNode *>> &res) {
    // 检查是否为解
    if (isSolution(state)) {
        recordSolution(state, res);
    }

    // 遍历所有选择
    for (TreeNode *choice : choices) {
        // 剪枝：过滤不合法选择
        if (isValid(state, choice)) {
            // 选择
            makeChoice(state, choice);

            // 下一层：左右孩子
            vector<TreeNode *> nextChoices{choice->left, choice->right};
            backtrack(state, nextChoices, res);

            // 撤销
            undoChoice(state, choice);
        }
    }
}

/* 数组转二叉树（层序） */
TreeNode* vectorToTree(vector<int> arr) {
    if (arr.empty()) return nullptr;
    TreeNode* root = new TreeNode(arr[0]);
    queue<TreeNode*> q;
    q.push(root);
    int i = 1;
    while (!q.empty() && i < arr.size()) {
        TreeNode* cur = q.front();
        q.pop();
        if (i < arr.size()) {
            cur->left = new TreeNode(arr[i++]);
            q.push(cur->left);
        }
        if (i < arr.size()) {
            cur->right = new TreeNode(arr[i++]);
            q.push(cur->right);
        }
    }
    return root;
}

/* 打印二叉树 */
void printTree(TreeNode* root) {
    if (!root) return;
    queue<TreeNode*> q;
    q.push(root);
    while (!q.empty()) {
        TreeNode* node = q.front();
        q.pop();
        cout << node->val << " ";
        if (node->left) q.push(node->left);
        if (node->right) q.push(node->right);
    }
    cout << endl;
}

/* 打印路径 */
void printVector(vector<int> vec) {
    cout << "[ ";
    for (int v : vec) cout << v << " ";
    cout << "]\n";
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree({1, 7, 3, 4, 5, 6, 7});
    cout << "初始化二叉树：\n";
    printTree(root);

    vector<TreeNode *> state;
    vector<TreeNode *> choices = {root};
    vector<vector<TreeNode *>> res;

    backtrack(state, choices, res);

    cout << "\n所有根到 7 且不经过 3 的路径：\n";
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }

    return 0;
}
