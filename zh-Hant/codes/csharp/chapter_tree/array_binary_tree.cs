/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* 陣列表示下的二元樹類別 */
public class ArrayBinaryTree(List<int?> arr) {
    List<int?> tree = new(arr);

    /* 串列容量 */
    public int Size() {
        return tree.Count;
    }

    /* 獲取索引為 i 節點的值 */
    public int? Val(int i) {
        // 若索引越界，則返回 null ，代表空位
        if (i < 0 || i >= Size())
            return null;
        return tree[i];
    }

    /* 獲取索引為 i 節點的左子節點的索引 */
    public int Left(int i) {
        return 2 * i + 1;
    }

    /* 獲取索引為 i 節點的右子節點的索引 */
    public int Right(int i) {
        return 2 * i + 2;
    }

    /* 獲取索引為 i 節點的父節點的索引 */
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
        // 若為空位，則返回
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
        // 這裡藉助了一個從陣列直接生成二元樹的函式
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\n初始化二元樹\n");
        Console.WriteLine("二元樹的陣列表示：");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("二元樹的鏈結串列表示：");
        PrintUtil.PrintTree(root);

        // 陣列表示下的二元樹類別
        ArrayBinaryTree abt = new(arr);

        // 訪問節點
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\n當前節點的索引為 " + i + " ，值為 " + abt.Val(i));
        Console.WriteLine("其左子節點的索引為 " + l + " ，值為 " + (abt.Val(l).HasValue ? abt.Val(l) : "null"));
        Console.WriteLine("其右子節點的索引為 " + r + " ，值為 " + (abt.Val(r).HasValue ? abt.Val(r) : "null"));
        Console.WriteLine("其父節點的索引為 " + p + " ，值為 " + (abt.Val(p).HasValue ? abt.Val(p) : "null"));

        // 走訪樹
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\n層序走訪為：" + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("前序走訪為：" + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("中序走訪為：" + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("後序走訪為：" + res.PrintList());
    }
}