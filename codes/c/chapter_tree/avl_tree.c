/**
 * File: avl_tree.c
 * Created Time: 2023-01-15
 * Author: Reanon (793584285@qq.com)
 */

#include "../include/include.h"

/* AVL Tree */
struct avlTree {
    TreeNode *root;
};

typedef struct avlTree avlTree;

/* 构建 AVL 树 */
avlTree *newAVLTree() {
    avlTree *tree = (avlTree *) malloc(sizeof(avlTree));
    tree->root = NULL;
    return tree;
}

int height(TreeNode *node) {
    // 空结点高度为 -1 ，叶结点高度为 0
    if (node != NULL) {
        return node->height;
    }
    return -1;
}

/* 更新结点高度 */
int updateHeight(TreeNode *node) {
    int lh = height(node->left);
    int rh = height(node->right);
    // 结点高度等于最高子树高度 + 1
    if (lh > rh) {
        node->height = lh + 1;
    } else {
        node->height = rh + 1;
    }
}

/* 获取平衡因子 */
int balanceFactor(TreeNode *node) {
    // 空结点平衡因子为 0
    if (node == NULL) {
        return 0;
    }
    // 结点平衡因子 = 左子树高度 - 右子树高度
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
    // 更新结点高度
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
    // 更新结点高度
    updateHeight(node);
    updateHeight(child);
    // 返回旋转后子树的根节点
    return child;
}

/* 执行旋转操作，使该子树重新恢复平衡 */
TreeNode *rotate(TreeNode *node) {
    // 获取结点 node 的平衡因子
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
    // 平衡树，无需旋转，直接返回
    return node;
}

/* 递归插入结点（辅助函数） */
TreeNode *insertHelper(TreeNode *node, int val) {
    if (node == NULL) {
        return newTreeNode(val);
    }
    /* 1. 查找插入位置，并插入结点 */
    if (val < node->val) {
        node->left = insertHelper(node->left, val);
    } else if (val > node->val) {
        node->right = insertHelper(node->right, val);
    } else {
        // 重复结点不插入，直接返回
        return node;
    }
    // 更新结点高度
    updateHeight(node);
    /* 2. 执行旋转操作，使该子树重新恢复平衡 */
    node = rotate(node);
    // 返回子树的根节点
    return node;
}


/* 插入结点 */
TreeNode *insert(avlTree *tree, int val) {
    tree->root = insertHelper(tree->root, val);
    return tree->root;
}

/* 获取中序遍历中的下一个结点（仅适用于 root 有左子结点的情况） */
TreeNode *getInOrderNext(TreeNode *node) {
    if (node == NULL) {
        return node;
    }
    // 循环访问左子结点，直到叶结点时为最小结点，跳出
    while (node->left != NULL) {
        node = node->left;
    }
    return node;
}

/* 递归删除结点（辅助函数） */
TreeNode *removeHelper(TreeNode *node, int val) {
    TreeNode *child, *grandChild, *temp;
    if (node == NULL) {
        return NULL;
    }
    /* 1. 查找结点，并删除之 */
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
            // 子结点数量 = 0 ，直接删除 node 并返回
            if (child == NULL) {
                return NULL;
            } else {
                // 子结点数量 = 1 ，直接删除 node
                node = child;
            }
        } else {
            // 子结点数量 = 2 ，则将中序遍历的下个结点删除，并用该结点替换当前结点
            temp = getInOrderNext(node->right);
            node->right = removeHelper(node->right, temp->val);
            node->val = temp->val;
        }
    }
    // 更新结点高度
    updateHeight(node);
    /* 2. 执行旋转操作，使该子树重新恢复平衡 */
    node = rotate(node);
    // 返回子树的根节点
    return node;
}

/* 删除结点 */
// 由于引入了 stdio.h ，此处无法使用 remove 关键词
TreeNode *removeNode(avlTree *tree, int val) {
    TreeNode *root = removeHelper(tree->root, val);
    return root;
}

/* 查找结点 */
TreeNode *search(avlTree *tree, int val) {
    TreeNode *cur = tree->root;
    // 循环查找，越过叶结点后跳出
    while (cur != NULL) {
        if (cur->val < val) {
            // 目标结点在 cur 的右子树中
            cur = cur->right;
        } else if (cur->val > val) {
            // 目标结点在 cur 的左子树中
            cur = cur->left;
        } else {
            // 找到目标结点，跳出循环
            break;
        }
    }
    // 找到目标结点，跳出循环
    return cur;
}

void testInsert(avlTree *tree, int val) {
    insert(tree, val);
    printf("\n插入结点 %d 后，AVL 树为 \n", val);
    printTree(tree->root);
}

void testRemove(avlTree *tree, int val) {
    removeNode(tree, val);
    printf("\n删除结点 %d 后，AVL 树为 \n", val);
    printTree(tree->root);
}

/* Driver Code */
int main() {
    /* 初始化空 AVL 树 */
    avlTree *tree = (avlTree *) newAVLTree();
    /* 插入结点 */
    // 请关注插入结点后，AVL 树是如何保持平衡的
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

    /* 插入重复结点 */
    testInsert(tree, 7);

    /* 删除结点 */
    // 请关注删除结点后，AVL 树是如何保持平衡的
    testRemove(tree, 8); // 删除度为 0 的结点
    testRemove(tree, 5); // 删除度为 1 的结点
    testRemove(tree, 4); // 删除度为 2 的结点

    /* 查询结点 */
    TreeNode *node = search(tree, 7);
    printf("\n查找到的结点对象结点值 = %d \n", node->val);
}