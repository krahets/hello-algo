"""
File: permutations_i.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Поиск с возвратом: перестановки I"""
    # Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Перебираем все варианты
    for i, choice in enumerate(choices):
        # Отсечение: нельзя выбирать один элемент дважды
        if not selected[i]:
            # Пробуем вариант и обновляем состояние
            selected[i] = True
            state.append(choice)
            # Переходим к следующему выбору
            backtrack(state, choices, selected, res)
            # Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = False
            state.pop()


def permutations_i(nums: list[int]) -> list[list[int]]:
    """Перестановки I"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 3]

    res = permutations_i(nums)

    print(f"Исходный массив nums = {nums}")
    print(f"Все перестановки res = {res}")
