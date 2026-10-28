/**
 * File: binary_search_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 이진 탐색 트리 구조체 */
typedef struct {
    TreeNode *root;
} BinarySearchTree;

/* 생성자 */
BinarySearchTree *newBinarySearchTree() {
    // 빈 트리를 초기화한다
    BinarySearchTree *bst = (BinarySearchTree *)malloc(sizeof(BinarySearchTree));
    bst->root = NULL;
    return bst;
}

/* 소멸자 */
void delBinarySearchTree(BinarySearchTree *bst) {
    freeMemoryTree(bst->root);
    free(bst);
}

/* 이진 트리의 루트 노드 반환 */
TreeNode *getRoot(BinarySearchTree *bst) {
    return bst->root;
}

/* 노드 탐색 */
TreeNode *search(BinarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // 반복하여 탐색하다 리프 노드를 지나면 종료한다
    while (cur != NULL) {
        if (cur->val < num) {
            // 목표 노드는 cur의 오른쪽 서브트리에 있다
            cur = cur->right;
        } else if (cur->val > num) {
            // 목표 노드는 cur의 왼쪽 서브트리에 있다
            cur = cur->left;
        } else {
            // 목표 노드를 찾았으므로 반복문을 종료한다
            break;
        }
    }
    // 목표 노드를 반환한다
    return cur;
}

/* 노드 삽입 */
void insert(BinarySearchTree *bst, int num) {
    // 트리가 비어 있으면 루트 노드를 초기화한다
    if (bst->root == NULL) {
        bst->root = newTreeNode(num);
        return;
    }
    TreeNode *cur = bst->root, *pre = NULL;
    // 반복하여 탐색하다 리프 노드를 지나면 종료한다
    while (cur != NULL) {
        // 중복 노드를 찾으면 바로 반환한다
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // 삽입 위치는 cur의 오른쪽 서브트리에 있다
            cur = cur->right;
        } else {
            // 삽입 위치는 cur의 왼쪽 서브트리에 있다
            cur = cur->left;
        }
    }
    // 노드 삽입
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* 노드 삭제 */
// stdio.h를 포함했으므로 여기서는 remove라는 이름을 사용할 수 없다
void removeItem(BinarySearchTree *bst, int num) {
    // 트리가 비어 있으면 바로 반환하여 종료한다
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // 반복하여 탐색하다 리프 노드를 지나면 종료한다
    while (cur != NULL) {
        // 삭제할 노드를 찾았으므로 반복문을 종료한다
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // 삭제할 노드가 root의 오른쪽 서브트리에 있다
            cur = cur->right;
        } else {
            // 삭제할 노드가 root의 왼쪽 서브트리에 있다
            cur = cur->left;
        }
    }
    // 삭제할 노드가 없으면 바로 반환한다
    if (cur == NULL)
        return;
    // 삭제할 노드에 자식 노드가 있는지 확인한다
    if (cur->left == NULL || cur->right == NULL) {
        /* 자식 노드 수 = 0 또는 1 */
        // 자식 노드 수가 0 / 1이면 child = nullptr / 해당 자식 노드다
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // 노드 cur를 삭제한다
        if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
        // 메모리 해제
        free(cur);
    } else {
        /* 자식 노드 수 = 2 */
        // 중위 순회에서 cur의 다음 노드를 구한다
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // 노드 tmp를 재귀적으로 삭제한다
        removeItem(bst, tmp->val);
        // tmp로 cur를 덮어쓴다
        cur->val = tmpVal;
    }
}

/* 실행 코드 */
int main() {
    /* 이진 탐색 트리 초기화 */
    int nums[] = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    BinarySearchTree *bst = newBinarySearchTree();
    for (int i = 0; i < sizeof(nums) / sizeof(int); i++) {
        insert(bst, nums[i]);
    }
    printf("초기화한 이진 트리:\n");
    printTree(getRoot(bst));

    /* 노드 탐색 */
    TreeNode *node = search(bst, 7);
    printf("찾은 노드 객체의 노드 값 = %d\n", node->val);

    /* 노드 삽입 */
    insert(bst, 16);
    printf("노드 16 삽입 후 이진 트리:\n");
    printTree(getRoot(bst));

    /* 노드 삭제 */
    removeItem(bst, 1);
    printf("노드 1 삭제 후 이진 트리:\n");
    printTree(getRoot(bst));
    removeItem(bst, 2);
    printf("노드 2 삭제 후 이진 트리:\n");
    printTree(getRoot(bst));
    removeItem(bst, 4);
    printf("노드 4 삭제 후 이진 트리:\n");
    printTree(getRoot(bst));

    // 메모리 해제
    delBinarySearchTree(bst);
    return 0;
}
