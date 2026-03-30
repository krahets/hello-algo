/**
 * File: binary_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree {
    [Test]
    public void Test() {
        /* 二分木を初期化 */
        // ノードを初期化
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // ノード間の参照（ポインタ）を構築する
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        Console.WriteLine("\n二分木を初期化\n");
        PrintUtil.PrintTree(n1);

        /* ノードの挿入と削除 */
        TreeNode P = new(0);
        // n1 -> n2 の間にノード P を挿入
        n1.left = P;
        P.left = n2;
        Console.WriteLine("\nノード P を挿入した後\n");
        PrintUtil.PrintTree(n1);
        // ノード P を削除
        n1.left = n2;
        Console.WriteLine("\nノード P を削除した後\n");
        PrintUtil.PrintTree(n1);
    }
}
