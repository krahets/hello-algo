"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Алгоритм бэктрекинга: все перестановки I"""
    # Когда длина состояния равна числу элементов, записать решение
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Перебор всех вариантов выбора
    for i, choice in enumerate(choices):
        # Отсечение: нельзя выбирать один и тот же элемент повторно
        if not selected[i]:
            # Попытка: сделать выбор и обновить состояние
            selected[i] = True
            state.append(choice)
            # Перейти к следующему выбору
            backtrack(state, choices, selected, res)
            # Откат: отменить выбор и восстановить предыдущее состояние
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """Все перестановки I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"Входной массив nums = {nums}")
    print(f"Все перестановки res = {res}")
