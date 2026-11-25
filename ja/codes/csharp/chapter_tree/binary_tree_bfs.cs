/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* レベル順走査 */
    List<int> LevelOrder(TreeNode root) {
        // キューを初期化して根を入れる
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // 走査順を記録するリストを初期化する
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // キューの先頭から取り出す
            list.Add(node.val!.Value);       // ノードの値を記録する
            if (node.left != null)
                queue.Enqueue(node.left);    // 左の子をキューに入れる
            if (node.right != null)
                queue.Enqueue(node.right);   // 右の子をキューに入れる
        }
        return list;
    }

    [Test]
    public void Test() {
        /* 二分木を初期化する */
        // ここでは配列から直接二分木を作る関数を使う
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\n二分木を初期化\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\nレベル順に出力したノードの列 = " + string.Join(",", list));
    }
}
