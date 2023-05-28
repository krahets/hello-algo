/**
 * File: binary_search_tree.c
 * Created Time: 2023-01-11
 * Author: Reanon (793584285@qq.com)
 */

#include "../utils/common.h"

/* 二叉搜索树 */
struct binarySearchTree {
    TreeNode *root;
};

typedef struct binarySearchTree binarySearchTree;

/* 比较器：从小到大排序 */
int sortIntHelper(const void *a, const void *b) {
    return (*(int *)a - *(int *)b);
}

/* 构建二叉搜索树 */
TreeNode *buildTree(int nums[], int i, int j) {
    if (i > j) {
        return NULL;
    }
    // 将数组中间节点作为根节点
    int mid = (i + j) / 2;
    TreeNode *root = newTreeNode(nums[mid]);
    // 递归建立左子树和右子树
    root->left = buildTree(nums, i, mid - 1);
    root->right = buildTree(nums, mid + 1, j);
    return root;
}

binarySearchTree *newBinarySearchTree(int nums[], int size) {
    binarySearchTree *bst = (binarySearchTree *)malloc(sizeof(binarySearchTree));
    TreeNode *root;
    // 从小到大排序数组
    qsort(nums, size, sizeof(int), sortIntHelper);
    // 构建二叉搜索树
    root = buildTree(nums, 0, size - 1);
    bst->root = root;
    return bst;
}

/* 获取二叉树根节点 */
TreeNode *getRoot(binarySearchTree *bst) {
    return bst->root;
}

/* 查找节点 */
TreeNode *search(binarySearchTree *bst, int num) {
    TreeNode *cur = bst->root;
    // 循环查找，越过叶节点后跳出
    while (cur != NULL) {
        if (cur->val < num) {
            // 目标节点在 cur 的右子树中
            cur = cur->right;
        } else if (cur->val > num) {
            // 目标节点在 cur 的左子树中
            cur = cur->left;
        } else {
            // 找到目标节点，跳出循环
            break;
        }
    }
    // 返回目标节点
    return cur;
}

/* 插入节点 */
void insert(binarySearchTree *bst, int num) {
    // 若树为空，直接提前返回
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // 循环查找，越过叶节点后跳出
    while (cur != NULL) {
        // 找到重复节点，直接返回
        if (cur->val == num) {
            return;
        }
        pre = cur;
        if (cur->val < num) {
            // 插入位置在 cur 的右子树中
            cur = cur->right;
        } else {
            // 插入位置在 cur 的左子树中
            cur = cur->left;
        }
    }
    // 插入节点
    TreeNode *node = newTreeNode(num);
    if (pre->val < num) {
        pre->right = node;
    } else {
        pre->left = node;
    }
}

/* 删除节点 */
// 由于引入了 stdio.h ，此处无法使用 remove 关键词
void removeNode(binarySearchTree *bst, int num) {
    // 若树为空，直接提前返回
    if (bst->root == NULL)
        return;
    TreeNode *cur = bst->root, *pre = NULL;
    // 循环查找，越过叶节点后跳出
    while (cur != NULL) {
        // 找到待删除节点，跳出循环
        if (cur->val == num)
            break;
        pre = cur;
        if (cur->val < num) {
            // 待删除节点在 root 的右子树中
            cur = cur->right;
        } else {
            // 待删除节点在 root 的左子树中
            cur = cur->left;
        }
    }
    // 若无待删除节点，则直接返回
    if (cur == NULL)
        return;
    // 判断待删除节点是否存在子节点
    if (cur->left == NULL || cur->right == NULL) {
        /* 子节点数量 = 0 or 1 */
        // 当子节点数量 = 0 / 1 时， child = nullptr / 该子节点
        TreeNode *child = cur->left != NULL ? cur->left : cur->right;
        // 删除节点 cur
        if (pre->left == cur) {
            pre->left = child;
        } else {
            pre->right = child;
        }
    } else {
        /* 子节点数量 = 2 */
        // 获取中序遍历中 cur 的下一个节点
        TreeNode *tmp = cur->right;
        while (tmp->left != NULL) {
            tmp = tmp->left;
        }
        int tmpVal = tmp->val;
        // 递归删除节点 tmp
        removeNode(bst, tmp->val);
        // 用 tmp 覆盖 cur
        cur->val = tmpVal;
    }
}

/* Driver Code */
int main() {
    /* 初始化二叉搜索树 */
    int nums[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    binarySearchTree *bst = newBinarySearchTree(nums, sizeof(nums) / sizeof(int));
    printf("初始化的二叉树为\n");
    printTree(getRoot(bst));

    /* 查找节点 */
    TreeNode *node = search(bst, 7);
    printf("查找到的节点对象的节点值 = %d\n", node->val);

    /* 插入节点 */
    insert(bst, 16);
    printf("插入节点 16 后，二叉树为\n");
    printTree(getRoot(bst));

    /* 删除节点 */
    removeNode(bst, 1);
    printf("删除节点 1 后，二叉树为\n");
    printTree(getRoot(bst));
    removeNode(bst, 2);
    printf("删除节点 2 后，二叉树为\n");
    printTree(getRoot(bst));
    removeNode(bst, 4);
    printf("删除节点 4 后，二叉树为\n");
    printTree(getRoot(bst));

    // 释放内存
    free(bst);

    return 0;
}
