/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* Array-based binary tree class */
public class ArrayBinaryTree(List<int?> arr) {
    List<int?> tree = new(arr);

    /* List capacity */
    public int Size() {
        return tree.Count;
    }

    /* Get the value of the node at index i */
    public int? Val(int i) {
        // If the index is out of bounds, return null, representing an empty spot
        if (i < 0 || i >= Size())
            return null;
        return tree[i];
    }

    /* Get the index of the left child of the node at index i */
    public int Left(int i) {
        return 2 * i + 1;
    }

    /* Get the index of the right child of the node at index i */
    public int Right(int i) {
        return 2 * i + 2;
    }

    /* Get the index of the parent of the node at index i */
    public int Parent(int i) {
        return (i - 1) / 2;
    }

    /* Level-order traversal */
    public List<int> LevelOrder() {
        List<int> res = [];
        // Traverse array
        for (int i = 0; i < Size(); i++) {
            if (Val(i).HasValue)
                res.Add(Val(i)!.Value);
        }
        return res;
    }

    /* Depth-first traversal */
    void DFS(int i, string order, List<int> res) {
        // If it is an empty spot, return
        if (!Val(i).HasValue)
            return;
        // Pre-order traversal
        if (order == "pre")
            res.Add(Val(i)!.Value);
        DFS(Left(i), order, res);
        // In-order traversal
        if (order == "in")
            res.Add(Val(i)!.Value);
        DFS(Right(i), order, res);
        // Post-order traversal
        if (order == "post")
            res.Add(Val(i)!.Value);
    }

    /* Pre-order traversal */
    public List<int> PreOrder() {
        List<int> res = [];
        DFS(0, "pre", res);
        return res;
    }

    /* In-order traversal */
    public List<int> InOrder() {
        List<int> res = [];
        DFS(0, "in", res);
        return res;
    }

    /* Post-order traversal */
    public List<int> PostOrder() {
        List<int> res = [];
        DFS(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    [Test]
    public void Test() {
        // Initialize binary tree
        // Use a specific function to convert an array into a binary tree
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\nInitialize binary tree\n");
        Console.WriteLine("Binary tree's array representation:");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("Binary tree's linked list representation:");
        PrintUtil.PrintTree(root);

        // Array-based binary tree class
        ArrayBinaryTree abt = new(arr);

        // Access node
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\nThe current node's index is " + i + ", value =" + abt.Val(i));
        Console.WriteLine("The index of its left child node is " + l + ", value is " + (abt.Val(l).HasValue ? abt.Val(l) : "null")"));
        Console.WriteLine("The index of its right child node is " + r + ", value is " + (abt.Val(r).HasValue ? abt.Val(r) : "null")"));
        Console.WriteLine("The index of its parent node is " + p + ", value is " + (abt.Val(p).HasValue ? abt.Val(p) : "null")"));

        // Traverse tree
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\nLevel-order traversal is:" + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("Pre-order traversal is:" + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("In-order traversal is:" + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("Post-order traversal is:" + res.PrintList());
    }
}