/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL 木 */
class AVLTree {
    public TreeNode? root; // 根ノード

    /* ノードの高さを取得する */
    int Height(TreeNode? node) {
        // 空ノードの高さは -1 、葉ノードの高さは 0
        return node == null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    void UpdateHeight(TreeNode node) {
        // ノードの高さは、最も高い部分木の高さ + 1
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* 平衡係数を取得する */
    public int BalanceFactor(TreeNode? node) {
        // 空ノードの平衡係数は 0
        if (node == null) return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return Height(node.left) - Height(node.right);
    }

    /* 右回転操作 */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // child を中心に node を右回転する
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        UpdateHeight(node);
        UpdateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 左回転操作 */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // child を中心に node を左回転する
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        UpdateHeight(node);
        UpdateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 回転操作によって、この部分木の平衡を回復する */
    TreeNode? Rotate(TreeNode? node) {
        // ノード node の平衡係数を取得する
        int balanceFactorInt = BalanceFactor(node);
        // 左に偏った木
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // 右回転
                return RightRotate(node);
            } else {
                // 左回転してから右回転する
                node!.left = LeftRotate(node!.left);
                return RightRotate(node);
            }
        }
        // 右に偏った木
        if (balanceFactorInt < -1) {
            if (BalanceFactor(node?.right) <= 0) {
                // 左回転
                return LeftRotate(node);
            } else {
                // 右回転してから左回転する
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // 平衡な木なので、回転せずにそのまま返す
        return node;
    }

    /* ノードを挿入する */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. 挿入位置を探してノードを挿入する */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // 重複したノードは挿入せず、そのまま戻る
        UpdateHeight(node);  // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = Rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを削除する */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. ノードを探して削除する */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // 子ノード数 = 0 の場合、node を削除して戻る
                if (child == null)
                    return null;
                // 子ノード数 = 1 の場合、node を削除する
                else
                    node = child;
            } else {
                // 子ノード数 = 2 の場合、通りがけ順で次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // ノードの高さを更新する
        /* 2. 回転操作によって、この部分木の平衡を回復する */
        node = Rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを探索する */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
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
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\nノードの挿入： " + val + " 、操作後の AVL 木");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\nノードの削除： " + val + " 、操作後の AVL 木");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* 空の AVL 木を初期化する */
        AVLTree avlTree = new();

        /* ノードを挿入する */
        // ノード挿入後、AVL 木がどのように平衡を保つかに注目する
        TestInsert(avlTree, 1);
        TestInsert(avlTree, 2);
        TestInsert(avlTree, 3);
        TestInsert(avlTree, 4);
        TestInsert(avlTree, 5);
        TestInsert(avlTree, 8);
        TestInsert(avlTree, 7);
        TestInsert(avlTree, 9);
        TestInsert(avlTree, 10);
        TestInsert(avlTree, 6);

        /* 重複したノードを挿入する */
        TestInsert(avlTree, 7);

        /* ノードを削除する */
        // ノード削除後、AVL 木がどのように平衡を保つかに注目する
        TestRemove(avlTree, 8); // 次数 0 のノードを削除する
        TestRemove(avlTree, 5); // 次数 1 のノードを削除する
        TestRemove(avlTree, 4); // 次数 2 のノードを削除する

        /* ノードを探索する */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\n見つかったノードオブジェクトは " + node + "、ノードの値 = " + node?.val);
    }
}
