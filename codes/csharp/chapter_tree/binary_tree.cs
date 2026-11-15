/**
 * File: binary_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree {
    [Test]
    public void Test() {
        // [region]{init_binary_tree}
        /* 初始化二叉树 */
        // 初始化节点
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // 构建节点之间的引用（指针）
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        // [endregion]{init_binary_tree}
        Console.WriteLine("\n初始化二叉树\n");
        PrintUtil.PrintTree(n1);

        // [region]{insert_node}
        /* 插入与删除节点 */
        TreeNode P = new(0);
        // 在 n1 -> n2 中间插入节点 P
        n1.left = P;
        P.left = n2;
        // [endregion]{insert_node}
        Console.WriteLine("\n插入节点 P 后\n");
        PrintUtil.PrintTree(n1);
        // [region]{remove_node}
        // 删除节点 P
        n1.left = n2;
        // [endregion]{remove_node}
        Console.WriteLine("\n删除节点 P 后\n");
        PrintUtil.PrintTree(n1);
    }
}
