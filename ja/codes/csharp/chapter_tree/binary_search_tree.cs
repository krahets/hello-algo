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

    /* 二分木の根ノードを取得する */
    public TreeNode? GetRoot() {
        return root;
    }

    /* ノードを探索する */
    public TreeNode? Search(int num) {
        TreeNode? cur = root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < num) cur =
                cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 目的のノードが見つかったので、ループを終了する
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }

    /* ノードを挿入する */
    public void Insert(int num) {
        // 木が空の場合、根ノードを初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode? cur = root, pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 重複したノードが見つかったので、そのまま戻る
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
        // 木が空の場合、そのまま早期リターンする
        if (root == null)
            return;
        TreeNode? cur = root, pre = null;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 削除対象のノードが見つかったので、ループを終了する
            if (cur.val == num)
                break;
            pre = cur;
            // 削除対象のノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除対象のノードは cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除対象のノードが存在しない場合、そのまま戻る
        if (cur == null)
            return;
        // 子ノード数 = 0 または 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数 = 0 / 1 の場合、child = null / その子ノード
            TreeNode? child = cur.left ?? cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre!.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除するノードが根ノードの場合、根ノードを指定し直す
                root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // 通りがけ順で cur の次のノードを取得する
            TreeNode? tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除する
            Remove(tmp.val!.Value);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    [Test]
    public void Test() {
        /* 二分探索木を初期化する */
        BinarySearchTree bst = new();
        // 挿入順序が異なると異なる二分木になることに注意。この順序ではパーフェクト二分木を生成できる
        int[] nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        foreach (int num in nums) {
            bst.Insert(num);
        }

        Console.WriteLine("\n初期化した二分木\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* ノードを探索する */
        TreeNode? node = bst.Search(7);
        Console.WriteLine("\n見つかったノードオブジェクトは " + node + "、ノードの値 = " + node?.val);

        /* ノードを挿入する */
        bst.Insert(16);
        Console.WriteLine("\nノード 16 を挿入した後の二分木\n");
        PrintUtil.PrintTree(bst.GetRoot());

        /* ノードを削除する */
        bst.Remove(1);
        Console.WriteLine("\nノード 1 を削除した後の二分木\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(2);
        Console.WriteLine("\nノード 2 を削除した後の二分木\n");
        PrintUtil.PrintTree(bst.GetRoot());
        bst.Remove(4);
        Console.WriteLine("\nノード 4 を削除した後の二分木\n");
        PrintUtil.PrintTree(bst.GetRoot());
    }
}
