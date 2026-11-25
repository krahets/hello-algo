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

    /* 二分木の根を取得する */
    public TreeNode? GetRoot() {
        return root;
    }

    /* ノードを探索する */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // ループで探索し、葉を越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num) cur =
                cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 目的のノードが見つかったのでループを抜ける
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }

    /* ノードを挿入する */
    public void Insert(int num) {
        // 木が空なら根を初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // ループで探索し、葉を越えたら終了する
        while (cur != null) {
            // 値が重複するノードが見つかったらそのまま戻る
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

        // ノードを挿入する
        TreeNode node = new(num);
        if (pre != null) {
            if (pre.val < num)
                pre.right = node;
            else
                pre.left = node;
        }
    }


    /* ノードを削除する */
    public void Remove(int num) {
        // 木が空ならすぐに戻る
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // ループで探索し、葉を越えたら終了する
        while (cur != null) {
            // 削除対象のノードが見つかったのでループを抜ける
            if (cur.val == num)
                break;
            pre = cur;
            // 削除対象は cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除対象は cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除対象が見つからなければそのまま戻る
        if (cur == null)
            return;
        // 子が 0 個または 1 個
        if (cur.left == null || cur.right == null) {
            // 子が 0 個なら child = null、1 個なら child はその子
            TreeNode? child = cur.left ?? cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除対象が根なら根を設定し直す
                root = child;
            }
        }
        // 子が 2 個
        else {
            // 通りがけ順で cur の次に来るノードを取得する
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除する
            Remove(tmp.val!.Value);
            // tmp の値で cur の値を上書きする
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* 二分探索木を初期化する */
        BinarySearchTree bst = new();
        // 挿入順によって木の形は変わる。この順に挿入すると完璧二分木になる
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\n初期化した二分木：\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* ノードを探索する */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\n見つかったノードのオブジェクト： " + node + "、ノードの値 = " + node?.val);

        /* ノードを挿入する */
        bst.Insert(16);
        Console.WriteLine("\nノード 16 を挿入した後の二分木：\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* ノードを削除する */
        bst.Remove(1);
        Console.WriteLine("\nノード 1 を削除した後の二分木：\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nノード 2 を削除した後の二分木：\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nノード 4 を削除した後の二分木：\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
