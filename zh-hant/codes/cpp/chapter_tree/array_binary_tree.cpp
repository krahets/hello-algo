/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 陣列表示下的二元樹類別 */
class ArrayBinaryTree {
  public:
    /* 建構子 */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* 串列容量 */
    int size() {
        return tree.size();
    }

    /* 獲取索引為 i 節點的值 */
    int val(int i) {
        // 若索引越界，則返回 INT_MAX ，代表空位
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* 獲取索引為 i 節點的左子節點的索引 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* 獲取索引為 i 節點的右子節點的索引 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* 獲取索引為 i 節點的父節點的索引 */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* 層序走訪 */
    vector<int> levelOrder() {
        vector<int> res;
        // 直接走訪陣列
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* 前序走訪 */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* 中序走訪 */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* 後序走訪 */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* 深度優先走訪 */
    void dfs(int i, string order, vector<int> &res) {
        // 若為空位，則返回
        if (val(i) == INT_MAX)
            return;
        // 前序走訪
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // 中序走訪
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // 後序走訪
        if (order == "post")
            res.push_back(val(i));
    }
};

/* Driver Code */
int main() {
    // 初始化二元樹
    // 使用 INT_MAX 代表空位 nullptr
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\n初始化二元樹\n";
    cout << "二元樹的陣列表示：\n";
    printVector(arr);
    cout << "二元樹的鏈結串列表示：\n";
    printTree(root);

    // 陣列表示下的二元樹類別
    ArrayBinaryTree abt(arr);

    // 訪問節點
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\n當前節點的索引為 " << i << "，值為 " << abt.val(i) << "\n";
    cout << "其左子節點的索引為 " << l << "，值為 " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "其右子節點的索引為 " << r << "，值為 " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "其父節點的索引為 " << p << "，值為 " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // 走訪樹
    vector<int> res = abt.levelOrder();
    cout << "\n層序走訪為： ";
    printVector(res);
    res = abt.preOrder();
    cout << "前序走訪為： ";
    printVector(res);
    res = abt.inOrder();
    cout << "中序走訪為： ";
    printVector(res);
    res = abt.postOrder();
    cout << "後序走訪為： ";
    printVector(res);

    return 0;
}
