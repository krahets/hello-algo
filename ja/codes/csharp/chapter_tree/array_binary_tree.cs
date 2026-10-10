/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* 配列表現による二分木クラス */
public class ArrayBinaryTree(List<int?> arr) {
    List<int?> tree = new(arr);

    /* リスト容量 */
    public int Size() {
        return tree.Count;
    }

    /* インデックス i のノードの値を取得 */
    public int? Val(int i) {
        // インデックスが範囲外なら、空きを表す null を返す
        if (i < 0 || i >= Size())
            return null;
        return tree[i];
    }

    /* インデックス i のノードの左子ノードのインデックスを取得 */
    public int Left(int i) {
        return 2 * i + 1;
    }

    /* インデックス i のノードの右子ノードのインデックスを取得 */
    public int Right(int i) {
        return 2 * i + 2;
    }

    /* インデックス i のノードの親ノードのインデックスを取得 */
    public int Parent(int i) {
        return (i - 1) / 2;
    }

    /* レベル順走査 */
    public List<int> LevelOrder() {
        List<int> res = [];
        // 配列を直接走査する
        for (int i = 0; i < Size(); i++) {
            if (Val(i).HasValue)
                res.Add(Val(i)!.Value);
        }
        return res;
    }

    /* 深さ優先探索 */
    void DFS(int i, string order, List<int> res) {
        // 空きスロットなら返す
        if (!Val(i).HasValue)
            return;
        // 先行順走査
        if (order == "pre")
            res.Add(Val(i)!.Value);
        DFS(Left(i), order, res);
        // 中順走査
        if (order == "in")
            res.Add(Val(i)!.Value);
        DFS(Right(i), order, res);
        // 後順走査
        if (order == "post")
            res.Add(Val(i)!.Value);
    }

    /* 先行順走査 */
    public List<int> PreOrder() {
        List<int> res = [];
        DFS(0, "pre", res);
        return res;
    }

    /* 中順走査 */
    public List<int> InOrder() {
        List<int> res = [];
        DFS(0, "in", res);
        return res;
    }

    /* 後順走査 */
    public List<int> PostOrder() {
        List<int> res = [];
        DFS(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    [Test]
    public void Test() {
        // 二分木を初期化
        // ここでは、配列から直接二分木を生成する関数を利用する
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\n二分木を初期化\n");
        Console.WriteLine("二分木の配列表現：");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("二分木のリンクドリスト表現：");
        PrintUtil.PrintTree(root);

        // 配列表現による二分木クラス
        ArrayBinaryTree abt = new(arr);

        // ノードにアクセス
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\n現在のノードのインデックスは " + i + " 、値は " + abt.Val(i));
        Console.WriteLine("左子ノードのインデックスは " + l + " 、値は " + (abt.Val(l).HasValue ? abt.Val(l) : "null"));
        Console.WriteLine("右子ノードのインデックスは " + r + " 、値は " + (abt.Val(r).HasValue ? abt.Val(r) : "null"));
        Console.WriteLine("親ノードのインデックスは " + p + " 、値は " + (abt.Val(p).HasValue ? abt.Val(p) : "null"));

        // 木を走査
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\nレベル順走査：" + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("前順走査：" + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("中順走査：" + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("後順走査：" + res.PrintList());
    }
}