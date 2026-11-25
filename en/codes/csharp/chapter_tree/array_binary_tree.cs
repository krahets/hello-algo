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
        // If the index is out of bounds, return null to indicate an empty slot
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
        // Iterate directly over the array
        for (int i = 0; i < Size(); i++) {
            if (Val(i).HasValue)
                res.Add(Val(i)!.Value);
        }
        return res;
    }

    /* Depth-first traversal */
    void DFS(int i, string order, List<int> res) {
        // Return if the slot is empty
        if (!Val(i).HasValue)
            return;
        // Preorder traversal
        if (order == "pre")
            res.Add(Val(i)!.Value);
        DFS(Left(i), order, res);
        // Inorder traversal
        if (order == "in")
            res.Add(Val(i)!.Value);
        DFS(Right(i), order, res);
        // Postorder traversal
        if (order == "post")
            res.Add(Val(i)!.Value);
    }

    /* Preorder traversal */
    public List<int> PreOrder() {
        List<int> res = [];
        DFS(0, "pre", res);
        return res;
    }

    /* Inorder traversal */
    public List<int> InOrder() {
        List<int> res = [];
        DFS(0, "in", res);
        return res;
    }

    /* Postorder traversal */
    public List<int> PostOrder() {
        List<int> res = [];
        DFS(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    [Test]
    public void Test() {
        // Initialize the binary tree
        // Use a function that builds a binary tree directly from an array
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\nInitialize the binary tree\n");
        Console.WriteLine("Array representation of the binary tree: ");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("Linked representation of the binary tree: ");
        PrintUtil.PrintTree(root);

        // Array-based binary tree class
        ArrayBinaryTree abt = new(arr);

        // Access a node
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\nCurrent node: index " + i + " with value " + abt.Val(i));
        Console.WriteLine("Left child: index " + l + " with value " + (abt.Val(l).HasValue ? abt.Val(l) : "null"));
        Console.WriteLine("Right child: index " + r + " with value " + (abt.Val(r).HasValue ? abt.Val(r) : "null"));
        Console.WriteLine("Parent: index " + p + " with value " + (abt.Val(p).HasValue ? abt.Val(p) : "null"));

        // Traverse the tree
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\nLevel-order traversal: " + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("Preorder traversal: " + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("Inorder traversal: " + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("Postorder traversal: " + res.PrintList());
    }
}