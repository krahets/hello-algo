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
        // 空の木を初期化
        root = null;
    }

    /* 二分木の根ノードを取得 */
    public TreeNode getRoot() {
        return root;
    }

    /* ノードを検索 */
    public TreeNode search(int num) {
        TreeNode cur = root;
        // ループで検索、葉ノードを通過後に終了
        while (cur != null) {
            // 対象ノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 対象ノードは cur の左部分木にある
            else if (cur.val > num)
                cur = cur.left;
            // 対象ノードを見つけた、ループを終了
            else
                break;
        }
        // 対象ノードを返す
        return cur;
    }

    /* ノードを挿入 */
    public void insert(int num) {
        // 木が空の場合、根ノードを初期化
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        TreeNode cur = root, pre = null;
        // ループで検索、葉ノードを通過後に終了
        while (cur != null) {
            // 重複ノードを見つけた場合、戻る
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
        // 木が空の場合、戻る
        if (root == null)
            return;
        TreeNode cur = root, pre = null;
        // ループで検索、葉ノードを通過後に終了
        while (cur != null) {
            // 削除するノードを見つけた、ループを終了
            if (cur.val == num)
                break;
            pre = cur;
            // 削除するノードは cur の右部分木にある
            if (cur.val < num)
                cur = cur.right;
            // 削除するノードは cur の左部分木にある
            else
                cur = cur.left;
        }
        // 削除するノードがない場合、戻る
        if (cur == null)
            return;
        // 子ノード数 = 0 または 1
        if (cur.left == null || cur.right == null) {
            // 子ノード数 = 0/1 の場合、child = null/その子ノード
            TreeNode child = cur.left != null ? cur.left : cur.right;
            // ノード cur を削除
            if (cur != root) {
                if (pre.left == cur)
                    pre.left = child;
                else
                    pre.right = child;
            } else {
                // 削除されるノードが根の場合、根を再割り当て
                root = child;
            }
        }
        // 子ノード数 = 2
        else {
            // cur の中順走査の次のノードを取得
            TreeNode tmp = cur.right;
            while (tmp.left != null) {
                tmp = tmp.left;
            }
            // 再帰的にノード tmp を削除
            remove(tmp.val);
            // cur を tmp で置き換える
            cur.val = tmp.val;
        }
    }
}

public class binary_search_tree {
    public static void main(String[] args) {
        /* 二分探索木を初期化 */
        BinarySearchTree bst = new BinarySearchTree();
        // 異なる挿入順序は様々な木構造を生成できることに注意。この特定の順序は完全二分木を作成する
        int[] nums = { 8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15 };
        for (int num : nums) {
            bst.insert(num);
        }
        System.out.println("\n初期化された二分木は\n");
        PrintUtil.printTree(bst.getRoot());

        /* ノードを検索 */
        TreeNode node = bst.search(7);
        System.out.println("\n見つかったノードオブジェクトは " + node + "、ノードの値 = " + node.val);

        /* ノードを挿入 */
        bst.insert(16);
        System.out.println("\nノード 16 を挿入後、二分木は\n");
        PrintUtil.printTree(bst.getRoot());

        /* ノードを削除 */
        bst.remove(1);
        System.out.println("\nノード 1 を削除後、二分木は\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(2);
        System.out.println("\nノード 2 を削除後、二分木は\n");
        PrintUtil.printTree(bst.getRoot());
        bst.remove(4);
        System.out.println("\nノード 4 を削除後、二分木は\n");
        PrintUtil.printTree(bst.getRoot());
    }
}