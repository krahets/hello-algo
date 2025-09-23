/**
 * File: avl_tree.java
 * Created Time: 2022-12-10
 * Author: krahets (krahets@163.com)
 */

package chapter_tree;

import utils.*;

/* AVL木 */
class AVLTree {
    TreeNode root; // 根ノード

    /* ノードの高さを取得 */
    public int height(TreeNode node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node == null ? -1 : node.height;
    }

    /* ノードの高さを更新 */
    private void updateHeight(TreeNode node) {
        // ノードの高さは最も高い部分木の高さ + 1
        node.height = Math.max(height(node.left), height(node.right)) + 1;
    }

    /* 平衡因子を取得 */
    public int balanceFactor(TreeNode node) {
        // 空ノードの平衡因子は 0
        if (node == null)
            return 0;
        // ノードの平衡因子 = 左部分木の高さ - 右部分木の高さ
        return height(node.left) - height(node.right);
    }

    /* 右回転操作 */
    private TreeNode rightRotate(TreeNode node) {
        TreeNode child = node.left;
        TreeNode grandChild = child.right;
        // child を軸として node を右に回転
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根を返す
        return child;
    }

    /* 左回転操作 */
    private TreeNode leftRotate(TreeNode node) {
        TreeNode child = node.right;
        TreeNode grandChild = child.left;
        // child を軸として node を左に回転
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新
        updateHeight(node);
        updateHeight(child);
        // 回転後の部分木の根を返す
        return child;
    }

    /* 回転操作を実行して部分木の平衡を回復 */
    private TreeNode rotate(TreeNode node) {
        // node の平衡因子を取得
        int balanceFactor = balanceFactor(node);
        // 左傾斜の木
        if (balanceFactor > 1) {
            if (balanceFactor(node.left) >= 0) {
                // 右回転
                return rightRotate(node);
            } else {
                // 先に左回転、その後右回転
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // 右傾斜の木
        if (balanceFactor < -1) {
            if (balanceFactor(node.right) <= 0) {
                // 左回転
                return leftRotate(node);
            } else {
                // 先に右回転、その後左回転
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        // 平衡木、回転は不要、戻る
        return node;
    }

    /* ノードを挿入 */
    public void insert(int val) {
        root = insertHelper(root, val);
    }

    /* 再帰的にノードを挿入（補助メソッド） */
    private TreeNode insertHelper(TreeNode node, int val) {
        if (node == null)
            return new TreeNode(val);
        /* 1. 挿入位置を見つけてノードを挿入 */
        if (val < node.val)
            node.left = insertHelper(node.left, val);
        else if (val > node.val)
            node.right = insertHelper(node.right, val);
        else
            return node; // 重複ノードは挿入しない、戻る
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを削除 */
    public void remove(int val) {
        root = removeHelper(root, val);
    }

    /* 再帰的にノードを削除（補助メソッド） */
    private TreeNode removeHelper(TreeNode node, int val) {
        if (node == null)
            return null;
        /* 1. ノードを見つけて削除 */
        if (val < node.val)
            node.left = removeHelper(node.left, val);
        else if (val > node.val)
            node.right = removeHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode child = node.left != null ? node.left : node.right;
                // 子ノード数 = 0、ノードを削除して戻る
                if (child == null)
                    return null;
                // 子ノード数 = 1、ノードを削除
                else
                    node = child;
            } else {
                // 子ノード数 = 2、中順走査の次のノードを削除し、現在のノードをそれで置き換える
                TreeNode temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = removeHelper(node.right, temp.val);
                node.val = temp.val;
            }
        }
        updateHeight(node); // ノードの高さを更新
        /* 2. 回転操作を実行して部分木の平衡を回復 */
        node = rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを検索 */
    public TreeNode search(int val) {
        TreeNode cur = root;
        // ループで検索、葉ノードを通過後に終了
        while (cur != null) {
            // 対象ノードは cur の右部分木にある
            if (cur.val < val)
                cur = cur.right;
            // 対象ノードは cur の左部分木にある
            else if (cur.val > val)
                cur = cur.left;
            // 対象ノードを見つけた、ループを終了
            else
                break;
        }
        // 対象ノードを返す
        return cur;
    }
}

public class avl_tree {
    static void testInsert(AVLTree tree, int val) {
        tree.insert(val);
        System.out.println("\nノード " + val + " を挿入後、AVL木は ");
        PrintUtil.printTree(tree.root);
    }

    static void testRemove(AVLTree tree, int val) {
        tree.remove(val);
        System.out.println("\nノード " + val + " を削除後、AVL木は ");
        PrintUtil.printTree(tree.root);
    }

    public static void main(String[] args) {
        /* 空のAVL木を初期化 */
        AVLTree avlTree = new AVLTree();

        /* ノードを挿入 */
        // ノード挿入後にAVL木がどのように平衡を保つかを確認
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

        /* 重複ノードを挿入 */
        testInsert(avlTree, 7);

        /* ノードを削除 */
        // ノード削除後にAVL木がどのように平衡を保つかを確認
        testRemove(avlTree, 8); // 次数 0 のノードを削除
        testRemove(avlTree, 5); // 次数 1 のノードを削除
        testRemove(avlTree, 4); // 次数 2 のノードを削除

        /* ノードを検索 */
        TreeNode node = avlTree.search(7);
        System.out.println("\n見つかったノードオブジェクトは " + node + "、ノードの値 = " + node.val);
    }
}