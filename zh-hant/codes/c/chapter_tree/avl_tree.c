/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* AVL 樹結構體 */
typedef struct {
    TreeNode *root;
} AVLTree;

/* 建構子 */
AVLTree *newAVLTree() {
    AVLTree *tree = (AVLTree *)malloc(sizeof(AVLTree));
    tree->root = NULL;
    return tree;
}

/* 析構函式 */
void delAVLTree(AVLTree *tree) {
    freeMemoryTree(tree->root);
    free(tree);
}

/* 獲取節點高度 */
int height(TreeNode *node) {
    // 空節點高度為 -1 ，葉節點高度為 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* 更新節點高度 */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // 節點高度等於最高子樹高度 + 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* 獲取平衡因子 */
int balanceFactor(TreeNode *node) {
    // 空節點平衡因子為 0
    if (node == NULL) {
        return 0;
    }
    // 節點平衡因子 = 左子樹高度 - 右子樹高度
    return height(node->left) - height(node->right);
}

/* 右旋操作 */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // 以 child 為原點，將 node 向右旋轉
    child->right = node;
    node->left = grandChild;
    // 更新節點高度
    updateHeight(node);
    updateHeight(child);
    // 返回旋轉後子樹的根節點
    return child;
}

/* 左旋操作 */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // 以 child 為原點，將 node 向左旋轉
    child->left = node;
    node->right = grandChild;
    // 更新節點高度
    updateHeight(node);
    updateHeight(child);
    // 返回旋轉後子樹的根節點
    return child;
}

/* 執行旋轉操作，使該子樹重新恢復平衡 */
TreeNode *rotate(TreeNode *node) {
    // 獲取節點 node 的平衡因子
    int bf = balanceFactor(node);
    // 左偏樹
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // 右旋
            return rightRotate(node);
        } else {
            // 先左旋後右旋
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // 右偏樹
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // 左旋
            return leftRotate(node);
        } else {
            // 先右旋後左旋
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // 平衡樹，無須旋轉，直接返回
    return node;
}

/* 遞迴插入節點（輔助函式） */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. 查詢插入位置並插入節點 */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // 重複節點不插入，直接返回
        return node;
    }
    // 更新節點高度
    updateHeight(node);
    /* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
    node = rotate(node);
    // 返回子樹的根節點
    return node;
}

/* 插入節點 */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* 遞迴刪除節點（輔助函式） */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. 查詢節點並刪除 */
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
            // 子節點數量 = 0 ，直接刪除 node 並返回
            if (child == NULL) {
                return NULL;
            } else {
                // 子節點數量 = 1 ，直接刪除 node
                node = child;
            }
        } else {
            // 子節點數量 = 2 ，則將中序走訪的下個節點刪除，並用該節點替換當前節點
            TreeNode *temp = node->right;
            while (temp->left != NULL) {
                temp = temp->left;
            }
            int tempVal = temp->val;
            node->right = removeHelper(node->right, temp->val);
            node->val = tempVal;
        }
    }
    // 更新節點高度
    updateHeight(node);
    /* 2. 執行旋轉操作，使該子樹重新恢復平衡 */
    node = rotate(node);
    // 返回子樹的根節點
    return node;
}

/* 刪除節點 */
// 由於引入了 stdio.h ，此處無法使用 remove 關鍵詞
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* 查詢節點 */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // 迴圈查詢，越過葉節點後跳出
    while (cur != NULL) {
        if (cur->val < val) {
            // 目標節點在 cur 的右子樹中
            cur = cur->right;
        } else if (cur->val > val) {
            // 目標節點在 cur 的左子樹中
            cur = cur->left;
        } else {
            // 找到目標節點，跳出迴圈
            break;
        }
    }
    // 找到目標節點，跳出迴圈
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\n插入節點 %d 後，AVL 樹為 \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\n刪除節點 %d 後，AVL 樹為 \n", val);
    printTree(tree->root);
}

/* Driver Code */
int main() {
    /* 初始化空 AVL 樹 */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* 插入節點 */
    // 請關注插入節點後，AVL 樹是如何保持平衡的
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

    /* 插入重複節點 */
    testInsert(tree, 7);

    /* 刪除節點 */
    // 請關注刪除節點後，AVL 樹是如何保持平衡的
    testRemove(tree, 8); // 刪除度為 0 的節點
    testRemove(tree, 5); // 刪除度為 1 的節點
    testRemove(tree, 4); // 刪除度為 2 的節點

    /* 查詢節點 */
    TreeNode *node = search(tree, 7);
    printf("\n查詢到的節點物件節點值 = %d \n", node->val);

    // 釋放記憶體
    delAVLTree(tree);
    return 0;
}
