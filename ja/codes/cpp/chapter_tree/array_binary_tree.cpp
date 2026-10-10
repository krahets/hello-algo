/**
 * File: array_binary_tree.cpp
 * Created Time: 2023-07-19
 * Author: krahets (krahets@163.com)
 */

#include "../utils/common.hpp"

/* 配列表現による二分木クラス */
class ArrayBinaryTree {
  public:
    /* コンストラクタ */
    ArrayBinaryTree(vector<int> arr) {
        tree = arr;
    }

    /* リスト容量 */
    int size() {
        return tree.size();
    }

    /* インデックス i のノードの値を取得 */
    int val(int i) {
        // インデックスが範囲外なら、空きを表す INT_MAX を返す
        if (i < 0 || i >= size())
            return INT_MAX;
        return tree[i];
    }

    /* インデックス i のノードの左子ノードのインデックスを取得 */
    int left(int i) {
        return 2 * i + 1;
    }

    /* インデックス i のノードの右子ノードのインデックスを取得 */
    int right(int i) {
        return 2 * i + 2;
    }

    /* インデックス i のノードの親ノードのインデックスを取得 */
    int parent(int i) {
        return (i - 1) / 2;
    }

    /* レベル順走査 */
    vector<int> levelOrder() {
        vector<int> res;
        // 配列を直接走査する
        for (int i = 0; i < size(); i++) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    /* 先行順走査 */
    vector<int> preOrder() {
        vector<int> res;
        dfs(0, "pre", res);
        return res;
    }

    /* 中順走査 */
    vector<int> inOrder() {
        vector<int> res;
        dfs(0, "in", res);
        return res;
    }

    /* 後順走査 */
    vector<int> postOrder() {
        vector<int> res;
        dfs(0, "post", res);
        return res;
    }

  private:
    vector<int> tree;

    /* 深さ優先探索 */
    void dfs(int i, string order, vector<int> &res) {
        // 空きスロットなら返す
        if (val(i) == INT_MAX)
            return;
        // 先行順走査
        if (order == "pre")
            res.push_back(val(i));
        dfs(left(i), order, res);
        // 中順走査
        if (order == "in")
            res.push_back(val(i));
        dfs(right(i), order, res);
        // 後順走査
        if (order == "post")
            res.push_back(val(i));
    }
};

/* Driver Code */
int main() {
    // 二分木を初期化する
    // 空き位置 nullptr は INT_MAX で表す
    vector<int> arr = {1, 2, 3, 4, INT_MAX, 6, 7, 8, 9, INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15};
    TreeNode *root = vectorToTree(arr);
    cout << "\n二分木を初期化\n";
    cout << "二分木の配列表現：\n";
    printVector(arr);
    cout << "二分木の連結リスト表現：\n";
    printTree(root);

    // 配列表現による二分木クラス
    ArrayBinaryTree abt(arr);

    // ノードにアクセス
    int i = 1;
    int l = abt.left(i), r = abt.right(i), p = abt.parent(i);
    cout << "\n現在のノードのインデックスは " << i << "、値は " << abt.val(i) << "\n";
    cout << "左の子ノードのインデックスは " << l << "、値は " << (abt.val(l) != INT_MAX ? to_string(abt.val(l)) : "nullptr") << "\n";
    cout << "右の子ノードのインデックスは " << r << "、値は " << (abt.val(r) != INT_MAX ? to_string(abt.val(r)) : "nullptr") << "\n";
    cout << "親ノードのインデックスは " << p << "、値は " << (abt.val(p) != INT_MAX ? to_string(abt.val(p)) : "nullptr") << "\n";

    // 木を走査
    vector<int> res = abt.levelOrder();
    cout << "\nレベル順走査： ";
    printVector(res);
    res = abt.preOrder();
    cout << "先行順走査： ";
    printVector(res);
    res = abt.inOrder();
    cout << "中間順走査： ";
    printVector(res);
    res = abt.postOrder();
    cout << "後行順走査： ";
    printVector(res);

    return 0;
}
