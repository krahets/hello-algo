/**
 * File: binary_tree.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree {
    [Test]
    public void Test() {
        // [region]{init_binary_tree}
        /* Инициализация двоичного дерева */
        // Инициализация узла
        TreeNode n1 = new(1);
        TreeNode n2 = new(2);
        TreeNode n3 = new(3);
        TreeNode n4 = new(4);
        TreeNode n5 = new(5);
        // Построить связи между узлами (указатели)
        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        // [endregion]{init_binary_tree}
        Console.WriteLine("\nИнициализация двоичного дерева\n");
        PrintUtil.PrintTree(n1);

        // [region]{insert_node}
        /* Вставка и удаление узлов */
        TreeNode P = new(0);
        // Вставить узел P между n1 -> n2
        n1.left = P;
        P.left = n2;
        // [endregion]{insert_node}
        Console.WriteLine("\nПосле вставки узла P\n");
        PrintUtil.PrintTree(n1);
        // [region]{remove_node}
        // Удалить узел P
        n1.left = n2;
        // [endregion]{remove_node}
        Console.WriteLine("\nПосле удаления узла P\n");
        PrintUtil.PrintTree(n1);
    }
}
