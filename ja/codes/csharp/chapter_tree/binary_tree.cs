/**
 * File: binary_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree {
    [Test]
    public void Test() {
        /* 二分木を初期化する */
        // ノードを初期化する
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // ノード間の参照（ポインタ）を設定する
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        Console.WriteLine("\n二分木を初期化する\n");
        PrintUtil.PrintTree(n1);

        /* ノードの挿入と削除 */
        TreeNode P = new(0);
        // n1 -> n2 の間にノード P を挿入する
        n1.left = P;
        P.left = n2;
        Console.WriteLine("\nノード P の挿入後\n");
        PrintUtil.PrintTree(n1);
        // ノード P を削除する
        n1.left = n2;
        Console.WriteLine("\nノード P の削除後\n");
        PrintUtil.PrintTree(n1);
    }
}
