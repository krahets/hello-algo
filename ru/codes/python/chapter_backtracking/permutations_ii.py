"""
File: permutations_ii.py
Created Time: 2023-04-15
Author: krahets (krahets@163.com)
"""


def backtrack(
    state: list[int], choices: list[int], selected: list[bool], res: list[list[int]]
):
    """Поиск с возвратом: перестановки II"""
    # Когда длина текущей перестановки равна числу элементов, сохраняем решение
    if len(state) == len(choices):
        res.append(list(state))
        return
    # Перебираем все варианты
    duplicated = set[int]()
    for i, choice in enumerate(choices):
        # Отсечение: нельзя повторно брать тот же элемент или пробовать на этом уровне то же значение
        if not selected[i] and choice not in duplicated:
            # Пробуем вариант и обновляем состояние
            duplicated.add(choice)  # Отмечаем уже выбранные значения
            selected[i] = True
            state.append(choice)
            # Переходим к следующему выбору
            backtrack(state, choices, selected, res)
            # Возврат: отменяем выбор и восстанавливаем прежнее состояние
            selected[i] = False
            state.pop()


def permutations_ii(nums: list[int]) -> list[list[int]]:
    """Перестановки II"""
    res = []
    backtrack(state=[], choices=nums, selected=[False] * len(nums), res=res)
    return res


"""Driver Code"""
if __name__ == "__main__":
    nums = [1, 2, 2]

    res = permutations_ii(nums)

    print(f"Исходный массив nums = {nums}")
    print(f"Все перестановки res = {res}")
