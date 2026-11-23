/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* AVL 트리 구조체 */
typedef struct {
    TreeNode *root;
} AVLTree;

/* 생성자 */
AVLTree *newAVLTree() {
    AVLTree *tree = (AVLTree *)malloc(sizeof(AVLTree));
    tree->root = NULL;
    return tree;
}

/* 소멸자 */
void delAVLTree(AVLTree *tree) {
    freeMemoryTree(tree->root);
    free(tree);
}

/* 노드 높이 반환 */
int height(TreeNode *node) {
    // 빈 노드의 높이는 -1이고, 리프 노드의 높이는 0이다
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* 노드 높이를 갱신한다 */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // 노드 높이는 가장 높은 서브트리의 높이 + 1이다
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* 균형 인수 반환 */
int balanceFactor(TreeNode *node) {
    // 빈 노드의 균형 인수는 0이다
    if (node == NULL) {
        return 0;
    }
    // 노드의 균형 인수 = 왼쪽 서브트리 높이 - 오른쪽 서브트리 높이
    return height(node->left) - height(node->right);
}

/* 오른쪽 회전 연산 */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // child를 중심으로 node를 오른쪽으로 회전한다
    child->right = node;
    node->left = grandChild;
    // 노드 높이를 갱신한다
    updateHeight(node);
    updateHeight(child);
    // 회전한 서브트리의 루트 노드를 반환한다
    return child;
}

/* 왼쪽 회전 연산 */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // child를 중심으로 node를 왼쪽으로 회전한다
    child->left = node;
    node->right = grandChild;
    // 노드 높이를 갱신한다
    updateHeight(node);
    updateHeight(child);
    // 회전한 서브트리의 루트 노드를 반환한다
    return child;
}

/* 회전 연산을 수행하여 해당 서브트리의 균형 복원 */
TreeNode *rotate(TreeNode *node) {
    // 노드 node의 균형 인수를 구한다
    int bf = balanceFactor(node);
    // 왼쪽으로 치우친 트리
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // 오른쪽 회전
            return rightRotate(node);
        } else {
            // 왼쪽으로 회전한 후 오른쪽으로 회전한다
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // 오른쪽으로 치우친 트리
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // 왼쪽 회전
            return leftRotate(node);
        } else {
            // 오른쪽으로 회전한 후 왼쪽으로 회전한다
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // 균형 트리이므로 회전할 필요 없이 바로 반환한다
    return node;
}

/* 노드의 재귀적 삽입(보조 함수) */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. 삽입 위치를 찾아 노드를 삽입한다 */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // 중복 노드는 삽입하지 않고 바로 반환한다
        return node;
    }
    // 노드 높이를 갱신한다
    updateHeight(node);
    /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
    node = rotate(node);
    // 서브트리의 루트 노드를 반환한다
    return node;
}

/* 노드 삽입 */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* 노드의 재귀적 삭제(보조 함수) */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. 노드를 찾아 삭제한다 */
    if (val < node->val) {
        node->left = removeHelper(node->left, val);
    } else if (val > node->val) {
        node->right = removeHelper(node->right, val);
    } else {
        if (node->left == NULL || node->right == NULL) {
            child = node->left;
            if (node->right != NULL) {
                child = node->right;
            }
            // 자식 노드 수 = 0이면 node를 바로 삭제하고 반환한다
            if (child == NULL) {
                return NULL;
            } else {
                // 자식 노드 수 = 1이면 node를 바로 삭제한다
                node = child;
            }
        } else {
            // 자식 노드 수 = 2이면 중위 순회의 다음 노드를 삭제하고, 그 노드로 현재 노드를 대체한다
            TreeNode *temp = node->right;
            while (temp->left != NULL) {
                temp = temp->left;
            }
            int tempVal = temp->val;
            node->right = removeHelper(node->right, temp->val);
            node->val = tempVal;
        }
    }
    // 노드 높이를 갱신한다
    updateHeight(node);
    /* 2. 회전 연산을 수행하여 해당 서브트리의 균형을 복원한다 */
    node = rotate(node);
    // 서브트리의 루트 노드를 반환한다
    return node;
}

/* 노드 삭제 */
// stdio.h를 포함했으므로 여기서는 remove라는 이름을 사용할 수 없다
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* 노드 탐색 */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // 반복하여 탐색하다 리프 노드를 지나면 종료한다
    while (cur != NULL) {
        if (cur->val < val) {
            // 목표 노드는 cur의 오른쪽 서브트리에 있다
            cur = cur->right;
        } else if (cur->val > val) {
            // 목표 노드는 cur의 왼쪽 서브트리에 있다
            cur = cur->left;
        } else {
            // 목표 노드를 찾았으므로 반복문을 종료한다
            break;
        }
    }
    // 목표 노드를 찾았으므로 반복문을 종료한다
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\n노드 %d 삽입 후의 AVL 트리\n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\n노드 %d 삭제 후의 AVL 트리\n", val);
    printTree(tree->root);
}

/* 실행 코드 */
int main() {
    /* 빈 AVL 트리 초기화 */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* 노드 삽입 */
    // 노드를 삽입한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
    testInsert(tree, 1);
    testInsert(tree, 2);
    testInsert(tree, 3);
    testInsert(tree, 4);
    testInsert(tree, 5);
    testInsert(tree, 8);
    testInsert(tree, 7);
    testInsert(tree, 9);
    testInsert(tree, 10);
    testInsert(tree, 6);

    /* 중복 노드 삽입 */
    testInsert(tree, 7);

    /* 노드 삭제 */
    // 노드를 삭제한 후 AVL 트리가 어떻게 균형을 유지하는지 살펴본다
    testRemove(tree, 8); // 차수가 0인 노드 삭제
    testRemove(tree, 5); // 차수가 1인 노드 삭제
    testRemove(tree, 4); // 차수가 2인 노드 삭제

    /* 노드 조회 */
    TreeNode *node = search(tree, 7);
    printf("\n찾은 노드 객체의 노드 값 = %d \n", node->val);

    // 메모리 해제
    delAVLTree(tree);
    return 0;
}
