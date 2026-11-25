/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* 以陣列表示二元樹的類別 */
public class ArrayBinaryTree(List<int?> arr) {
    List<int?> tree = new(arr);

    /* 串列長度 */
    public int Size() {
        return tree.Count;
    }

    /* 取得索引 i 處的節點值 */
    public int? Val(int i) {
        // 若索引超出範圍，回傳 null 表示空位
        if (i < 0 || i >= Size())
            return null;
        return tree[i];
    }

    /* 取得索引 i 處節點的左子節點索引 */
    public int Left(int i) {
        return 2 * i + 1;
    }

    /* 取得索引 i 處節點的右子節點索引 */
    public int Right(int i) {
        return 2 * i + 2;
    }

    /* 取得索引 i 處節點的父節點索引 */
    public int Parent(int i) {
        return (i - 1) / 2;
    }

    /* 層序走訪 */
    public List<int> LevelOrder() {
        List<int> res = [];
        // 直接走訪陣列
        for (int i = 0; i < Size(); i++) {
            if (Val(i).HasValue)
                res.Add(Val(i)!.Value);
        }
        return res;
    }

    /* 深度優先走訪 */
    void DFS(int i, string order, List<int> res) {
        // 若為空位，直接返回
        if (!Val(i).HasValue)
            return;
        // 前序走訪
        if (order == "pre")
            res.Add(Val(i)!.Value);
        DFS(Left(i), order, res);
        // 中序走訪
        if (order == "in")
            res.Add(Val(i)!.Value);
        DFS(Right(i), order, res);
        // 後序走訪
        if (order == "post")
            res.Add(Val(i)!.Value);
    }

    /* 前序走訪 */
    public List<int> PreOrder() {
        List<int> res = [];
        DFS(0, "pre", res);
        return res;
    }

    /* 中序走訪 */
    public List<int> InOrder() {
        List<int> res = [];
        DFS(0, "in", res);
        return res;
    }

    /* 後序走訪 */
    public List<int> PostOrder() {
        List<int> res = [];
        DFS(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    [Test]
    public void Test() {
        // 初始化二元樹
        // 這裡使用能從陣列直接建立二元樹的函式
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\n初始化二元樹\n");
        Console.WriteLine("二元樹的陣列表示法：");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("二元樹的鏈結串列表示法：");
        PrintUtil.PrintTree(root);

        // 以陣列表示二元樹的類別
        ArrayBinaryTree abt = new(arr);

        // 存取節點
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\n目前節點的索引為 " + i + " ，值為 " + abt.Val(i));
        Console.WriteLine("其左子節點的索引為 " + l + " ，值為 " + (abt.Val(l).HasValue ? abt.Val(l) : "null"));
        Console.WriteLine("其右子節點的索引為 " + r + " ，值為 " + (abt.Val(r).HasValue ? abt.Val(r) : "null"));
        Console.WriteLine("其父節點的索引為 " + p + " ，值為 " + (abt.Val(p).HasValue ? abt.Val(p) : "null"));

        // 走訪樹
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\n層序走訪的結果：" + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("前序走訪的結果：" + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("中序走訪的結果：" + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("後序走訪的結果：" + res.PrintList());
    }
}