/**
 * File: binary_tree_bfs.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_tree;

public class binary_tree_bfs {

    /* Обход по уровням */
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
                queue.Enqueue(node.left);    // Поместить левого потомка в очередь
            if (node.right != null)
                queue.Enqueue(node.right);   // Поместить правого потомка в очередь
        }
        return list;
    }

    [Test]
    public void Test() {
        /* Инициализировать двоичное дерево */
        // Здесь используется функция, которая напрямую строит двоичное дерево из массива
        TreeNode? root = TreeNode.ListToTree([1, 2, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализировать двоичное дерево\n");
        PrintUtil.PrintTree(root);

        List<int> list = LevelOrder(root!);
        Console.WriteLine("\nПоследовательность узлов при обходе по уровням = " + string.Join(",", list));
    }
}
