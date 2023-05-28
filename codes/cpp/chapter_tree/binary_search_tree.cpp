/**
 * File: binary_search_tree.cpp
 * Created Time: 2022-11-25
 * Author: Krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 二叉搜索树 */
class BinarySearchTree {
  private:
    TreeNode *root;

  public:
    BinarySearchTree(vector<int> nums) {
        sort(nums.begin(), nums.end());             // 排序数组
        root = buildTree(nums, 0, nums.size() - 1); // 构建二叉搜索树
    }

    ~BinarySearchTree() {
        freeMemoryTree(root);
    }

    /* 获取二叉树根节点 */
    TreeNode *getRoot() {
        return root;
    }

    /* 构建二叉搜索树 */
    TreeNode *buildTree(vector<int> nums, int i, int j) {
        if (i > j)
            return nullptr;
        // 将数组中间节点作为根节点
        int mid = (i + j) / 2;
        TreeNode *root = new TreeNode(nums[mid]);
        // 递归建立左子树和右子树
        root->left = buildTree(nums, i, mid - 1);
        root->right = buildTree(nums, mid + 1, j);
        return root;
    }

    /* 查找节点 */
    TreeNode *search(int num) {
        TreeNode *cur = root;
        // 循环查找，越过叶节点后跳出
        while (cur != nullptr) {
            // 目标节点在 cur 的右子树中
            if (cur->val < num)
                cur = cur->right;
            // 目标节点在 cur 的左子树中
            else if (cur->val > num)
                cur = cur->left;
            // 找到目标节点，跳出循环
            else
                break;
        }
        // 返回目标节点
        return cur;
    }

    /* 插入节点 */
    void insert(int num) {
        // 若树为空，直接提前返回
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 循环查找，越过叶节点后跳出
        while (cur != nullptr) {
            // 找到重复节点，直接返回
            if (cur->val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur->val < num)
                cur = cur->right;
            // 插入位置在 cur 的左子树中
            else
                cur = cur->left;
        }
        // 插入节点
        TreeNode *node = new TreeNode(num);
        if (pre->val < num)
            pre->right = node;
        else
            pre->left = node;
    }

    /* 删除节点 */
    void remove(int num) {
        // 若树为空，直接提前返回
        if (root == nullptr)
            return;
        TreeNode *cur = root, *pre = nullptr;
        // 循环查找，越过叶节点后跳出
        while (cur != nullptr) {
            // 找到待删除节点，跳出循环
            if (cur->val == num)
                break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur->val < num)
                cur = cur->right;
            // 待删除节点在 cur 的左子树中
            else
                cur = cur->left;
        }
        // 若无待删除节点，则直接返回
        if (cur == nullptr)
            return;
        // 子节点数量 = 0 or 1
        if (cur->left == nullptr || cur->right == nullptr) {
            // 当子节点数量 = 0 / 1 时， child = nullptr / 该子节点
            TreeNode *child = cur->left != nullptr ? cur->left : cur->right;
            // 删除节点 cur
            if (cur != root) {
                if (pre->left == cur)
                    pre->left = child;
                else
                    pre->right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child;
            }
            // 释放内存
            delete cur;
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            TreeNode *tmp = cur->right;
            while (tmp->left != nullptr) {
                tmp = tmp->left;
            }
            int tmpVal = tmp->val;
            // 递归删除节点 tmp
            remove(tmp->val);
            // 用 tmp 覆盖 cur
            cur->val = tmpVal;
        }
    }
};

/* Driver Code */
int main() {
    /* 初始化二叉搜索树 */
    vector<int> nums = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15};
    BinarySearchTree *bst = new BinarySearchTree(nums);
    cout << endl << "初始化的二叉树为\n" << endl;
    printTree(bst->getRoot());

    /* 查找节点 */
    TreeNode *node = bst->search(7);
    cout << endl << "查找到的节点对象为 " << node << "，节点值 = " << node->val << endl;

    /* 插入节点 */
    bst->insert(16);
    cout << endl << "插入节点 16 后，二叉树为\n" << endl;
    printTree(bst->getRoot());

    /* 删除节点 */
    bst->remove(1);
    cout << endl << "删除节点 1 后，二叉树为\n" << endl;
    printTree(bst->getRoot());
    bst->remove(2);
    cout << endl << "删除节点 2 后，二叉树为\n" << endl;
    printTree(bst->getRoot());
    bst->remove(4);
    cout << endl << "删除节点 4 后，二叉树为\n" << endl;
    printTree(bst->getRoot());

    // 释放内存
    delete bst;

    return 0;
}
