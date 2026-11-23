/**
 * File: preorder_traversal_i_compact.cpp
 * Created Time: 2023-04-16
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

vector<TreeNode *> res;

/* 전위 순회: 예제 1 */
void preOrder(TreeNode *root) {
    if (root == nullptr) {
        return;
    }
    if (root->val == 7) {
        // 해를 기록한다
        res.push_back(root);
    }
    preOrder(root->left);
    preOrder(root->right);
}

/* 실행 코드 */
int main() {
    TreeNode *root = vectorToTree(vector<int>{1, 7, 3, 4, 5, 6, 7});
    cout << "\n이진 트리 초기화" << endl;
    printTree(root);

    // 전위 순회
    preOrder(root);

    cout << "\n값이 7인 모든 노드 출력" << endl;
    vector<int> vals;
    for (TreeNode *node : res) {
        vals.push_back(node->val);
    }
    printVector(vals);
}
