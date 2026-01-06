/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 数组表示下的二叉树类 */
class ArrayBinaryTree {
  public:
    /* 构造方法 */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* 列表容量 */
    int size() {
        return tree.size();
    }

    /* 获取索引为 i 节点的值 */
    int val(int i) {
        // 若索引越界，则返回 INT_MAX ，代表空位
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 获取索引为 i 节点的父节点的索引 */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* 层序遍历 */
    vector<int> levelOrder() {
        vector<int> res;
        // 直接遍历数组
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* 前序遍历 */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* 中序遍历 */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* 后序遍历 */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* 深度优先遍历 */
    void dfs(int i, string order, vector<int> &res) {
        // 若为空位，则返回
        if (val(i) == INT_MAX)
            return;
        // 前序遍历
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // 中序遍历
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // 后序遍历
        if (order == "post")
            res.push_back(val(i));
    }
};

/* Driver Code */
int main() {
    // 初始化二叉树
    // 使用 INT_MAX 代表空位 nullptr
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\n初始化二叉树\n";
    cout << "二叉树的数组表示：\n";
    printVector(arr);
    cout << "二叉树的链表表示：\n";
    printTree(root);

    // 数组表示下的二叉树类
    ArrayBinaryTree abt(arr);

    // 访问节点
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\n当前节点的索引为 " << i << "，值为 " << abt.val(i) << "\n";
    cout << "其左子节点的索引为 " << l << "，值为 " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "其右子节点的索引为 " << r << "，值为 " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "其父节点的索引为 " << p << "，值为 " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // 遍历树
    vector<int> res = abt.levelOrder();
    cout << "\n层序遍历为： ";
    printVector(res);
    res = abt.preOrder();
    cout << "前序遍历为： ";
    printVector(res);
    res = abt.inOrder();
    cout << "中序遍历为： ";
    printVector(res);
    res = abt.postOrder();
    cout << "后序遍历为： ";
    printVector(res);

    return 0;
}
