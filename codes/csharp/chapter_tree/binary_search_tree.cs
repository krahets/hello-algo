/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

class BinarySearchTree {
    TreeNode? root;

    public BinarySearchTree(int[] nums) {
        Array.Sort(nums); // 排序数组
        root = buildTree(nums, 0, nums.Length - 1);  // 构建二叉搜索树
    }

    /* 获取二叉树根节点 */
    public TreeNode? getRoot() {
        return root;
    }

    /* 构建二叉搜索树 */
    public TreeNode? buildTree(int[] nums, int i, int j) {
        if (i > j)
            return null;
        // 将数组中间节点作为根节点
        int mid = (i + j) / 2;
        TreeNode root = new TreeNode(nums[mid]);
        // 递归建立左子树和右子树
        root.left = buildTree(nums, i, mid - 1);
        root.right = buildTree(nums, mid + 1, j);

        return root;
    }

    /* 查找节点 */
    public TreeNode? search(int num) {
        TreeNode? cur = root;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 目标节点在 cur 的右子树中
            if (cur.val < num) cur =
                cur.right;
            // 目标节点在 cur 的左子树中
            else if (cur.val > num)
                cur = cur.left;
            // 找到目标节点，跳出循环
            else
                break;
        }
        // 返回目标节点
        return cur;
    }

    /* 插入节点 */
    public void insert(int num) {
        // 若树为空，直接提前返回
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到重复节点，直接返回
            if (cur.val == num)
                return;
            pre = cur;
            // 插入位置在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 插入位置在 cur 的左子树中
            else
                cur = cur.left;
        }

        // 插入节点
        TreeNode node = new TreeNode(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* 删除节点 */
    public void remove(int num) {
        // 若树为空，直接提前返回
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // 循环查找，越过叶节点后跳出
        while (cur != null) {
            // 找到待删除节点，跳出循环
            if (cur.val == num)
                break;
            pre = cur;
            // 待删除节点在 cur 的右子树中
            if (cur.val < num)
                cur = cur.right;
            // 待删除节点在 cur 的左子树中
            else
                cur = cur.left;
        }
        // 若无待删除节点，则直接返回
        if (cur == null || pre == null)
            return;
        // 子节点数量 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 当子节点数量 = 0 / 1 时， child = null / 该子节点
            TreeNode? child = cur.left != null ? cur.left : cur.right;
            // 删除节点 cur
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 若删除节点为根节点，则重新指定根节点
                root = child;
            }
        }
        // 子节点数量 = 2
        else {
            // 获取中序遍历中 cur 的下一个节点
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 递归删除节点 tmp
            remove(tmp.val);
            // 用 tmp 覆盖 cur
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* 初始化二叉搜索树 */
        int[] nums = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
        BinarySearchTree bst = new BinarySearchTree(nums);
        Console.WriteLine("\n初始化的二叉树为\n");
        PrintUtil.PrintTree(bst.getRoot());

        /* 查找节点 */
        TreeNode? node = bst.search(7);
        Console.WriteLine("\n查找到的节点对象为 " + node + "，节点值 = " + node.val);

        /* 插入节点 */
        bst.insert(16);
        Console.WriteLine("\n插入节点 16 后，二叉树为\n");
        PrintUtil.PrintTree(bst.getRoot());

        /* 删除节点 */
        bst.remove(1);
        Console.WriteLine("\n删除节点 1 后，二叉树为\n");
        PrintUtil.PrintTree(bst.getRoot());
        bst.remove(2);
        Console.WriteLine("\n删除节点 2 后，二叉树为\n");
        PrintUtil.PrintTree(bst.getRoot());
        bst.remove(4);
        Console.WriteLine("\n删除节点 4 后，二叉树为\n");
        PrintUtil.PrintTree(bst.getRoot());
    }
}
