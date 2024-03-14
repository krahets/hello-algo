/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* AVL 树结构体 */
typedef struct {
    TreeNode *root;
} AVLTree;

/* 构造函数 */
AVLTree *newAVLTree() {
    AVLTree *tree = (AVLTree *)malloc(sizeof(AVLTree));
    tree->root = NULL;
    return tree;
}

/* 析构函数 */
void delAVLTree(AVLTree *tree) {
    freeMemoryTree(tree->root);
    free(tree);
}

/* 获取节点高度 */
int height(TreeNode *node) {
    // 空节点高度为 -1 ，叶节点高度为 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* 更新节点高度 */
void updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // 节点高度等于最高子树高度 + 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* 获取平衡因子 */
int balanceFactor(TreeNode *node) {
    // 空节点平衡因子为 0
    if (node == NULL) {
        return 0;
    }
    // 节点平衡因子 = 左子树高度 - 右子树高度
    return height(node->left) - height(node->right);
}

/* 右旋操作 */
TreeNode *rightRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->left;
    grandChild = child->right;
    // 以 child 为原点，将 node 向右旋转
    child->right = node;
    node->left = grandChild;
    // 更新节点高度
    updateHeight(node);
    updateHeight(child);
    // 返回旋转后子树的根节点
    return child;
}

/* 左旋操作 */
TreeNode *leftRotate(TreeNode *node) {
    TreeNode *child, *grandChild;
    child = node->right;
    grandChild = child->left;
    // 以 child 为原点，将 node 向左旋转
    child->left = node;
    node->right = grandChild;
    // 更新节点高度
    updateHeight(node);
    updateHeight(child);
    // 返回旋转后子树的根节点
    return child;
}

/* 执行旋转操作，使该子树重新恢复平衡 */
TreeNode *rotate(TreeNode *node) {
    // 获取节点 node 的平衡因子
    int bf = balanceFactor(node);
    // 左偏树
    if (bf > 1) {
        if (balanceFactor(node->left) >= 0) {
            // 右旋
            return rightRotate(node);
        } else {
            // 先左旋后右旋
            node->left = leftRotate(node->left);
            return rightRotate(node);
        }
    }
    // 右偏树
    if (bf < -1) {
        if (balanceFactor(node->right) <= 0) {
            // 左旋
            return leftRotate(node);
        } else {
            // 先右旋后左旋
            node->right = rightRotate(node->right);
            return leftRotate(node);
        }
    }
    // 平衡树，无须旋转，直接返回
    return node;
}

/* 递归插入节点（辅助函数） */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. 查找插入位置并插入节点 */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // 重复节点不插入，直接返回
        return node;
    }
    // 更新节点高度
    updateHeight(node);
    /* 2. 执行旋转操作，使该子树重新恢复平衡 */
    node = rotate(node);
    // 返回子树的根节点
    return node;
}

/* 插入节点 */
void insert(AVLTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
}

/* 递归删除节点（辅助函数） */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild;
    if (node == NULL) {
        return NULL;
    }
    /* 1. 查找节点并删除 */
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
            // 子节点数量 = 0 ，直接删除 node 并返回
            if (child == NULL) {
                return NULL;
            } else {
                // 子节点数量 = 1 ，直接删除 node
                node = child;
            }
        } else {
            // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
            TreeNode *temp = node->right;
            while (temp->left != NULL) {
                temp = temp->left;
            }
            int tempVal = temp->val;
            node->right = removeHelper(node->right, temp->val);
            node->val = tempVal;
        }
    }
    // 更新节点高度
    updateHeight(node);
    /* 2. 执行旋转操作，使该子树重新恢复平衡 */
    node = rotate(node);
    // 返回子树的根节点
    return node;
}

/* 删除节点 */
// 由于引入了 stdio.h ，此处无法使用 remove 关键词
void removeItem(AVLTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
}

/* 查找节点 */
TreeNode *search(AVLTree *tree, int val) {
    TreeNode *cur = tree->root;
    // 循环查找，越过叶节点后跳出
    while (cur != NULL) {
        if (cur->val < val) {
            // 目标节点在 cur 的右子树中
            cur = cur->right;
        } else if (cur->val > val) {
            // 目标节点在 cur 的左子树中
            cur = cur->left;
        } else {
            // 找到目标节点，跳出循环
            break;
        }
    }
    // 找到目标节点，跳出循环
    return cur;
}

void testInsert(AVLTree *tree, int val) {
    insert(tree, val);
    printf("\n插入节点 %d 后，AVL 树为 \n", val);
    printTree(tree->root);
}

void testRemove(AVLTree *tree, int val) {
    removeItem(tree, val);
    printf("\n删除节点 %d 后，AVL 树为 \n", val);
    printTree(tree->root);
}

/* Driver Code */
int main() {
    /* 初始化空 AVL 树 */
    AVLTree *tree = (AVLTree *)newAVLTree();
    /* 插入节点 */
    // 请关注插入节点后，AVL 树是如何保持平衡的
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

    /* 插入重复节点 */
    testInsert(tree, 7);

    /* 删除节点 */
    // 请关注删除节点后，AVL 树是如何保持平衡的
    testRemove(tree, 8); // 删除度为 0 的节点
    testRemove(tree, 5); // 删除度为 1 的节点
    testRemove(tree, 4); // 删除度为 2 的节点

    /* 查询节点 */
    TreeNode *node = search(tree, 7);
    printf("\n查找到的节点对象节点值 = %d \n", node->val);

    // 释放内存
    delAVLTree(tree);
    return 0;
}
