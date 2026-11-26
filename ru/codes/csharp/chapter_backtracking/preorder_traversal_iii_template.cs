/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* Проверяем, является ли текущее состояние решением */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* Сохраняем решение */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* Проверяем, допустим ли выбор в текущем состоянии */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Обновляем состояние */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* Восстанавливаем состояние */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* Поиск с возвратом: пример 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Проверяем, найдено ли решение
        if (IsSolution(state)) {
            // Сохраняем решение
            RecordSolution(state, res);
        }
        // Перебираем все варианты
        foreach (TreeNode choice in choices) {
            // Отсечение: проверяем допустимость выбора
            if (IsValid(state, choice)) {
                // Пробуем вариант и обновляем состояние
                MakeChoice(state, choice);
                // Переходим к следующему выбору
                Backtrack(state, [choice.left!, choice.right!], res);
                // Возврат: отменяем выбор и восстанавливаем прежнее состояние
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nСоздаём двоичное дерево");
        PrintUtil.PrintTree(root);

        // Поиск с возвратом
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
