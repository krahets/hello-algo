/**
 * File: tree_node.hpp
 * Created Time: 2021-12-19
 * Author: krahets (krahets@163.com)
 */

#pragma once

#include <limits.h>
#include <vector>

using namespace std;

/* 이진 트리 노드 구조체 */
struct TreeNode {
    int val{};
    int height = 0;
    TreeNode *parent{};
    TreeNode *left{};
    TreeNode *right{};
    TreeNode() = default;
    explicit TreeNode(int x, TreeNode *parent = nullptr) : val(x), parent(parent) {
    }
};

// 직렬화 인코딩 규칙은 다음을 참고한다:
// https://www.hello-algo.com/ko/chapter_tree/array_representation_of_tree/
// 이진 트리의 배열 표현:
// [1, 2, 3, 4, None, 6, 7, 8, 9, None, None, 12, None, None, 15]
// 이진 트리의 연결 리스트 표현:
//             /——— 15
//         /——— 7
//     /——— 3
//    |    \——— 6
//    |        \——— 12
// ——— 1
//     \——— 2
//        |    /——— 9
//         \——— 4
//             \——— 8

/* 리스트를 이진 트리로 역직렬화: 재귀 */
TreeNode *vectorToTreeDFS(vector<int> &arr, int i) {
    if (i < 0 || i >= arr.size() || arr[i] == INT_MAX) {
        return nullptr;
    }
    TreeNode *root = new TreeNode(arr[i]);
    root->left = vectorToTreeDFS(arr, 2 * i + 1);
    root->right = vectorToTreeDFS(arr, 2 * i + 2);
    return root;
}

/* 리스트를 이진 트리로 역직렬화 */
TreeNode *vectorToTree(vector<int> arr) {
    return vectorToTreeDFS(arr, 0);
}

/* 이진 트리를 리스트로 직렬화: 재귀 */
void treeToVecorDFS(TreeNode *root, int i, vector<int> &res) {
    if (root == nullptr)
        return;
    while (i >= res.size()) {
        res.push_back(INT_MAX);
    }
    res[i] = root->val;
    treeToVecorDFS(root->left, 2 * i + 1, res);
    treeToVecorDFS(root->right, 2 * i + 2, res);
}

/* 이진 트리를 리스트로 직렬화 */
vector<int> treeToVecor(TreeNode *root) {
    vector<int> res;
    treeToVecorDFS(root, 0, res);
    return res;
}

/* 이진 트리의 메모리를 해제한다 */
void freeMemoryTree(TreeNode *root) {
    if (root == nullptr)
        return;
    freeMemoryTree(root->left);
    freeMemoryTree(root->right);
    delete root;
}
