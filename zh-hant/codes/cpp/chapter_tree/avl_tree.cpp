/**
 * File: avl_tree.cpp
 * Created Time: 2023-02-03
 * Author: what-is-me (whatisme@outlook.jp)
 */

#include "../utils/common.hpp"

/* AVL 樹 */
class AVLTree {
  private:
    /* 更新節點高度 */
    void updateHeight(TreeNode *node) {
        // 節點高度等於最高子樹的高度加 1
        node->height = max(height(node->left), height(node->right)) + 1;
    }

    /* 右旋操作 */
    TreeNode *rightRotate(TreeNode *node) {
        TreeNode *child = node->left;
        TreeNode *grandChild = child->right;
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
        TreeNode *child = node->right;
        TreeNode *grandChild = child->left;
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
        int _balanceFactor = balanceFactor(node);
        // 左偏樹
        if (_balanceFactor > 1) {
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
        if (_balanceFactor < -1) {
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

    /* 以遞迴插入節點（輔助方法） */
    TreeNode *insertHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return new TreeNode(val);
        /* 1. 找出插入位置並插入節點 */
        if (val < node->val)
            node->left = insertHelper(node->left, val);
        else if (val > node->val)
            node->right = insertHelper(node->right, val);
        else
            return node;    // 若節點重複，直接返回，略過插入操作
        updateHeight(node); // 更新節點高度
        /* 2. 透過旋轉讓這棵子樹恢復平衡 */
        node = rotate(node);
        // 回傳子樹的根節點
        return node;
    }

    /* 以遞迴刪除節點（輔助方法） */
    TreeNode *removeHelper(TreeNode *node, int val) {
        if (node == nullptr)
            return nullptr;
        /* 1. 找出並刪除節點 */
        if (val < node->val)
            node->left = removeHelper(node->left, val);
        else if (val > node->val)
            node->right = removeHelper(node->right, val);
        else {
            if (node->left == nullptr || node->right == nullptr) {
                TreeNode *child = node->left != nullptr ? node->left : node->right;
                // 若有 0 個子節點，直接刪除 node 並返回
                if (child == nullptr) {
                    delete node;
                    return nullptr;
                }
                // 若只有 1 個子節點，直接刪除 node
                else {
                    delete node;
                    node = child;
                }
            } else {
                // 若有 2 個子節點，刪除中序走訪的下一個節點，並用它的值取代目前節點的值
                TreeNode *temp = node->right;
                while (temp->left != nullptr) {
                    temp = temp->left;
                }
                int tempVal = temp->val;
                node->right = removeHelper(node->right, temp->val);
                node->val = tempVal;
            }
        }
        updateHeight(node); // 更新節點高度
        /* 2. 透過旋轉讓這棵子樹恢復平衡 */
        node = rotate(node);
        // 回傳子樹的根節點
        return node;
    }

  public:
    TreeNode *root; // 根節點

    /* 取得節點高度 */
    int height(TreeNode *node) {
        // 空節點的高度為 -1，葉節點的高度為 0
        return node == nullptr ? -1 : node->height;
    }

    /* 取得平衡因子 */
    int balanceFactor(TreeNode *node) {
        // 空節點的平衡因子為 0
        if (node == nullptr)
            return 0;
        // 節點的平衡因子 = 左子樹高度 - 右子樹高度
        return height(node->left) - height(node->right);
    }

    /* 插入節點 */
    void insert(int val) {
        root = insertHelper(root, val);
    }

    /* 刪除節點 */
    void remove(int val) {
        root = removeHelper(root, val);
    }

    /* 搜尋節點 */
    TreeNode *search(int val) {
        TreeNode *cur = root;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur != nullptr) {
            // 目標節點在 cur 的右子樹中
            if (cur->val < val)
                cur = cur->right;
            // 目標節點在 cur 的左子樹中
            else if (cur->val > val)
                cur = cur->left;
            // 找到目標節點，跳出迴圈
            else
                break;
        }
        // 回傳目標節點
        return cur;
    }

    /*建構方法*/
    AVLTree() : root(nullptr) {
    }

    /*解構方法*/
    ~AVLTree() {
        freeMemoryTree(root);
    }
};

void testInsert(AVLTree &tree, int val) {
    tree.insert(val);
    cout << "\n插入節點 " << val << " 後的 AVL 樹為" << endl;
    printTree(tree.root);
}

void testRemove(AVLTree &tree, int val) {
    tree.remove(val);
    cout << "\n刪除節點 " << val << " 後的 AVL 樹為" << endl;
    printTree(tree.root);
}

/* 主程式 */
int main() {
    /* 初始化一棵空的 AVL 樹 */
    AVLTree avlTree;

    /* 插入節點 */
    // 請觀察插入節點後 AVL 樹如何維持平衡
    testInsert(avlTree, 1);
    testInsert(avlTree, 2);
    testInsert(avlTree, 3);
    testInsert(avlTree, 4);
    testInsert(avlTree, 5);
    testInsert(avlTree, 8);
    testInsert(avlTree, 7);
    testInsert(avlTree, 9);
    testInsert(avlTree, 10);
    testInsert(avlTree, 6);

    /* 插入重複節點 */
    testInsert(avlTree, 7);

    /* 刪除節點 */
    // 請觀察刪除節點後 AVL 樹如何維持平衡
    testRemove(avlTree, 8); // 刪除分支度為 0 的節點
    testRemove(avlTree, 5); // 刪除分支度為 1 的節點
    testRemove(avlTree, 4); // 刪除分支度為 2 的節點

    /* 查詢節點 */
    TreeNode *node = avlTree.search(7);
    cout << "\n找到的節點物件為 " << node << "，節點值 = " << node->val << endl;
}
