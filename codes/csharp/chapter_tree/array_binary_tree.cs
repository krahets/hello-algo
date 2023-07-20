/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* 数组表示下的二叉树类 */
public class ArrayBinaryTree {
    private List<int?> tree;

    /* 构造方法 */
    public ArrayBinaryTree(List<int?> arr) {
        tree = new List<int?>(arr);
    }

    /* 节点数量 */
    public int size() {
        return tree.Count;
    }

    /* 获取索引为 i 节点的值 */
    public int? val(int i) {
        // 若索引越界，则返回 null ，代表空位
        if (i < 0 || i >= size())
            return null;
        return tree[i];
    }

    /* 获取索引为 i 节点的左子节点的索引 */
    public int left(int i) {
        return 2 * i + 1;
    }

    /* 获取索引为 i 节点的右子节点的索引 */
    public int right(int i) {
        return 2 * i + 2;
    }

    /* 获取索引为 i 节点的父节点的索引 */
    public int parent(int i) {
        return (i - 1) / 2;
    }

    /* 层序遍历 */
    public List<int> levelOrder() {
        List<int> res = new List<int>();
        // 直接遍历数组
        for (int i = 0; i < size(); i++) {
            if (val(i).HasValue)
                res.Add(val(i).Value);
        }
        return res;
    }

    /* 深度优先遍历 */
    private void dfs(int i, string order, List<int> res) {
        // 若为空位，则返回
        if (!val(i).HasValue)
            return;
        // 前序遍历
        if (order == "pre")
            res.Add(val(i).Value);
        dfs(left(i), order, res);
        // 中序遍历
        if (order == "in")
            res.Add(val(i).Value);
        dfs(right(i), order, res);
        // 后序遍历
        if (order == "post")
            res.Add(val(i).Value);
    }

    /* 前序遍历 */
    public List<int> preOrder() {
        List<int> res = new List<int>();
        dfs(0, "pre", res);
        return res;
    }

    /* 中序遍历 */
    public List<int> inOrder() {
        List<int> res = new List<int>();
        dfs(0, "in", res);
        return res;
    }

    /* 后序遍历 */
    public List<int> postOrder() {
        List<int> res = new List<int>();
        dfs(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    [Test]
    public void Test() {
        // 初始化二叉树
        // 这里借助了一个从数组直接生成二叉树的函数
        List<int?> arr = new List<int?> { 1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15 };

        TreeNode root = TreeNode.ListToTree(arr);
        Console.WriteLine("\n初始化二叉树\n");
        Console.WriteLine("二叉树的数组表示：");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("二叉树的链表表示：");
        PrintUtil.PrintTree(root);

        // 数组表示下的二叉树类
        ArrayBinaryTree abt = new ArrayBinaryTree(arr);

        // 访问节点
        int i = 1;
        int l = abt.left(i);
        int r = abt.right(i);
        int p = abt.parent(i);
        Console.WriteLine("\n当前节点的索引为 " + i + " ，值为 " + abt.val(i));
        Console.WriteLine("其左子节点的索引为 " + l + " ，值为 " + (abt.val(l).HasValue ? abt.val(l) : "null"));
        Console.WriteLine("其右子节点的索引为 " + r + " ，值为 " + (abt.val(r).HasValue ? abt.val(r) : "null"));
        Console.WriteLine("其父节点的索引为 " + p + " ，值为 " + (abt.val(p).HasValue ? abt.val(p) : "null"));

        // 遍历树
        List<int> res = abt.levelOrder();
        Console.WriteLine("\n层序遍历为：" + res.PrintList());
        res = abt.preOrder();
        Console.WriteLine("前序遍历为：" + res.PrintList());
        res = abt.inOrder();
        Console.WriteLine("中序遍历为：" + res.PrintList());
        res = abt.postOrder();
        Console.WriteLine("后序遍历为：" + res.PrintList());
    }
}