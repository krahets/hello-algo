/**
 * File: preorder_traversal_ii_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> path;
vector<vector<TreeNode *>> res;

/* 전위 순회: 예제 2 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    // 시도
    path.push_back(root);
    if (root->val == 7) {
        // 해를 기록한다
        res.push_back(path);
    }
    preOrder(root->left);
    preOrder(root->right);
    // 되돌리기
    path.pop_back();
}

/* 실행 코드 */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n이진 트리 초기화" << endl;
    printTree(root);

    // 전위 순회
    preOrder(root);

    cout << "\n루트 노드에서 노드 7까지의 모든 경로 출력" << endl;
    for (vector<TreeNode *> &path : res) {
        vector<int> vals;
        for (TreeNode *node : path) {
            vals.push_back(node->val);
        }
        printVector(vals);
    }
}
