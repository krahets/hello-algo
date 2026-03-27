/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* Класс двоичного дерева в массивном представлении */
public class ArrayBinaryTree(List<int?> arr) {
    List<int?> tree = new(arr);

    /* Вместимость списка */
    public int Size() {
        return tree.Count;
    }

    /* Получить значение узла с индексом i */
    public int? Val(int i) {
        // Если индекс выходит за границы, вернуть null, обозначающий пустую клетку
        if (i < 0 || i >= Size())
            return null;
        return tree[i];
    }

    /* Получить индекс левого дочернего узла узла с индексом i */
    public int Left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого дочернего узла узла с индексом i */
    public int Right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родительского узла узла с индексом i */
    public int Parent(int i) {
        return (i - 1) / 2;
    }

    /* Обход по уровням */
    public List<int> LevelOrder() {
        List<int> res = [];
        // Непосредственно обойти массив
        for (int i = 0; i < Size(); i++) {
            if (Val(i).HasValue)
                res.Add(Val(i)!.Value);
        }
        return res;
    }

    /* Обход в глубину */
    void DFS(int i, string order, List<int> res) {
        // Если это пустая клетка, вернуть результат
        if (!Val(i).HasValue)
            return;
        // Прямой обход
        if (order == "pre")
            res.Add(Val(i)!.Value);
        DFS(Left(i), order, res);
        // Симметричный обход
        if (order == "in")
            res.Add(Val(i)!.Value);
        DFS(Right(i), order, res);
        // Обратный обход
        if (order == "post")
            res.Add(Val(i)!.Value);
    }

    /* Прямой обход */
    public List<int> PreOrder() {
        List<int> res = [];
        DFS(0, "pre", res);
        return res;
    }

    /* Симметричный обход */
    public List<int> InOrder() {
        List<int> res = [];
        DFS(0, "in", res);
        return res;
    }

    /* Обратный обход */
    public List<int> PostOrder() {
        List<int> res = [];
        DFS(0, "post", res);
        return res;
    }
}

public class array_binary_tree {
    [Test]
    public void Test() {
        // Инициализировать двоичное дерево
        // Здесь используется функция, которая напрямую строит двоичное дерево из массива
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\nИнициализировать двоичное дерево\n");
        Console.WriteLine("Массивное представление двоичного дерева:");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("Связное представление двоичного дерева:");
        PrintUtil.PrintTree(root);

        // Класс двоичного дерева в массивном представлении
        ArrayBinaryTree abt = new(arr);

        // Получить доступ к узлу
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\nИндекс текущего узла равен " + i + ", значение равно" + abt.Val(i));
        Console.WriteLine("Индекс его левого дочернего узла равен " + l + ", значение равно" + (abt.Val(l).HasValue ? abt.Val(l) : "null"));
        Console.WriteLine("Индекс его правого дочернего узла равен " + r + ", значение равно" + (abt.Val(r).HasValue ? abt.Val(r) : "null"));
        Console.WriteLine("Индекс его родительского узла равен " + p + ", значение равно" + (abt.Val(p).HasValue ? abt.Val(p) : "null"));

        // Обойти дерево
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\nРезультат обхода по уровням: " + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("прямой обходравно:" + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("Симметричный обход: " + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("обратный обходравно:" + res.PrintList());
    }
}
