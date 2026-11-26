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
    """Проверяем, является ли текущее состояние решением"""
    return state and state[-1].val == 7


def record_solution(state: list[TreeNode], res: list[list[TreeNode]]):
    """Сохраняем решение"""
    res.append(list(state))


def is_valid(state: list[TreeNode], choice: TreeNode) -> bool:
    """Проверяем, допустим ли выбор в текущем состоянии"""
    return choice is not None and choice.val != 3


def make_choice(state: list[TreeNode], choice: TreeNode):
    """Обновляем состояние"""
    state.append(choice)


def undo_choice(state: list[TreeNode], choice: TreeNode):
    """Восстанавливаем состояние"""
    state.pop()


def backtrack(
    state: list[TreeNode], choices: list[TreeNode], res: list[list[TreeNode]]
):
    """Поиск с возвратом: пример 3"""
    # Проверяем, найдено ли решение
    if is_solution(state):
        # Сохраняем решение
        record_solution(state, res)
    # Перебираем все варианты
    for choice in choices:
        # Отсечение: проверяем допустимость выбора
        if is_valid(state, choice):
            # Пробуем вариант и обновляем состояние
            make_choice(state, choice)
            # Переходим к следующему выбору
            backtrack(state, [choice.left, choice.right], res)
            # Возврат: отменяем выбор и восстанавливаем прежнее состояние
            undo_choice(state, choice)


"""Driver Code"""
if __name__ == "__main__":
    root = list_to_tree([1, 7, 3, 4, 5, 6, 7])
    print("\nСоздаём двоичное дерево")
    print_tree(root)

    # Поиск с возвратом
    res = []
    backtrack(state=[], choices=[root], res=res)

    print("\nВыводим все пути от корня до узлов со значением 7 без узлов со значением 3")
    for path in res:
        print([node.val for node in path])
