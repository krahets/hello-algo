/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* Обход в ширину */
    List<int> LevelOrder(TreeNode root) {
        // Инициализировать очередь и добавить корневой узел
        Queue<TreeNode> queue = new();
        queue.Enqueue(root);
        // Инициализировать список для хранения последовательности обхода
        List<int> list = [];
        while (queue.Count != 0) {
            TreeNode node = queue.Dequeue(); // Извлечение из очереди
            list.Add(node.val!.Value);       // Сохранить значение узла
            if (node.left != null)
                queue.Enqueue(node.left);    // Поместить левый дочерний узел в очередь
            if (node.right != null)
                queue.Enqueue(node.right);   // Поместить правый дочерний узел в очередь
        }
        return list;
    }

    [Test]
    public void Test() {
        /* Инициализация двоичного дерева */
        // Здесь используется функция, напрямую строящая двоичное дерево из массива
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализация двоичного дерева\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\nПоследовательность печати узлов при обходе в ширину = " + string.Join(",", list));
    }
}
