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
        /* 初始化二元樹 */
        // 初始化節點
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // 構建節點之間的引用（指標）
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        // [endregion]{init_binary_tree}
        Console.WriteLine("\n初始化二元樹\n");
        PrintUtil.PrintTree(n1);

        // [region]{insert_node}
        /* 插入與刪除節點 */
        TreeNode P = new(0);
        // 在 n1 -> n2 中間插入節點 P
        n1.left = P;
        P.left = n2;
        // [endregion]{insert_node}
        Console.WriteLine("\n插入節點 P 後\n");
        PrintUtil.PrintTree(n1);
        // [region]{remove_node}
        // 刪除節點 P
        n1.left = n2;
        // [endregion]{remove_node}
        Console.WriteLine("\n刪除節點 P 後\n");
        PrintUtil.PrintTree(n1);
    }
}
