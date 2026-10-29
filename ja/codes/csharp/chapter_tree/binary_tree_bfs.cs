/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* レベル順走査 */
    List<int> LevelOrder(TreeNode root) {
        // キューを初期化し、根ノードを追加する
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // 走査順序を保存するリストを初期化する
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // キューからデキューする
            list.Add(node.val!.Value);       // ノードの値を保存する
            if (node.left != null)
                queue.Enqueue(node.left);    // 左の子ノードをエンキューする
            if (node.right != null)
                queue.Enqueue(node.right);   // 右の子ノードをエンキューする
        }
        return list;
    }

    [Test]
    public void Test() {
        /* 二分木を初期化する */
        // ここでは配列から二分木を直接生成する関数を使う
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化する\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\nレベル順走査で表示するノードの順序 = " + string.Join(",", list));
    }
}
