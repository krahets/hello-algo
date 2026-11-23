/**
 * File: binary_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 실행 코드 */
int main() {
    /* 이진 트리 초기화 */
    // 노드 초기화
    TreeNode *n1 = newTreeNode(1);
    TreeNode *n2 = newTreeNode(2);
    TreeNode *n3 = newTreeNode(3);
    TreeNode *n4 = newTreeNode(4);
    TreeNode *n5 = newTreeNode(5);
    // 노드 사이의 참조(포인터)를 설정한다
    n1->left = n2;
    n1->right = n3;
    n2->left = n4;
    n2->right = n5;
    printf("이진 트리 초기화\n");
    printTree(n1);

    /* 노드 삽입과 삭제 */
    TreeNode *P = newTreeNode(0);
    // n1 -> n2 사이에 노드 P를 삽입한다
    n1->left = P;
    P->left = n2;
    printf("노드 P를 삽입한 후\n");
    printTree(n1);

    // 노드 P를 삭제한다
    n1->left = n2;
    // 메모리 해제
    free(P);
    printf("노드 P를 삭제한 후\n");
    printTree(n1);

    freeMemoryTree(n1);
    return 0;
}
