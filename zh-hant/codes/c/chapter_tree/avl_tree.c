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

/* 建構函式 */
AVLTree *newAVLTree() {
    AVLTree *tree = (AVLTree *)malloc(sizeof(AVLTree));
    tree->root = NULL;
    return tree;
}

/* 解構函式 */
void delAVLTree(AVLTree *tree) {
    freeMemoryTree(tree->root);
    free(tree);
}

/* 取得節點高度 */
int height(TreeNode *node) {
    // 空節點的高度為 -1，葉節點的高度為 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* 更新節點高度 */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // 節點高度等於最高子樹的高度加 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* 取得平衡因子 */
int balanceFactor(TreeNode *node) {
    // 空節點的平衡因子為 0
    if (node == NULL) {
        return 0;
    }
    // 節點的平衡因子 = 左子樹高度 - 右子樹高度
    return height(node->left) - height(node->right);
}

/* 右旋操作 */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // 以 child 為支點，將 node 向右旋轉
    child->right = node;
    node->left = grandChild;
    // 更新節點高度
    updateHeight(node);
    updateHeight(child);
    // 回傳旋轉後的子樹根節點
    return child;
}

/* 左旋操作 */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // 以 child 為支點，將 node 向左旋轉
    child->left = node;
    node->right = grandChild;
    // 更新節點高度
    updateHeight(node);
    updateHeight(child);
    // 回傳旋轉後的子樹根節點
    return child;
}

/* 透過旋轉讓這棵子樹恢復平衡 */
TreeNode *rotate(TreeNode *node) {
    // 取得節點 node 的平衡因子
    int bf = balanceFactor(node);
    // 左偏樹
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // 右旋
            return rightRotate(node);
        } else {
            // 先左旋再右旋
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
            // 先右旋再左旋
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // 樹已平衡，無須旋轉，直接返回
    return node;
}

/* 以遞迴插入節點（輔助函式） */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. 找出插入位置並插入節點 */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // 若節點重複，直接返回，略過插入操作
        return node;
    }
    // 更新節點高度
    updateHeight(node);
    /* 2. 透過旋轉讓這棵子樹恢復平衡 */
    node = rotate(node);
    // 回傳子樹的根節點
    return node;
}

/* 插入節點 */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* 以遞迴刪除節點（輔助函式） */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. 找出並刪除節點 */
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
            // 若有 0 個子節點，直接刪除 node 並返回
            if (child == NULL) {
                return NULL;
            } else {
                // 若只有 1 個子節點，直接刪除 node
                node = child;
            }
        } else {
            // 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
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
    /* 2. 透過旋轉讓這棵子樹恢復平衡 */
    node = rotate(node);
    // 回傳子樹的根節點
    return node;
}

/* 刪除節點 */
// 由於已引入 stdio.h，這裡無法使用 remove 這個名稱
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* 搜尋節點 */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // 用迴圈搜尋，越過葉節點後跳出迴圈
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
    printf("\n插入節點 %d 後的 AVL 樹為 \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\n刪除節點 %d 後的 AVL 樹為 \n", val);
    printTree(tree->root);
}

/* 主程式 */
int main() {
    /* 初始化一棵空的 AVL 樹 */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* 插入節點 */
    // 請觀察插入節點後 AVL 樹如何維持平衡
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
    // 請觀察刪除節點後 AVL 樹如何維持平衡
    testRemove(tree, 8); // 刪除分支度為 0 的節點
    testRemove(tree, 5); // 刪除分支度為 1 的節點
    testRemove(tree, 4); // 刪除分支度為 2 的節點

    /* 查詢節點 */
    TreeNode *node = search(tree, 7);
    printf("\n找到的節點物件，其節點值 = %d \n", node->val);

    // 釋放記憶體
    delAVLTree(tree);
    return 0;
}
