/**
 * File: binary_tree_dfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

// 순회 순서를 저장할 리스트를 초기화한다
vector<int> vec;

/* 전위 순회 */
void preOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 방문 우선순위: 루트 노드 -> 왼쪽 서브트리 -> 오른쪽 서브트리
    vec.push_back(root->val);
    preOrder(root->left);
    preOrder(root->right);
}

/* 중위 순회 */
void inOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 방문 우선순위: 왼쪽 서브트리 -> 루트 노드 -> 오른쪽 서브트리
    inOrder(root->left);
    vec.push_back(root->val);
    inOrder(root->right);
}

/* 후위 순회 */
void postOrder(TreeNode *root) {
    if (root == nullptr)
        return;
    // 방문 우선순위: 왼쪽 서브트리 -> 오른쪽 서브트리 -> 루트 노드
    postOrder(root->left);
    postOrder(root->right);
    vec.push_back(root->val);
}

/* 실행 코드 */
int main() {
    /* 이진 트리 초기화 */
    // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "이진 트리 초기화\n" << endl;
    printTree(root);

    /* 전위 순회 */
    vec.clear();
    preOrder(root);
    cout << endl << "전위 순회의 노드 출력 순서 = ";
    printVector(vec);

    /* 중위 순회 */
    vec.clear();
    inOrder(root);
    cout << endl << "중위 순회의 노드 출력 순서 = ";
    printVector(vec);

    /* 후위 순회 */
    vec.clear();
    postOrder(root);
    cout << endl << "후위 순회의 노드 출력 순서 = ";
    printVector(vec);

    return 0;
}
