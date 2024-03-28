/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* 層序走訪 */
    List<int> LevelOrder(TreeNode root) {
        // 初始化佇列，加入根節點
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // 初始化一個串列，用於儲存走訪序列
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // 隊列出隊
            list.Add(node.val!.Value);       // 儲存節點值
            if (node.left != null)
                queue.Enqueue(node.left);    // 左子節點入列
            if (node.right != null)
                queue.Enqueue(node.right);   // 右子節點入列
        }
        return list;
    }

    [Test]
    public void Test() {
        /* 初始化二元樹 */
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n初始化二元樹\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\n層序走訪的節點列印序列 = " + string.Join(",", list));
    }
}
