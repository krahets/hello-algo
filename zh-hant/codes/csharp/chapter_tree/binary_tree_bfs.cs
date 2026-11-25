/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* 層序走訪 */
    List<int> LevelOrder(TreeNode root) {
        // 初始化佇列並加入根節點
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // 初始化一個串列，用來儲存走訪序列
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // 從佇列前端取出節點
            list.Add(node.val!.Value);       // 儲存節點值
            if (node.left != null)
                queue.Enqueue(node.left);    // 將左子節點加入佇列
            if (node.right != null)
                queue.Enqueue(node.right);   // 將右子節點加入佇列
        }
        return list;
    }

    [Test]
    public void Test() {
        /* 初始化二元樹 */
        // 這裡使用能從陣列直接建立二元樹的函式
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n初始化二元樹\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\n依層序走訪印出的節點序列 = " + string.Join(",", list));
    }
}
