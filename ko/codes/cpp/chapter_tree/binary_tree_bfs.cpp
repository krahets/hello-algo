/**
 * File: binary_tree_bfs.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 레벨 순회 */
vector<int> levelOrder(TreeNode *root) {
    // 큐를 초기화하고 루트 노드를 넣는다
    queue<TreeNode *> queue;
    queue.push(root);
    // 순회 결과를 저장할 리스트를 초기화한다
    vector<int> vec;
    while (!queue.empty()) {
        TreeNode *node = queue.front();
        queue.pop();              // 큐에서 노드를 꺼낸다
        vec.push_back(node->val); // 노드 값을 저장한다
        if (node->left != nullptr)
            queue.push(node->left); // 왼쪽 자식을 큐에 넣는다
        if (node->right != nullptr)
            queue.push(node->right); // 오른쪽 자식을 큐에 넣는다
    }
    return vec;
}

/* 실행 코드 */
int main() {
    /* 이진 트리 초기화 */
    // 배열에서 바로 이진 트리를 만드는 함수를 사용한다
    TreeNode *root = vectorToTree(vector<int>{1, 2, 3, 4, 5, 6, 7});
    cout << endl << "이진 트리 초기화\n" << endl;
    printTree(root);

    /* 레벨 순회 */
    vector<int> vec = levelOrder(root);
    cout << endl << "레벨 순회로 출력한 노드 순서 = ";
    printVector(vec);

    return 0;
}
