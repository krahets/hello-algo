/**
* File: array_binary_tree.cs
* Created Time: 2023-07-20
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_tree;

/* Класс двоичного дерева на основе массива */
public class ArrayBinaryTree(List<int?> arr) {
    List<int?> tree = new(arr);

    /* Ёмкость списка */
    public int Size() {
        return tree.Count;
    }

    /* Получить значение узла с индексом i */
    public int? Val(int i) {
        // Если индекс выходит за границы массива, вернуть null — признак пустой позиции
        if (i < 0 || i >= Size())
            return null;
        return tree[i];
    }

    /* Получить индекс левого потомка узла с индексом i */
    public int Left(int i) {
        return 2 * i + 1;
    }

    /* Получить индекс правого потомка узла с индексом i */
    public int Right(int i) {
        return 2 * i + 2;
    }

    /* Получить индекс родителя узла с индексом i */
    public int Parent(int i) {
        return (i - 1) / 2;
    }

    /* Обход по уровням */
    public List<int> LevelOrder() {
        List<int> res = [];
        // Пройти непосредственно по массиву
        for (int i = 0; i < Size(); i++) {
            if (Val(i).HasValue)
                res.Add(Val(i)!.Value);
        }
        return res;
    }

    /* Обход в глубину */
    void DFS(int i, string order, List<int> res) {
        // Если позиция пуста, завершить вызов
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
        // Инициализация двоичного дерева
        // Используем функцию, которая строит двоичное дерево непосредственно из массива
        List<int?> arr = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];

        TreeNode? root = TreeNode.ListToTree(arr);
        Console.WriteLine("\nИнициализация двоичного дерева\n");
        Console.WriteLine("Двоичное дерево в виде массива:");
        Console.WriteLine(arr.PrintList());
        Console.WriteLine("Связное представление двоичного дерева:");
        PrintUtil.PrintTree(root);

        // Класс двоичного дерева на основе массива
        ArrayBinaryTree abt = new(arr);

        // Доступ к узлу
        int i = 1;
        int l = abt.Left(i);
        int r = abt.Right(i);
        int p = abt.Parent(i);
        Console.WriteLine("\nИндекс текущего узла: " + i + " · значение:  " + abt.Val(i));
        Console.WriteLine("Индекс левого потомка: " + l + " · значение:  " + (abt.Val(l).HasValue ? abt.Val(l) : "null"));
        Console.WriteLine("Индекс правого потомка: " + r + " · значение:  " + (abt.Val(r).HasValue ? abt.Val(r) : "null"));
        Console.WriteLine("Индекс родителя: " + p + " · значение:  " + (abt.Val(p).HasValue ? abt.Val(p) : "null"));

        // Обход дерева
        List<int> res = abt.LevelOrder();
        Console.WriteLine("\nОбход по уровням: " + res.PrintList());
        res = abt.PreOrder();
        Console.WriteLine("Прямой обход: " + res.PrintList());
        res = abt.InOrder();
        Console.WriteLine("Симметричный обход: " + res.PrintList());
        res = abt.PostOrder();
        Console.WriteLine("Обратный обход: " + res.PrintList());
    }
}