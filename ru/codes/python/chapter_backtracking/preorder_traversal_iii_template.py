"""
File: preorder_traversal_iii_template.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import TreeNode, print_tree, list_to_tree


def is_solution(state: list[TreeNode]) -> bool:
    """Проверить, является ли текущее состояние решением"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """Записать решение"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """Проверить, допустим ли этот выбор в текущем состоянии"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """Обновить состояние"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """Восстановить состояние"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """Алгоритм бэктрекинга: пример 3"""
    # Проверить, является ли текущее состояние решением
    if is_solution(state):
        # Записать решение
        record_solution(state, res)
    # Перебор всех вариантов выбора
    for choice in choices:
        # Отсечение: проверить допустимость выбора
        if is_valid(state, choice):
            # Попытка: сделать выбор и обновить состояние
            make_choice(state, choice)
            # Перейти к следующему выбору
            backtrack(state, [choice.left, choice.right], res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            undo_choice(state, choice)


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nИнициализация двоичного дерева")
    print_tree(root)

    # Алгоритм бэктрекинга
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\nВсе пути от корня к узлу 7, в которых путь не содержит узлов со значением 3")
    for path in res:
        print([node.val for node in path])
