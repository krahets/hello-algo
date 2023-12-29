/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL 树 */
class AVLTree {
    public TreeNode? root; // 根节点

    /* 获取节点高度 */
    int Height(TreeNode? node) {
        // 空节点高度为 -1 ，叶节点高度为 0
        return node == null ? -1 : node.height;
    }

    /* 更新节点高度 */
    void UpdateHeight(TreeNode node) {
        // 节点高度等于最高子树高度 + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* 获取平衡因子 */
    public int BalanceFactor(TreeNode? node) {
        // 空节点平衡因子为 0
        if (node == null) return 0;
        // 节点平衡因子 = 左子树高度 - 右子树高度
        return Height(node.left) - Height(node.right);
    }

    /* 右旋操作 */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // 以 child 为原点，将 node 向右旋转
        child.right = node;
        node.left = grandChild;
        // 更新节点高度
        UpdateHeight(node);
        UpdateHeight(child);
        // 返回旋转后子树的根节点
        return child;
    }

    /* 左旋操作 */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // 以 child 为原点，将 node 向左旋转
        child.left = node;
        node.right = grandChild;
        // 更新节点高度
        UpdateHeight(node);
        UpdateHeight(child);
        // 返回旋转后子树的根节点
        return child;
    }

    /* 执行旋转操作，使该子树重新恢复平衡 */
    TreeNode? Rotate(TreeNode? node) {
        // 获取节点 node 的平衡因子
        int balanceFactorInt = BalanceFactor(node);
        // 左偏树
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // 右旋
                return RightRotate(node);
            } else {
                // 先左旋后右旋
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // 右偏树
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // 左旋
                return LeftRotate(node);
            } else {
                // 先右旋后左旋
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // 平衡树，无须旋转，直接返回
        return node;
    }

    /* 插入节点 */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* 递归插入节点（辅助方法） */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. 查找插入位置并插入节点 */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // 重复节点不插入，直接返回
        UpdateHeight(node);  // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = Rotate(node);
        // 返回子树的根节点
        return node;
    }

    /* 删除节点 */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* 递归删除节点（辅助方法） */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. 查找节点并删除 */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // 子节点数量 = 0 ，直接删除 node 并返回
                if (child == null)
                    return null;
                // 子节点数量 = 1 ，直接删除 node
                else
                    node = child;
            } else {
                // 子节点数量 = 2 ，则将中序遍历的下个节点删除，并用该节点替换当前节点
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // 更新节点高度
        /* 2. 执行旋转操作，使该子树重新恢复平衡 */
        node = Rotate(node);
        // 返回子树的根节点
        return node;
    }

    /* 查找节点 */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < val)
                cur = cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > val)
                cur = cur.left;
            // 找到目标节点，跳出循环
            else
                break;
        }
        // 返回目标节点
        return cur;
    }
}

public class avl_tree {
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\n插入节点 " + val + " 后，AVL 树为");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\n删除节点 " + val + " 后，AVL 树为");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* 初始化空 AVL 树 */
        AVLTree avlTree = new();

        /* 插入节点 */
        // 请关注插入节点后，AVL 树是如何保持平衡的
        TestInsert(avlTree, 1);
        TestInsert(avlTree, 2);
        TestInsert(avlTree, 3);
        TestInsert(avlTree, 4);
        TestInsert(avlTree, 5);
        TestInsert(avlTree, 8);
        TestInsert(avlTree, 7);
        TestInsert(avlTree, 9);
        TestInsert(avlTree, 10);
        TestInsert(avlTree, 6);

        /* 插入重复节点 */
        TestInsert(avlTree, 7);

        /* 删除节点 */
        // 请关注删除节点后，AVL 树是如何保持平衡的
        TestRemove(avlTree, 8); // 删除度为 0 的节点
        TestRemove(avlTree, 5); // 删除度为 1 的节点
        TestRemove(avlTree, 4); // 删除度为 2 的节点

        /* 查询节点 */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\n查找到的节点对象为 " + node + "，节点值 = " + node?.val);
    }
}
