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
    # Перебор всех вариантов выбора
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # Отсечение: нельзя выбирать один и тот же элемент повторно и нельзя повторно выбирать равные элементы
        if not selected[i] and choice not in duplicated:
            # Попытка: сделать выбор и обновить состояние
            duplicated.add(choice)  # Записать значения уже выбранных элементов
            selected[i] = True
            state.append(choice)
            # Перейти к следующему выбору
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
