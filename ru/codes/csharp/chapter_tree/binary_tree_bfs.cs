/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* Обход по уровням */
    List<int> LevelOrder(TreeNode root) {
        // Создать очередь и добавить корень
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // Создать список для последовательности обхода
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // Извлечь узел из очереди
            list.Add(node.val!.Value);       // Сохранить значение узла
            if (node.left != null)
                queue.Enqueue(node.left);    // Добавить левого потомка в очередь
            if (node.right != null)
                queue.Enqueue(node.right);   // Добавить правого потомка в очередь
        }
        return list;
    }

    [Test]
    public void Test() {
        /* Инициализация двоичного дерева */
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализация двоичного дерева\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\nУзлы в порядке обхода по уровням = " + string.Join(",", list));
    }
}
