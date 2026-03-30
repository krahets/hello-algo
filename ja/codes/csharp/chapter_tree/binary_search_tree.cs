/**
 * File: binary_search_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

class BinarySearchTree {
    TreeNode? root;

    public BinarySearchTree() {
        // 空の木を初期化する
        root = null;
    }

    /* 二分木の根ノードを取得 */
    public TreeNode? GetRoot() {
        return root;
    }

    /* ノードを探索 */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < num) cur =
                cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else
                break;
        }
        // 目標ノードを返す
        return cur;
    }

    /* ノードを挿入 */
    public void Insert(int num) {
        // 木が空なら、根ノードを初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 重複ノードが見つかったら、直ちに返す
            if (cur.val == num)
                return;
            pre = cur;
            // 挿入位置は cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 挿入位置は cur の左部分木にある
            else
                cur = cur.left;
        }

        // ノードを挿入
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* ノードを削除 */
    public void Remove(int num) {
        // 木が空なら、そのまま早期リターンする
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 削除対象のノードが見つかったら、ループを抜ける
            if (cur.val == num)
                break;
            pre = cur;
            // 削除対象ノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除対象ノードは cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除対象ノードがなければそのまま返す
        if (cur == null)
            return;
        // 子ノード数 = 0 or 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数が 0 / 1 のとき、child = null / その子ノード
            TreeNode? child = cur.left ?? cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除ノードが根ノードなら、根ノードを再設定
                root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 中順走査における cur の次ノードを取得
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除
            Remove(tmp.val!.Value);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* 二分探索木を初期化 */
        BinarySearchTree bst = new();
        // 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\n初期化した二分木は\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* ノードを探索 */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\n見つかったノードオブジェクトは " + node + "、ノード値 = " + node?.val);

        /* ノードを挿入 */
        bst.Insert(16);
        Console.WriteLine("\nノード 16 を挿入した後、二分木は\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* ノードを削除 */
        bst.Remove(1);
        Console.WriteLine("\nノード 1 を削除した後、二分木は\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nノード 2 を削除した後、二分木は\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nノード 4 を削除した後、二分木は\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
