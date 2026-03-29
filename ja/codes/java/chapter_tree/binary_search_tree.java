/**
 * File: binary_search_tree.java
 * Created Time: 2022-11-25
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* 二分探索木 */
class BinarySearchTree {
    private TreeNode root;

    /* コンストラクタ */
    public BinarySearchTree() {
        // 空の木を初期化する
        root = null;
    }

    /* 二分木の根ノードを取得 */
    public TreeNode getRoot() {
        return root;
    }

    /* ノードを探索 */
    public TreeNode search(int num) {
        TreeNode cur = root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
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
    public void insert(int num) {
        // 木が空なら、根ノードを初期化する
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
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
        TreeNode node = new TreeNode(num);
        if (pre.val < num)
            pre.right = node;
        else
            pre.left = node;
    }

    /* ノードを削除 */
    public void remove(int num) {
        // 木が空なら、そのまま早期リターンする
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
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
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // ノード cur を削除する
            if (cur != root) {
                if (pre.left == cur)
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
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // ノード tmp を再帰的に削除
            remove(tmp.val);
            // tmp で cur を上書きする
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* 二分探索木を初期化 */
        BinarySearchTree bst = new BinarySearchTree();
        // 注意：挿入順序が異なると異なる二分木が生成される。このシーケンスからは完全二分木を生成できる
        int[] nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        for (int num : nums) {
            bst.insert(num);
        }
        System.out.println("\n初期化した二分木は\n");
        PrintUtil.printTree(bst.getRoot());

        /* ノードを探索 */
        TreeNode node = bst.search(7);
        System.out.println("\n見つかったノードオブジェクトは " + node + "、ノード値 = " + node.val);

        /* ノードを挿入 */
        bst.insert(16);
        System.out.println("\nノード 16 を挿入した後の二分木は\n");
        PrintUtil.printTree(bst.getRoot());

        /* ノードを削除 */
        bst.remove(1);
        System.out.println("\nノード 1 を削除後，二分木は\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\nノード 2 を削除後，二分木は\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\nノード 4 を削除後，二分木は\n");
        PrintUtil.printTree(bst.getRoot());
    }
}
