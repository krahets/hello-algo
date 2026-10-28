/**
 * File : build_tree.c
 * Created Time: 2023-10-16
 * Author : lucas (superrat6@gmail.com)
 */

#include "../utils/common.h"

// 모든 원소가 1000보다 작다고 가정한다
#define MAX_SIZE 1000

/* 이진 트리 구성: 분할 정복 */
TreeNode *dfs(int *preorder, int *inorderMap, int i, int l, int r, int size) {
    // 서브트리 구간이 비어 있으면 종료한다
    if (r - l < 0)
        return NULL;
    // 루트 노드를 초기화한다
    TreeNode *root = (TreeNode *)malloc(sizeof(TreeNode));
    root->val = preorder[i];
    root->left = NULL;
    root->right = NULL;
    // m을 조회하여 왼쪽과 오른쪽 서브트리를 나눈다
    int m = inorderMap[preorder[i]];
    // 부분 문제: 왼쪽 서브트리 구성
    root->left = dfs(preorder, inorderMap, i + 1, l, m - 1, size);
    // 부분 문제: 오른쪽 서브트리 구성
    root->right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r, size);
    // 루트 노드를 반환한다
    return root;
}

/* 이진 트리 구성 */
TreeNode *buildTree(int *preorder, int preorderSize, int *inorder, int inorderSize) {
    // inorder 원소와 인덱스의 대응 관계를 저장할 해시 테이블을 초기화한다
    int *inorderMap = (int *)malloc(sizeof(int) * MAX_SIZE);
    for (int i = 0; i < inorderSize; i++) {
        inorderMap[inorder[i]] = i;
    }
    TreeNode *root = dfs(preorder, inorderMap, 0, 0, inorderSize - 1, inorderSize);
    free(inorderMap);
    return root;
}

/* 실행 코드 */
int main() {
    int preorder[] = {3, 9, 2, 1, 7};
    int inorder[] = {9, 3, 1, 2, 7};
    int preorderSize = sizeof(preorder) / sizeof(preorder[0]);
    int inorderSize = sizeof(inorder) / sizeof(inorder[0]);
    printf("전위 순회 = ");
    printArray(preorder, preorderSize);
    printf("중위 순회 = ");
    printArray(inorder, inorderSize);

    TreeNode *root = buildTree(preorder, preorderSize, inorder, inorderSize);
    printf("구성한 이진 트리:\n");
    printTree(root);

    freeMemoryTree(root);
    return 0;
}
