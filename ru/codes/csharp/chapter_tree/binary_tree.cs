/**
 * File: binary_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree {
    [Test]
    public void Test() {
        /* Инициализировать двоичное дерево */
        // Инициализировать узел
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // Построить ссылки между узлами (указатели)
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        Console.WriteLine("\nИнициализировать двоичное дерево\n");
        PrintUtil.PrintTree(n1);

        /* Вставка и удаление узлов */
        TreeNode P = new(0);
        // Вставить узел P между n1 -> n2
        n1.left = P;
        P.left = n2;
        Console.WriteLine("\nвставить узел P после\n");
        PrintUtil.PrintTree(n1);
        // Удалить узел P
        n1.left = n2;
        Console.WriteLine("\nУдалить узел P после\n");
        PrintUtil.PrintTree(n1);
    }
}
