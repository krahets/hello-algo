/**
 * File: preorder_traversal_iii_template.cs
 * Created Time: 2023-04-17
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_backtracking;

public class preorder_traversal_iii_template {
    /* Проверить, является ли текущее состояние решением */
    bool IsSolution(List<TreeNode> state) {
        return state.Count != 0 && state[^1].val == 7;
    }

    /* Записать решение */
    void RecordSolution(List<TreeNode> state, List<List<TreeNode>> res) {
        res.Add(new List<TreeNode>(state));
    }

    /* Проверить, допустим ли этот выбор в текущем состоянии */
    bool IsValid(List<TreeNode> state, TreeNode choice) {
        return choice != null && choice.val != 3;
    }

    /* Обновить состояние */
    void MakeChoice(List<TreeNode> state, TreeNode choice) {
        state.Add(choice);
    }

    /* Восстановить состояние */
    void UndoChoice(List<TreeNode> state, TreeNode choice) {
        state.RemoveAt(state.Count - 1);
    }

    /* Алгоритм бэктрекинга: пример 3 */
    void Backtrack(List<TreeNode> state, List<TreeNode> choices, List<List<TreeNode>> res) {
        // Проверить, является ли текущее состояние решением
        if (IsSolution(state)) {
            // Записать решение
            RecordSolution(state, res);
        }
        // Перебор всех вариантов выбора
        foreach (TreeNode choice in choices) {
            // Отсечение: проверить допустимость выбора
            if (IsValid(state, choice)) {
                // Попытка: сделать выбор и обновить состояние
                MakeChoice(state, choice);
                // Перейти к следующему выбору
                Backtrack(state, [choice.left!, choice.right!], res);
                // Откат: отменить выбор и восстановить предыдущее состояние
                UndoChoice(state, choice);
            }
        }
    }

    [Test]
    public void Test() {
        TreeNode? root = TreeNode.ListToTree([1, 7, 3, 4, 5, 6, 7]);
        Console.WriteLine("\nИнициализация двоичного дерева");
        PrintUtil.PrintTree(root);

        // Алгоритм бэктрекинга
        List<List<TreeNode>> res = [];
        List<TreeNode> choices = [root!];
        Backtrack([], choices, res);

        Console.WriteLine("\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3");
        foreach (List<TreeNode> path in res) {
            PrintUtil.PrintList(path.Select(p => p.val).ToList());
        }
    }
}
