/**
 * File: preorder_traversal_iii_compact.cpp
 * Created Time: 2025-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

// 二叉树节点结构
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* 前序遍历 + 剪枝 + 回溯 */
void preOrder(TreeNode *root) {
    // 剪枝：空节点 或 遇到值为 3 的节点，直接停止
    if (root == nullptr || root->val == 3) {
        return;
    }

    // 尝试：加入当前节点到路径
    path.push_back(root);

    // 找到目标节点 7，记录路径
    if (root->val == 7) {
        res.push_back(path);
    }

    // 递归左右子树
    preOrder(root->left);
    preOrder(root->right);

    // 回退：撤销选择
    path.pop_back();
}

/* 数组转二叉树（层序） */
TreeNode* vectorToTree(vector<int> arr) {
    if (arr.empty()) return nullptr;
    TreeNode* root = new TreeNode(arr[0]);
    queue<TreeNode*> q;
    q.push(root);
    int i = 1;
    while (!q.empty() && i < arr.size()) {
        TreeNode* curr = q.front();
        q.pop();
        if (i < arr.size()) {
            curr->left = new TreeNode(arr[i++]);
            q.push(curr->left);
        }
        if (i < arr.size()) {
            curr->right = new TreeNode(arr[i++]);
            q.push(curr->right);
        }
    }
    return root;
}

/* 层序打印二叉树 */
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

/* 打印数组 */
void printVector(vector<int> vec) {
    cout << "[ ";
    for (int v : vec)
        cout << v << " ";
    cout << "]" << endl;
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "初始化二叉树：" << endl;
    printTree(root);

    // 前序遍历（剪枝：不经过 3）
    preOrder(root);

    cout << "\n根到节点 7 的路径（不包含 3）：" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }

    return 0;
}
