/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* Driver Code */
int main() {
    /* 初始化二元樹 */
    // 初始化節點
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // 構建節點之間的引用（指標）
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    cout << endl << "初始化二元樹\n" << endl;
    printTree(n1);

    /* 插入與刪除節點 */
    TreeNode *P = new TreeNode(0);
    // 在 n1 -> n2 中間插入節點 P
    n1->left = P;
    P->left = n2;
    cout << endl << "插入節點 P 後\n" << endl;
    printTree(n1);
    // 刪除節點 P
    n1->left = n2;
    delete P; // 釋放記憶體
    cout << endl << "刪除節點 P 後\n" << endl;
    printTree(n1);

    // 釋放記憶體
    freeMemoryTree(n1);

    return 0;
}
