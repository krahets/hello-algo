/**
 * File: avl_tree.java
 * Created Time: 2022-12-10
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* AVL 木 */
class AVLTree {
    TreeNode root; // 根ノード

    /* ノードの高さを取得する */
    public int height(TreeNode node) {
        // 空ノードの高さは -1 、葉ノードの高さは 0
        return node == null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    private void updateHeight(TreeNode node) {
        // ノードの高さは、最も高い部分木の高さ + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }

    /* 平衡係数を取得する */
    public int balanceFactor(TreeNode node) {
        // 空ノードの平衡係数は 0
        if (node == null)
            return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right);
    }

    /* 右回転操作 */
    private TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // child を中心に node を右回転する
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 左回転操作 */
    private TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // child を中心に node を左回転する
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 回転操作によって、この部分木の平衡を回復する */
    private TreeNode rotate(TreeNode node) {
        // ノード node の平衡係数を取得する
        int balanceFactor = balanceFactor(node);
        // 左に偏った木
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 左回転してから右回転する
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // 右に偏った木
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 右回転してから左回転する
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // 平衡な木なので、回転せずにそのまま返す
        return node;
    }

    /* ノードを挿入する */
    public void insert(int val) {
        root = insertHelper(root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    private TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. 挿入位置を探してノードを挿入する */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // 重複したノードは挿入せず、そのまま戻る
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを削除する */
    public void remove(int val) {
        root = removeHelper(root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    private TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. ノードを探して削除する */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // 子ノード数 = 0 の場合、node を削除して戻る
                if (child == null)
                    return null;
                // 子ノード数 = 1 の場合、node を削除する
                else
                    node = child;
            } else {
                // 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを探索する */
    public TreeNode search(int val) {
        TreeNode cur = root;
        // 繰り返し探索し、葉ノードを越えたら終了する
        while (cur != null) {
            // 目的のノードは cur の右部分木にある
            if (cur.val < val)
                cur = cur.right;
            // 目的のノードは cur の左部分木にある
            else if (cur.val > val)
                cur = cur.left;
            // 目的のノードが見つかったので、ループを終了する
            else
                break;
        }
        // 目的のノードを返す
        return cur;
    }
}

public class avl_tree {
    static void testInsert(AVLTree tree, int val) {
        tree.insert(val);
        System.out.println("\nノードの挿入： " + val + " 、操作後の AVL 木");
        PrintUtil.printTree(tree.root);
    }

    static void testRemove(AVLTree tree, int val) {
        tree.remove(val);
        System.out.println("\nノードの削除： " + val + " 、操作後の AVL 木");
        PrintUtil.printTree(tree.root);
    }

    public static void main(String[] args) {
        /* 空の AVL 木を初期化する */
        AVLTree avlTree = new AVLTree();

        /* ノードを挿入する */
        // ノード挿入後、AVL 木がどのように平衡を保つかに注目する
        testInsert(avlTree, 1);
        testInsert(avlTree, 2);
        testInsert(avlTree, 3);
        testInsert(avlTree, 4);
        testInsert(avlTree, 5);
        testInsert(avlTree, 8);
        testInsert(avlTree, 7);
        testInsert(avlTree, 9);
        testInsert(avlTree, 10);
        testInsert(avlTree, 6);

        /* 重複したノードを挿入する */
        testInsert(avlTree, 7);

        /* ノードを削除する */
        // ノード削除後、AVL 木がどのように平衡を保つかに注目する
        testRemove(avlTree, 8); // 次数 0 のノードを削除する
        testRemove(avlTree, 5); // 次数 1 のノードを削除する
        testRemove(avlTree, 4); // 次数 2 のノードを削除する

        /* ノードを探索する */
        TreeNode node = avlTree.search(7);
        System.out.println("\n見つかったノードオブジェクトは " + node + "、ノードの値 = " + node.val);
    }
}
