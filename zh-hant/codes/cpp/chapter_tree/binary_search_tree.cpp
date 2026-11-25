/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二元搜尋樹 */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    /* 建構方法 */
    BinarySearchTree() {
        // 初始化空樹
        root = nullptr;
    }

    /* 解構方法 */
    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* 取得二元樹的根節點 */
    TreeNode *getRoot() {
        return root;
    }

    /* 搜尋節點 */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur != nullptr) {
            // 目標節點在 cur 的右子樹中
            if (cur->val < num)
                cur = cur->right;
            // 目標節點在 cur 的左子樹中
            else if (cur->val > num)
                cur = cur->left;
            // 找到目標節點，跳出迴圈
            else
                break;
        }
        // 回傳目標節點
        return cur;
    }

    /* 插入節點 */
    void insert(int num) {
        // 若樹為空，則初始化根節點
        if (root == nullptr) {
            root = new TreeNode(num);
            return;
        }
        TreeNode *cur = root, *pre = nullptr;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur != nullptr) {
            // 找到重複節點，直接返回
            if (cur->val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子樹中
            if (cur->val < num)
                cur = cur->right;
            // 插入位置在 cur 的左子樹中
            else
                cur = cur->left;
        }
        // 插入節點
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* 刪除節點 */
    void remove(int num) {
        // 若樹為空，直接返回
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 用迴圈搜尋，越過葉節點後跳出迴圈
        while (cur != nullptr) {
            // 找到要刪除的節點，跳出迴圈
            if (cur->val == num)
                break;
            pre = cur;
            // 要刪除的節點在 cur 的右子樹中
            if (cur->val < num)
                cur = cur->right;
            // 要刪除的節點在 cur 的左子樹中
            else
                cur = cur->left;
        }
        // 若找不到要刪除的節點，直接返回
        if (cur == nullptr)
            return;
        // 子節點數為 0 或 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 有 0 個子節點時，child = nullptr；只有 1 個時，child 指向該子節點
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // 刪除節點 cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 若刪除的是根節點，則重新指定根節點
                root = child;
            }
            // 釋放記憶體
            delete cur;
        }
        // 子節點數為 2
        else {
            // 取得中序走訪中 cur 的下一個節點
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // 以遞迴刪除節點 tmp
            remove(tmp->val);
            // 用 tmp 的值覆寫 cur 的值
            cur->val = tmpVal;
        }
    }
};

/* 主程式 */
int main() {
    /* 初始化二元搜尋樹 */
    BinarySearchTree *bst = new BinarySearchTree();
    // 請留意，插入順序不同，建成的二元樹也可能不同。這組序列會建成一棵完美二元樹
    vector<int> nums = {8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15};
    for (int num : nums) {
        bst->insert(num);
    }
    cout << endl << "初始化後的二元樹為\n" << endl;
    printTree(bst->getRoot());

    /* 搜尋節點 */
    TreeNode *node = bst->search(7);
    cout << endl << "找到的節點物件為 " << node << "，節點值 = " << node->val << endl;

    /* 插入節點 */
    bst->insert(16);
    cout << endl << "插入節點 16 後的二元樹為\n" << endl;
    printTree(bst->getRoot());

    /* 刪除節點 */
    bst->remove(1);
    cout << endl << "刪除節點 1 後的二元樹為\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "刪除節點 2 後的二元樹為\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "刪除節點 4 後的二元樹為\n" << endl;
    printTree(bst->getRoot());

    // 釋放記憶體
    delete bst;

    return 0;
}
