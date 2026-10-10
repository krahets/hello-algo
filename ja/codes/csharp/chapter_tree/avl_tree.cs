/**
 * File: avl_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

/* AVL 木 */
class AVLTree {
    public TreeNode? root; // 根ノード

    /* ノードの高さを取得 */
    int Height(TreeNode? node) {
        // 空ノードの高さは -1、葉ノードの高さは 0
        return node == null ? -1 : node.height;
    }

    /* ノードの高さを更新する */
    void UpdateHeight(TreeNode node) {
        // ノードの高さは最も高い部分木の高さ + 1 に等しい
        node.height = Math.Max(Height(node.left), Height(node.right)) + 1;
    }

    /* 平衡係数を取得 */
    public int BalanceFactor(TreeNode? node) {
        // 空ノードの平衡係数は 0
        if (node == null) return 0;
        // ノードの平衡係数 = 左部分木の高さ - 右部分木の高さ
        return Height(node.left) - Height(node.right);
    }

    /* 右回転 */
    TreeNode? RightRotate(TreeNode? node) {
        TreeNode? child = node?.left;
        TreeNode? grandChild = child?.right;
        // child を支点として node を右回転させる
        child.right = node;
        node.left = grandChild;
        // ノードの高さを更新する
        UpdateHeight(node);
        UpdateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 左回転 */
    TreeNode? LeftRotate(TreeNode? node) {
        TreeNode? child = node?.right;
        TreeNode? grandChild = child?.left;
        // child を支点として node を左回転させる
        child.left = node;
        node.right = grandChild;
        // ノードの高さを更新する
        UpdateHeight(node);
        UpdateHeight(child);
        // 回転後の部分木の根ノードを返す
        return child;
    }

    /* 回転操作を行い、この部分木の平衡を回復する */
    TreeNode? Rotate(TreeNode? node) {
        // ノード node の平衡係数を取得
        int balanceFactorInt = BalanceFactor(node);
        // 左に偏った木
        if (balanceFactorInt > 1) {
            if (BalanceFactor(node?.left) >= 0) {
                // 右回転
                return RightRotate(node);
            } else {
                // 左回転してから右回転
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
                // 右回転してから左回転
                node!.right = RightRotate(node!.right);
                return LeftRotate(node);
            }
        }
        // 平衡木なので回転不要、そのまま返す
        return node;
    }

    /* ノードを挿入 */
    public void Insert(int val) {
        root = InsertHelper(root, val);
    }

    /* ノードを再帰的に挿入する（補助メソッド） */
    TreeNode? InsertHelper(TreeNode? node, int val) {
        if (node == null) return new TreeNode(val);
        /* 1. 挿入位置を探索してノードを挿入 */
        if (val < node.val)
            node.left = InsertHelper(node.left, val);
        else if (val > node.val)
            node.right = InsertHelper(node.right, val);
        else
            return node;     // 重複ノードは挿入せず、そのまま返す
        UpdateHeight(node);  // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = Rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを削除 */
    public void Remove(int val) {
        root = RemoveHelper(root, val);
    }

    /* ノードを再帰的に削除する（補助メソッド） */
    TreeNode? RemoveHelper(TreeNode? node, int val) {
        if (node == null) return null;
        /* 1. ノードを探索して削除 */
        if (val < node.val)
            node.left = RemoveHelper(node.left, val);
        else if (val > node.val)
            node.right = RemoveHelper(node.right, val);
        else {
            if (node.left == null || node.right == null) {
                TreeNode? child = node.left ?? node.right;
                // 子ノード数 = 0 の場合、node をそのまま削除して返す
                if (child == null)
                    return null;
                // 子ノード数 = 1 の場合、node をそのまま削除する
                else
                    node = child;
            } else {
                // 子ノード数 = 2 の場合、中順走査の次のノードを削除し、そのノードで現在のノードを置き換える
                TreeNode? temp = node.right;
                while (temp.left != null) {
                    temp = temp.left;
                }
                node.right = RemoveHelper(node.right, temp.val!.Value);
                node.val = temp.val;
            }
        }
        UpdateHeight(node);  // ノードの高さを更新する
        /* 2. 回転操作を行い、部分木の平衡を回復する */
        node = Rotate(node);
        // 部分木の根ノードを返す
        return node;
    }

    /* ノードを探索 */
    public TreeNode? Search(int val) {
        TreeNode? cur = root;
        // ループで探索し、葉ノードを越えたら抜ける
        while (cur != null) {
            // 目標ノードは cur の右部分木にある
            if (cur.val < val)
                cur = cur.right;
            // 目標ノードは cur の左部分木にある
            else if (cur.val > val)
                cur = cur.left;
            // 目標ノードが見つかったらループを抜ける
            else
                break;
        }
        // 目標ノードを返す
        return cur;
    }
}

public class avl_tree {
    static void TestInsert(AVLTree tree, int val) {
        tree.Insert(val);
        Console.WriteLine("\nノード " + val + " を挿入した後の AVL 木は");
        PrintUtil.PrintTree(tree.root);
    }

    static void TestRemove(AVLTree tree, int val) {
        tree.Remove(val);
        Console.WriteLine("\nノード " + val + " を削除した後、AVL 木は");
        PrintUtil.PrintTree(tree.root);
    }

    [Test]
    public void Test() {
        /* 空の AVL 木を初期化する */
        AVLTree avlTree = new();

        /* ノードを挿入 */
        // ノード挿入後に AVL 木がどのように平衡を保つかに注目してほしい
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

        /* 重複ノードを挿入する */
        TestInsert(avlTree, 7);

        /* ノードを削除 */
        // ノード削除後に AVL 木がどのように平衡を保つかに注目してほしい
        TestRemove(avlTree, 8); // 次数 0 のノードを削除する
        TestRemove(avlTree, 5); // 次数 1 のノードを削除する
        TestRemove(avlTree, 4); // 次数 2 のノードを削除する

        /* ノードを検索 */
        TreeNode? node = avlTree.Search(7);
        Console.WriteLine("\n見つかったノードオブジェクトは " + node + "、ノード値 = " + node?.val);
    }
}
