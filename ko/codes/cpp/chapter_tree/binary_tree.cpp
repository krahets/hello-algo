/**
 * File: binary_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 실행 코드 */
int main() {
    /* 이진 트리 초기화 */
    // 노드 초기화
    TreeNode *n1 = new TreeNode(1);
    TreeNode *n2 = new TreeNode(2);
    TreeNode *n3 = new TreeNode(3);
    TreeNode *n4 = new TreeNode(4);
    TreeNode *n5 = new TreeNode(5);
    // 노드 사이의 참조(포인터)를 설정한다
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    cout << endl << "이진 트리 초기화\n" << endl;
    printTree(n1);

    /* 노드 삽입과 삭제 */
    TreeNode *P = new TreeNode(0);
    // n1 -> n2 사이에 노드 P를 삽입한다
    n1->left = P;
    P->left = n2;
    cout << endl << "노드 P를 삽입한 후\n" << endl;
    printTree(n1);
    // 노드 P를 삭제한다
    n1->left = n2;
    delete P; // 메모리 해제
    cout << endl << "노드 P를 삭제한 후\n" << endl;
    printTree(n1);

    // 메모리 해제
    freeMemoryTree(n1);

    return 0;
}
