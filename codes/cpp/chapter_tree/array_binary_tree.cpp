/**
 * File: array_binary_tree.cpp
 * Created Time: 2026-05-19
 * Author: miaochengyou1119(https://github.com/miaochengyou1119)
 * Improved: 现代化 C++ 风格、类型安全、鲁棒性、可读性
 */

#include "../utils/common.hpp"
#include <vector>
#include <climits>
#include <string>
#include <stdexcept>

// 使用枚举替代字符串，类型安全、效率更高
enum class TraversalOrder {
    PRE_ORDER,
    IN_ORDER,
    POST_ORDER
};

/* 数组表示下的二叉树类 */
class ArrayBinaryTree {
public:
    //  explicit 禁止隐式转换，更安全
    explicit ArrayBinaryTree(const std::vector<int>& arr) : tree(arr) {}

    // 成员函数标记为 const，不修改成员变量
    size_t size() const {
        return tree.size();
    }

    // 获取索引为 i 节点的值，越界/空节点返回空值标识
    int val(size_t i) const {
        if (i >= size())
            return INT_MAX;
        return tree[i];
    }

    // 子节点 / 父节点索引计算，统一使用 size_t
    size_t left(size_t i) const {
        return 2 * i + 1;
    }

    size_t right(size_t i) const {
        return 2 * i + 2;
    }

    size_t parent(size_t i) const {
        return (i - 1) / 2;
    }

    // 层序遍历
    std::vector<int> levelOrder() const {
        std::vector<int> res;
        for (size_t i = 0; i < size(); ++i) {
            if (val(i) != INT_MAX)
                res.push_back(val(i));
        }
        return res;
    }

    // 前/中/后序遍历
    std::vector<int> preOrder() const {
        std::vector<int> res;
        dfs(0, TraversalOrder::PRE_ORDER, res);
        return res;
    }

    std::vector<int> inOrder() const {
        std::vector<int> res;
        dfs(0, TraversalOrder::IN_ORDER, res);
        return res;
    }

    std::vector<int> postOrder() const {
        std::vector<int> res;
        dfs(0, TraversalOrder::POST_ORDER, res);
        return res;
    }

private:
    std::vector<int> tree;

    // 私有 DFS，const 安全、枚举类型、无字符串比较
    void dfs(size_t i, TraversalOrder order, std::vector<int>& res) const {
        int node_val = val(i);
        if (node_val == INT_MAX)
            return;

        if (order == TraversalOrder::PRE_ORDER)
            res.push_back(node_val);

        dfs(left(i), order, res);

        if (order == TraversalOrder::IN_ORDER)
            res.push_back(node_val);

        dfs(right(i), order, res);

        if (order == TraversalOrder::POST_ORDER)
            res.push_back(node_val);
    }
};

/* Driver Code */
int main() {
    // 初始化二叉树
    const std::vector<int> arr = {
        1, 2, 3, 4, INT_MAX, 6, 7, 8, 9,
        INT_MAX, INT_MAX, 12, INT_MAX, INT_MAX, 15
    };

    TreeNode* root = vectorToTree(arr);
    std::cout << "\n初始化二叉树\n";
    std::cout << "二叉树的数组表示：\n";
    printVector(arr);
    std::cout << "二叉树的链表表示：\n";
    printTree(root);

    // 数组表示二叉树
    const ArrayBinaryTree abt(arr);

    // 访问节点
    const size_t i = 1;
    const size_t l = abt.left(i);
    const size_t r = abt.right(i);
    const size_t p = abt.parent(i);

    std::cout << "\n当前节点的索引为 " << i
              << "，值为 " << abt.val(i) << "\n";

    auto print_node = [&](size_t idx, const std::string& name) {
        if (abt.val(idx) != INT_MAX)
            std::cout << "其" << name << "子节点的索引为 " << idx
                      << "，值为 " << abt.val(idx) << "\n";
        else
            std::cout << "其" << name << "子节点的索引为 " << idx
                      << "，值为 nullptr\n";
    };

    print_node(l, "左");
    print_node(r, "右");
    std::cout << "其父节点的索引为 " << p
              << "，值为 " << abt.val(p) << "\n";

    // 遍历
    std::vector<int> res = abt.levelOrder();
    std::cout << "\n层序遍历为： ";
    printVector(res);

    res = abt.preOrder();
    std::cout << "前序遍历为： ";
    printVector(res);

    res = abt.inOrder();
    std::cout << "中序遍历为： ";
    printVector(res);

    res = abt.postOrder();
    std::cout << "后序遍历为： ";
    printVector(res);

    return 0;
}
