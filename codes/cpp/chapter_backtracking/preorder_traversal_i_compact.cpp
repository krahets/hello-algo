/**
 * File: preorder_traversal_i_compact.cpp
 * Created Time: 2026-05-20
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 */

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

// 二叉树节点结构体
struct TreeNode {
    int val;
    TreeNode *left;
    TreeNode *right;
    TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
};

vector<TreeNode *> res;

/* 前序遍历：查找所有值为 7 的节点 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    // 记录解
    if (root->val == 7) {
        res.push_back(root);
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* 数组转为二叉树（层序） */
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

/* 简易打印二叉树（层序） */
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

/* 打印向量 */
void printVector(vector<int> vec) {
    cout << "[ ";
    for (int v : vec) cout << v << " ";
    cout << "]" << endl;
}

/* Driver Code */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "初始化二叉树：" << endl;
    printTree(root);

    // 前序遍历查找
    preOrder(root);

    cout << "\n输出所有值为 7 的节点：" << endl;
    vector<int> vals;
    for (TreeNode *node : res) {
        vals.push_back(node->val);
    }
    printVector(vals);

    return 0;
}
