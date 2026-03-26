"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Алгоритм бэктрекинга: все перестановки II"""
    # Когда длина состояния равна числу элементов, записать решение
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Перебрать все варианты выбора
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # Отсечение: не допускается повторный выбор элемента и не допускается повторный выбор равных элементов
        if not selected[i] and choice not in duplicated:
            # Попытка: сделать выбор и обновить состояние
            duplicated.add(choice)  # Записатьвыбранныеэлементзначение
            selected[i] = True
            state.append(choice)
            # Перейти к следующему варианту выбора
            backtrack(state, choices, selected, res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """Все перестановки II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"Входной массив nums = {nums}")
    print(f"Все перестановки res = {res}")
